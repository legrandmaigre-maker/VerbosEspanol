import SwiftUI

struct FlashcardView: View {
    @EnvironmentObject var learningManager: LearningManager
    @State private var currentIndex = 0
    @State private var isFlipped = false
    @State private var cardOffset: CGFloat = 0
    @State private var currentVerb: Verb?
    @State private var currentTense: Tense = .presentIndicative
    @State private var currentPerson: Person = .yo
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                // Progress
                Text("Tarjeta \(currentIndex + 1)")
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                // Flashcard
                ZStack {
                    if let verb = currentVerb {
                        // Back of card (answer)
                        FlashcardBack(verb: verb, tense: currentTense, person: currentPerson)
                            .opacity(isFlipped ? 1 : 0)
                            .rotation3DEffect(.degrees(isFlipped ? 0 : 180), axis: (x: 0, y: 1, z: 0))
                        
                        // Front of card (question)
                        FlashcardFront(verb: verb, tense: currentTense, person: currentPerson)
                            .opacity(isFlipped ? 0 : 1)
                            .rotation3DEffect(.degrees(isFlipped ? -180 : 0), axis: (x: 0, y: 1, z: 0))
                    }
                }
                .frame(height: 300)
                .offset(x: cardOffset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            cardOffset = value.translation.width
                        }
                        .onEnded { value in
                            if abs(value.translation.width) > 100 {
                                withAnimation(.spring()) {
                                    cardOffset = value.translation.width > 0 ? 500 : -500
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    nextCard()
                                }
                            } else {
                                withAnimation(.spring()) {
                                    cardOffset = 0
                                }
                            }
                        }
                )
                .onTapGesture {
                    withAnimation(.spring()) {
                        isFlipped.toggle()
                    }
                }
                
                // Instructions
                VStack(spacing: 8) {
                    Text("Toca para voltear")
                        .font(.subheadline)
                    Text("Desliza para siguiente")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                // Buttons
                HStack(spacing: 40) {
                    Button(action: { markAndNext(correct: false) }) {
                        VStack {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.red)
                            Text("No lo sé")
                                .font(.caption)
                        }
                    }
                    
                    Button(action: { markAndNext(correct: true) }) {
                        VStack {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.green)
                            Text("Lo sé")
                                .font(.caption)
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Tarjetas")
            .onAppear {
                generateCard()
            }
        }
    }
    
    private func generateCard() {
        currentVerb = learningManager.getRandomVerb()
        currentTense = learningManager.getRandomTense()
        currentPerson = learningManager.getRandomPerson()
        isFlipped = false
        cardOffset = 0
    }
    
    private func nextCard() {
        currentIndex += 1
        generateCard()
    }
    
    private func markAndNext(correct: Bool) {
        if let verb = currentVerb {
            learningManager.updateProgress(for: verb, tense: currentTense, person: currentPerson, correct: correct)
        }
        nextCard()
    }
}

struct FlashcardFront: View {
    let verb: Verb
    let tense: Tense
    let person: Person
    
    var body: some View {
        VStack(spacing: 20) {
            Text("❓")
                .font(.system(size: 50))
            
            Text(verb.infinitive.uppercased())
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.orange)
            
            Text(verb.meaning)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Divider()
            
            VStack(spacing: 8) {
                Text(tense.rawValue)
                    .font(.headline)
                Text(person.rawValue)
                    .font(.title2)
                    .foregroundColor(.purple)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(30)
        .background(Color(.systemBackground))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.2), radius: 10)
    }
}

struct FlashcardBack: View {
    let verb: Verb
    let tense: Tense
    let person: Person
    
    var body: some View {
        VStack(spacing: 20) {
            Text("✅")
                .font(.system(size: 50))
            
            Text(verb.conjugation(tense: tense, person: person))
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.green)
            
            Divider()
            
            VStack(spacing: 4) {
                Text("\(person.rawValue) \(verb.conjugation(tense: tense, person: person))")
                    .font(.title3)
                
                Text("(\(verb.infinitive) - \(tense.rawValue))")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(30)
        .background(Color(.systemBackground))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.2), radius: 10)
    }
}
