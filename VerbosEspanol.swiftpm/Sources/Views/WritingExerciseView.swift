import SwiftUI

struct WritingExerciseView: View {
    @EnvironmentObject var learningManager: LearningManager
    @State private var currentVerb: Verb?
    @State private var currentTense: Tense = .presentIndicative
    @State private var currentPerson: Person = .yo
    @State private var userAnswer = ""
    @State private var showResult = false
    @State private var isCorrect = false
    @State private var correctAnswer = ""
    @State private var questionsAnswered = 0
    @State private var correctAnswers = 0
    @State private var selectedTenses: Set<Tense> = Set(Tense.allCases)
    @State private var showSettings = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Progress bar
                ProgressSection(questionsAnswered: questionsAnswered, correctAnswers: correctAnswers)
                
                if let verb = currentVerb {
                    // Verb display
                    VerbDisplayCard(verb: verb, tense: currentTense, person: currentPerson)
                    
                    // Answer input
                    VStack(spacing: 16) {
                        TextField("Escribe la conjugación...", text: $userAnswer)
                            .textFieldStyle(.roundedBorder)
                            .font(.title2)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .disabled(showResult)
                            .onSubmit { checkAnswer() }
                        
                        if showResult {
                            ResultView(isCorrect: isCorrect, correctAnswer: correctAnswer, userAnswer: userAnswer)
                        }
                        
                        // Action buttons
                        HStack(spacing: 16) {
                            if showResult {
                                Button("Siguiente") {
                                    nextQuestion()
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(.orange)
                            } else {
                                Button("Comprobar") {
                                    checkAnswer()
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(.green)
                                .disabled(userAnswer.isEmpty)
                            }
                            
                            Button("Saltar") {
                                nextQuestion()
                            }
                            .buttonStyle(.bordered)
                        }
                        .font(.headline)
                    }
                    .padding()
                }
                
                Spacer()
                
                // Tips section
                TipsSection()
            }
            .padding()
            .navigationTitle("Escritura")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showSettings.toggle() }) {
                        Image(systemName: "gearshape")
                    }
                }
            }
            .sheet(isPresented: $showSettings) {
                TenseSelectionView(selectedTenses: $selectedTenses)
            }
            .onAppear {
                generateQuestion()
            }
        }
    }
    
    private func generateQuestion() {
        currentVerb = learningManager.getRandomVerb()
        let availableTenses = Array(selectedTenses)
        currentTense = availableTenses.randomElement() ?? .presentIndicative
        currentPerson = learningManager.getRandomPerson()
        userAnswer = ""
        showResult = false
    }
    
    private func checkAnswer() {
        guard let verb = currentVerb else { return }
        correctAnswer = verb.conjugation(tense: currentTense, person: currentPerson)
        isCorrect = learningManager.checkAnswer(verb: verb, tense: currentTense, person: currentPerson, userAnswer: userAnswer)
        
        questionsAnswered += 1
        if isCorrect {
            correctAnswers += 1
        }
        showResult = true
    }
    
    private func nextQuestion() {
        generateQuestion()
    }
}

struct ProgressSection: View {
    let questionsAnswered: Int
    let correctAnswers: Int
    
    var accuracy: Int {
        guard questionsAnswered > 0 else { return 0 }
        return Int(Double(correctAnswers) / Double(questionsAnswered) * 100)
    }
    
    var body: some View {
        HStack {
            Label("\(questionsAnswered)", systemImage: "questionmark.circle")
            Spacer()
            Label("\(correctAnswers)", systemImage: "checkmark.circle.fill")
                .foregroundColor(.green)
            Spacer()
            Label("\(accuracy)%", systemImage: "percent")
                .foregroundColor(.orange)
        }
        .font(.headline)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

struct VerbDisplayCard: View {
    let verb: Verb
    let tense: Tense
    let person: Person
    
    var body: some View {
        VStack(spacing: 12) {
            Text(verb.infinitive.uppercased())
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.orange)
            
            Text(verb.meaning)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Divider()
            
            HStack {
                Label(tense.rawValue, systemImage: "clock")
                Spacer()
                Label(person.rawValue, systemImage: "person")
            }
            .font(.headline)
            .foregroundColor(.primary)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.1), radius: 5)
    }
}

struct ResultView: View {
    let isCorrect: Bool
    let correctAnswer: String
    let userAnswer: String
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                Text(isCorrect ? "¡Correcto!" : "Incorrecto")
            }
            .font(.title2)
            .foregroundColor(isCorrect ? .green : .red)
            
            if !isCorrect {
                Text("Respuesta correcta: \(correctAnswer)")
                    .font(.headline)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(isCorrect ? Color.green.opacity(0.1) : Color.red.opacity(0.1))
        .cornerRadius(12)
    }
}

struct TipsSection: View {
    let tips = [
        "💡 Los verbos irregulares más comunes son: ser, estar, ir, tener, hacer",
        "💡 El pretérito indefinido se usa para acciones completadas",
        "💡 El subjuntivo expresa deseos, dudas o emociones",
        "💡 Practica un poco cada día para mejores resultados"
    ]
    
    var body: some View {
        Text(tips.randomElement() ?? tips[0])
            .font(.caption)
            .foregroundColor(.secondary)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
    }
}

struct TenseSelectionView: View {
    @Binding var selectedTenses: Set<Tense>
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(Tense.allCases, id: \.self) { tense in
                    Button {
                        if selectedTenses.contains(tense) {
                            if selectedTenses.count > 1 {
                                selectedTenses.remove(tense)
                            }
                        } else {
                            selectedTenses.insert(tense)
                        }
                    } label: {
                        HStack {
                            Text(tense.emoji)
                            Text(tense.rawValue)
                            Spacer()
                            if selectedTenses.contains(tense) {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.orange)
                            }
                        }
                    }
                    .foregroundColor(.primary)
                }
            }
            .navigationTitle("Seleccionar Tiempos")
            .toolbar {
                Button("Listo") { dismiss() }
            }
        }
    }
}
