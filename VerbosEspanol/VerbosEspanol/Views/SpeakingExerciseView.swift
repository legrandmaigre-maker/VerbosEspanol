import SwiftUI
import Speech
import AVFoundation

struct SpeakingExerciseView: View {
    @EnvironmentObject var learningManager: LearningManager
    @StateObject private var speechRecognizer = SpeechRecognizer()
    @State private var currentVerb: Verb?
    @State private var currentTense: Tense = .presentIndicative
    @State private var currentPerson: Person = .yo
    @State private var isRecording = false
    @State private var showResult = false
    @State private var isCorrect = false
    @State private var correctAnswer = ""
    @State private var showPermissionAlert = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                if let verb = currentVerb {
                    VStack(spacing: 16) {
                        Text("🎤")
                            .font(.system(size: 60))
                        
                        Text("Di la conjugación de:")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        
                        Text(verb.infinitive.uppercased())
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.purple)
                        
                        Text(verb.meaning)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        HStack(spacing: 20) {
                            VStack {
                                Text("Tiempo").font(.caption).foregroundColor(.secondary)
                                Text(currentTense.rawValue).font(.headline)
                            }
                            Divider().frame(height: 40)
                            VStack {
                                Text("Persona").font(.caption).foregroundColor(.secondary)
                                Text(currentPerson.rawValue).font(.headline)
                            }
                        }
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    
                    VStack(spacing: 16) {
                        if !speechRecognizer.transcript.isEmpty {
                            Text("Tu respuesta:").font(.caption).foregroundColor(.secondary)
                            Text(speechRecognizer.transcript)
                                .font(.title2)
                                .fontWeight(.medium)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color(.systemGray6))
                                .cornerRadius(12)
                        }
                        
                        if let error = speechRecognizer.errorMessage {
                            Text(error).font(.caption).foregroundColor(.red).padding()
                        }
                        
                        Button(action: toggleRecording) {
                            ZStack {
                                Circle()
                                    .fill(isRecording ? Color.red : Color.purple)
                                    .frame(width: 80, height: 80)
                                    .shadow(color: isRecording ? .red.opacity(0.5) : .purple.opacity(0.5), radius: 10)
                                Image(systemName: isRecording ? "stop.fill" : "mic.fill")
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                        }
                        
                        Text(isRecording ? "Grabando... Toca para parar" : "Toca para hablar")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    if showResult {
                        ResultView(isCorrect: isCorrect, correctAnswer: correctAnswer, userAnswer: speechRecognizer.transcript)
                    }
                    
                    HStack(spacing: 16) {
                        if showResult || !speechRecognizer.transcript.isEmpty {
                            Button("Comprobar") { checkAnswer() }
                                .buttonStyle(.borderedProminent)
                                .tint(.green)
                                .disabled(speechRecognizer.transcript.isEmpty)
                        }
                        Button("Siguiente") { nextQuestion() }.buttonStyle(.bordered)
                    }
                }
                Spacer()
                Text("💡 Habla claro y a velocidad normal")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding()
            }
            .padding()
            .navigationTitle("Habla")
            .onAppear {
                generateQuestion()
                requestPermission()
            }
            .alert("Permiso de Micrófono", isPresented: $showPermissionAlert) {
                Button("OK") { }
            } message: {
                Text("Por favor, permite el acceso al micrófono en Configuración.")
            }
        }
    }
    
    private func requestPermission() {
        SFSpeechRecognizer.requestAuthorization { status in
            DispatchQueue.main.async {
                if status != .authorized { showPermissionAlert = true }
            }
        }
        AVAudioSession.sharedInstance().requestRecordPermission { granted in
            DispatchQueue.main.async {
                if !granted { showPermissionAlert = true }
            }
        }
    }
    
    private func toggleRecording() {
        if isRecording {
            speechRecognizer.stopTranscribing()
            isRecording = false
        } else {
            speechRecognizer.resetTranscript()
            speechRecognizer.startTranscribing()
            isRecording = true
            showResult = false
        }
    }
    
    private func generateQuestion() {
        currentVerb = learningManager.getRandomVerb()
        currentTense = learningManager.getRandomTense()
        currentPerson = learningManager.getRandomPerson()
        speechRecognizer.resetTranscript()
        showResult = false
    }
    
    private func checkAnswer() {
        guard let verb = currentVerb else { return }
        correctAnswer = verb.conjugation(tense: currentTense, person: currentPerson)
        isCorrect = learningManager.checkAnswer(verb: verb, tense: currentTense, person: currentPerson, userAnswer: speechRecognizer.transcript)
        showResult = true
    }
    
    private func nextQuestion() { generateQuestion() }
}

class SpeechRecognizer: ObservableObject {
    @Published var transcript = ""
    @Published var errorMessage: String?
    
    private var audioEngine: AVAudioEngine?
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "es-ES"))
    
    func startTranscribing() {
        resetTranscript()
        
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playAndRecord, mode: .measurement, options: [.defaultToSpeaker, .allowBluetooth])
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            DispatchQueue.main.async { self.errorMessage = "Error de audio: \(error.localizedDescription)" }
            return
        }
        
        audioEngine = AVAudioEngine()
        guard let audioEngine = audioEngine else { return }
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        guard let recognitionRequest = recognitionRequest else { return }
        recognitionRequest.shouldReportPartialResults = true
        
        let inputNode = audioEngine.inputNode
        let recordingFormat = AVAudioFormat(standardFormatWithSampleRate: 44100, channels: 1)!
        
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
            recognitionRequest.append(buffer)
        }
        
        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch {
            DispatchQueue.main.async { self.errorMessage = "No se pudo iniciar: \(error.localizedDescription)" }
            return
        }
        
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest) { [weak self] result, error in
            if let result = result {
                DispatchQueue.main.async { self?.transcript = result.bestTranscription.formattedString }
            }
            if let error = error, (error as NSError).code != 216 {
                DispatchQueue.main.async { self?.errorMessage = "Error: \(error.localizedDescription)" }
            }
        }
    }
    
    func stopTranscribing() {
        audioEngine?.stop()
        audioEngine?.inputNode.removeTap(onBus: 0)
        recognitionRequest?.endAudio()
        recognitionTask?.cancel()
        try? AVAudioSession.sharedInstance().setActive(false, options: .notifyOthersOnDeactivation)
        audioEngine = nil
        recognitionRequest = nil
        recognitionTask = nil
    }
    
    func resetTranscript() {
        transcript = ""
        errorMessage = nil
    }
}
