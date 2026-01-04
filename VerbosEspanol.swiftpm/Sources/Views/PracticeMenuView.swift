import SwiftUI

struct PracticeMenuView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Header
                    VStack(spacing: 8) {
                        Text("🎯")
                            .font(.system(size: 60))
                        Text("Elige tu modo de práctica")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 20)
                    
                    // Practice modes
                    VStack(spacing: 16) {
                        NavigationLink(destination: WritingExerciseView()) {
                            PracticeModeCard(
                                title: "Escritura",
                                description: "Escribe las conjugaciones correctas",
                                icon: "pencil.circle.fill",
                                color: .green,
                                difficulty: "Intermedio"
                            )
                        }
                        .buttonStyle(.plain)
                        
                        NavigationLink(destination: SpeakingExerciseView()) {
                            PracticeModeCard(
                                title: "Habla",
                                description: "Practica tu pronunciación",
                                icon: "mic.circle.fill",
                                color: .purple,
                                difficulty: "Avanzado"
                            )
                        }
                        .buttonStyle(.plain)
                        
                        NavigationLink(destination: FlashcardView()) {
                            PracticeModeCard(
                                title: "Tarjetas",
                                description: "Repaso rápido con flashcards",
                                icon: "rectangle.stack.fill",
                                color: .orange,
                                difficulty: "Fácil"
                            )
                        }
                        .buttonStyle(.plain)
                        
                        NavigationLink(destination: MultipleChoiceView()) {
                            PracticeModeCard(
                                title: "Opción Múltiple",
                                description: "Elige la respuesta correcta",
                                icon: "list.bullet.circle.fill",
                                color: .blue,
                                difficulty: "Fácil"
                            )
                        }
                        .buttonStyle(.plain)
                        
                        NavigationLink(destination: FillInBlankView()) {
                            PracticeModeCard(
                                title: "Completa la Frase",
                                description: "Rellena el espacio en blanco",
                                icon: "text.bubble.fill",
                                color: .teal,
                                difficulty: "Intermedio"
                            )
                        }
                        .buttonStyle(.plain)
                        
                        NavigationLink(destination: SpeedChallengeView()) {
                            PracticeModeCard(
                                title: "Desafío de Velocidad",
                                description: "¡Responde lo más rápido posible!",
                                icon: "bolt.circle.fill",
                                color: .red,
                                difficulty: "Experto"
                            )
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Practicar")
        }
    }
}

struct PracticeModeCard: View {
    let title: String
    let description: String
    let icon: String
    let color: Color
    let difficulty: String
    
    var difficultyColor: Color {
        switch difficulty {
        case "Fácil": return .green
        case "Intermedio": return .orange
        case "Avanzado": return .purple
        case "Experto": return .red
        default: return .gray
        }
    }
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 44))
                .foregroundColor(color)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(difficulty)
                    .font(.caption)
                    .fontWeight(.medium)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 2)
                    .background(difficultyColor.opacity(0.2))
                    .foregroundColor(difficultyColor)
                    .cornerRadius(4)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

// Additional practice views
struct MultipleChoiceView: View {
    @EnvironmentObject var learningManager: LearningManager
    @State private var currentVerb: Verb?
    @State private var currentTense: Tense = .presentIndicative
    @State private var currentPerson: Person = .yo
    @State private var options: [String] = []
    @State private var correctAnswer = ""
    @State private var selectedAnswer: String? = nil
    @State private var showResult = false
    
    var body: some View {
        VStack(spacing: 24) {
            if let verb = currentVerb {
                VerbDisplayCard(verb: verb, tense: currentTense, person: currentPerson)
                
                VStack(spacing: 12) {
                    ForEach(options, id: \.self) { option in
                        Button(action: { selectAnswer(option) }) {
                            Text(option)
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(backgroundColor(for: option))
                                .foregroundColor(foregroundColor(for: option))
                                .cornerRadius(12)
                        }
                        .disabled(showResult)
                    }
                }
                .padding()
                
                if showResult {
                    Button("Siguiente") {
                        generateQuestion()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.orange)
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Opción Múltiple")
        .onAppear { generateQuestion() }
    }
    
    private func backgroundColor(for option: String) -> Color {
        guard showResult else { return Color(.systemGray5) }
        if option == correctAnswer { return .green }
        if option == selectedAnswer && option != correctAnswer { return .red }
        return Color(.systemGray5)
    }
    
    private func foregroundColor(for option: String) -> Color {
        guard showResult else { return .primary }
        if option == correctAnswer || option == selectedAnswer { return .white }
        return .primary
    }
    
    private func selectAnswer(_ answer: String) {
        selectedAnswer = answer
        showResult = true
        learningManager.checkAnswer(verb: currentVerb!, tense: currentTense, person: currentPerson, userAnswer: answer)
    }
    
    private func generateQuestion() {
        currentVerb = learningManager.getRandomVerb()
        currentTense = learningManager.getRandomTense()
        currentPerson = learningManager.getRandomPerson()
        correctAnswer = currentVerb!.conjugation(tense: currentTense, person: currentPerson)
        
        var wrongOptions = learningManager.verbs
            .filter { $0.id != currentVerb!.id }
            .shuffled()
            .prefix(3)
            .map { $0.conjugation(tense: currentTense, person: currentPerson) }
        
        options = ([correctAnswer] + wrongOptions).shuffled()
        selectedAnswer = nil
        showResult = false
    }
}

struct FillInBlankView: View {
    @EnvironmentObject var learningManager: LearningManager
    @State private var currentVerb: Verb?
    @State private var currentTense: Tense = .presentIndicative
    @State private var currentPerson: Person = .yo
    @State private var userAnswer = ""
    @State private var showResult = false
    @State private var isCorrect = false
    
    var sentence: String {
        guard let verb = currentVerb else { return "" }
        let conjugation = verb.conjugation(tense: currentTense, person: currentPerson)
        return "\(currentPerson.rawValue.capitalized) _____ todos los días. (\(verb.infinitive))"
    }
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Completa la frase:")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Text(sentence)
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()
            
            TextField("Tu respuesta", text: $userAnswer)
                .textFieldStyle(.roundedBorder)
                .font(.title2)
                .autocapitalization(.none)
                .disabled(showResult)
            
            if showResult {
                ResultView(
                    isCorrect: isCorrect,
                    correctAnswer: currentVerb!.conjugation(tense: currentTense, person: currentPerson),
                    userAnswer: userAnswer
                )
            }
            
            HStack {
                Button(showResult ? "Siguiente" : "Comprobar") {
                    if showResult {
                        generateQuestion()
                    } else {
                        checkAnswer()
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(showResult ? .orange : .green)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Completa la Frase")
        .onAppear { generateQuestion() }
    }
    
    private func generateQuestion() {
        currentVerb = learningManager.getRandomVerb()
        currentTense = learningManager.getRandomTense()
        currentPerson = learningManager.getRandomPerson()
        userAnswer = ""
        showResult = false
    }
    
    private func checkAnswer() {
        isCorrect = learningManager.checkAnswer(verb: currentVerb!, tense: currentTense, person: currentPerson, userAnswer: userAnswer)
        showResult = true
    }
}

struct SpeedChallengeView: View {
    @EnvironmentObject var learningManager: LearningManager
    @State private var currentVerb: Verb?
    @State private var currentTense: Tense = .presentIndicative
    @State private var currentPerson: Person = .yo
    @State private var userAnswer = ""
    @State private var score = 0
    @State private var timeRemaining = 60
    @State private var isActive = false
    @State private var timer: Timer?
    
    var body: some View {
        VStack(spacing: 20) {
            // Timer and Score
            HStack {
                Label("\(timeRemaining)s", systemImage: "clock.fill")
                    .font(.title2)
                    .foregroundColor(timeRemaining <= 10 ? .red : .primary)
                
                Spacer()
                
                Label("\(score)", systemImage: "star.fill")
                    .font(.title2)
                    .foregroundColor(.orange)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            
            if isActive {
                if let verb = currentVerb {
                    VerbDisplayCard(verb: verb, tense: currentTense, person: currentPerson)
                    
                    TextField("¡Rápido!", text: $userAnswer)
                        .textFieldStyle(.roundedBorder)
                        .font(.title2)
                        .autocapitalization(.none)
                        .onSubmit { checkAndNext() }
                }
            } else {
                VStack(spacing: 20) {
                    if timeRemaining == 0 {
                        Text("🎉 ¡Tiempo!")
                            .font(.largeTitle)
                        Text("Puntuación: \(score)")
                            .font(.title)
                            .foregroundColor(.orange)
                    }
                    
                    Button(timeRemaining == 0 ? "Jugar de nuevo" : "¡Comenzar!") {
                        startGame()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.orange)
                    .font(.headline)
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Desafío")
        .onDisappear { timer?.invalidate() }
    }
    
    private func startGame() {
        score = 0
        timeRemaining = 60
        isActive = true
        generateQuestion()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                isActive = false
                timer?.invalidate()
            }
        }
    }
    
    private func generateQuestion() {
        currentVerb = learningManager.getRandomVerb()
        currentTense = learningManager.getRandomTense()
        currentPerson = learningManager.getRandomPerson()
        userAnswer = ""
    }
    
    private func checkAndNext() {
        if learningManager.checkAnswer(verb: currentVerb!, tense: currentTense, person: currentPerson, userAnswer: userAnswer) {
            score += 1
        }
        generateQuestion()
    }
}
