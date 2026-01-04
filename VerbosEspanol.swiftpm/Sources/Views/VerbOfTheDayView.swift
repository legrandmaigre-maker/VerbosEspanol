import SwiftUI

struct VerbOfTheDayView: View {
    @EnvironmentObject var learningManager: LearningManager
    @State private var selectedTense: Tense = .presentIndicative
    
    var verb: Verb {
        learningManager.getVerbOfTheDay()
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // Header card
                    VStack(spacing: 16) {
                        Text("⭐")
                            .font(.system(size: 60))
                        
                        Text("Verbo del Día")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        
                        Text(verb.infinitive.uppercased())
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                        
                        Text(verb.meaning)
                            .font(.title3)
                            .foregroundColor(.secondary)
                        
                        HStack {
                            Label(verb.irregularType.rawValue, systemImage: "tag.fill")
                                .font(.caption)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color.yellow.opacity(0.2))
                                .foregroundColor(.orange)
                                .cornerRadius(12)
                        }
                    }
                    .padding(30)
                    .frame(maxWidth: .infinity)
                    .background(
                        LinearGradient(
                            colors: [Color.orange.opacity(0.1), Color.yellow.opacity(0.1)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .padding(.horizontal)
                    
                    // Example sentences
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Ejemplos de uso")
                            .font(.headline)
                        
                        ExampleSentenceView(
                            spanish: getExampleSentence(for: verb),
                            english: getExampleTranslation(for: verb)
                        )
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(16)
                    .shadow(color: .black.opacity(0.05), radius: 5)
                    .padding(.horizontal)
                    
                    // Tense selector
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Conjugaciones")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(Tense.allCases, id: \.self) { tense in
                                    TenseButton(tense: tense, isSelected: selectedTense == tense) {
                                        selectedTense = tense
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    // Conjugation table
                    ConjugationTableView(verb: verb, tense: selectedTense)
                        .padding(.horizontal)
                    
                    // Practice button
                    NavigationLink(destination: WritingExerciseView()) {
                        Label("Practicar este verbo", systemImage: "pencil.circle.fill")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(16)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
            }
            .navigationTitle("Verbo del Día")
        }
    }
    
    func getExampleSentence(for verb: Verb) -> String {
        let examples: [String: String] = [
            "ser": "Yo soy estudiante de español.",
            "estar": "Estamos muy contentos hoy.",
            "tener": "Tengo muchos libros en casa.",
            "hacer": "¿Qué haces los fines de semana?",
            "poder": "Puedo hablar español muy bien.",
            "ir": "Vamos al cine esta noche.",
            "decir": "¿Qué dices? No te escucho.",
            "saber": "Sé que tú puedes hacerlo.",
            "querer": "Quiero aprender más verbos.",
            "venir": "¿Vienes a la fiesta mañana?"
        ]
        return examples[verb.infinitive] ?? "Yo \(verb.conjugation(tense: .presentIndicative, person: .yo)) todos los días."
    }
    
    func getExampleTranslation(for verb: Verb) -> String {
        let translations: [String: String] = [
            "ser": "I am a Spanish student.",
            "estar": "We are very happy today.",
            "tener": "I have many books at home.",
            "hacer": "What do you do on weekends?",
            "poder": "I can speak Spanish very well.",
            "ir": "We are going to the movies tonight.",
            "decir": "What are you saying? I can't hear you.",
            "saber": "I know that you can do it.",
            "querer": "I want to learn more verbs.",
            "venir": "Are you coming to the party tomorrow?"
        ]
        return translations[verb.infinitive] ?? "I \(verb.meaning.replacingOccurrences(of: "to ", with: "")) every day."
    }
}

struct ExampleSentenceView: View {
    let spanish: String
    let english: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("🇪🇸")
                Text(spanish)
                    .font(.body)
                    .italic()
            }
            
            HStack {
                Text("🇬🇧")
                Text(english)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}
