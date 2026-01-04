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
                    // Verb Card
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
                                Text("Tiempo")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Text(currentTense.rawValue)
                                    .font(.headline)
                            }
                            
                            Divider().frame(height: 40)
                            
                            VStack {
                                Text("Persona")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Text(currentPerson.rawValue)
                                    .font(.headline)
                            }
                        }
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    
                    // Recording section
                    VStack(spacing: 16) {
                        // Recognized text
                        if !speechRecognizer.transcript.isEmpty {
                            Text("Tu respuesta:")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            
                            Text(speechRecognizer.transcript)
                                .font(.title2)
                                .fontWeight(.medium)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color(.systemGray6))
                                .cornerRadius(12)
                        }
                        
                        // Recording button
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
                        .scaleEffect(isRecording ? 1.1 : 1.0)
                        .animation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: isRecording)
                        
                        Text(isRecording ? "Grabando... Toca para parar" : "Toca para hablar")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    // Result
                    if showResult {
                        ResultView(isCorrect: isCorrect, correctAnswer: correctAnswer, userAnswer: speechRecognizer.transcript)
                    }
                    
                    // Buttons
                    HStack(spacing: 16) {
                        if showResult || !speechRecognizer.transcript.isEmpty {
                            Button("Comprobar") {
                                checkAnswer()
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.green)
                            .disabled(speechRecognizer.transcript.isEmpty)
                        }
                        
                        Button("Siguiente") {
                            nextQuestion()
                        }
                        .buttonStyle(.bordered)
                    }
                }
                
                Spacer()
                
                // Pronunciation tip
                Text("💡 Habla claro y a velocidad normal para mejores resultados")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
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
                Text("Por favor, permite el acceso al micrófono en Configuración para usar esta función.")
            }
        }
    }
    
    private func requestPermission() {
        SFSpeechRecognizer.requestAuthorization { status in
            DispatchQueue.main.async {
                if status != .authorized {
                    showPermissionAlert = true
                }
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
    
    private func nextQuestion() {
        generateQuestion()
    }
}

class SpeechRecognizer: ObservableObject {
    @Published var transcript = ""
    
    private var audioEngine: AVAudioEngine?
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "es-ES"))
    
    func startTranscribing() {
        resetTranscript()
        
        audioEngine = AVAudioEngine()
        guard let audioEngine = audioEngine else { return }
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        guard let recognitionRequest = recognitionRequest else { return }
        
        recognitionRequest.shouldReportPartialResults = true
        
        let inputNode = audioEngine.inputNode
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
            recognitionRequest.append(buffer)
        }
        
        audioEngine.prepare()
        
        do {
            try audioEngine.start()
        } catch {
            print("Audio engine failed: \(error)")
            return
        }
        
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest) { [weak self] result, error in
            if let result = result {
                DispatchQueue.main.async {
                    self?.transcript = result.bestTranscription.formattedString
                }
            }
        }
    }
    
    func stopTranscribing() {
        audioEngine?.stop()
        audioEngine?.inputNode.removeTap(onBus: 0)
        recognitionRequest?.endAudio()
        recognitionTask?.cancel()
    }
    
    func resetTranscript() {
        transcript = ""
    }
}
