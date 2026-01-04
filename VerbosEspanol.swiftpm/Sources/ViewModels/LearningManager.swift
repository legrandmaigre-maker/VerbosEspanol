import SwiftUI
import Combine

class LearningManager: ObservableObject {
    @Published var verbs: [Verb] = VerbData.top30Verbs
    @Published var streak: Int = 0
    @Published var totalCorrect: Int = 0
    @Published var totalAttempts: Int = 0
    @Published var masteredVerbs: Set<UUID> = []
    @Published var verbProgress: [UUID: VerbProgress] = [:]
    
    var accuracy: Double {
        guard totalAttempts > 0 else { return 0 }
        return Double(totalCorrect) / Double(totalAttempts) * 100
    }
    
    func checkAnswer(verb: Verb, tense: Tense, person: Person, userAnswer: String) -> Bool {
        let correctAnswer = verb.conjugation(tense: tense, person: person)
        let isCorrect = userAnswer.lowercased().trimmingCharacters(in: .whitespaces) == correctAnswer.lowercased()
        
        totalAttempts += 1
        if isCorrect {
            totalCorrect += 1
            updateProgress(for: verb, tense: tense, person: person, correct: true)
        } else {
            updateProgress(for: verb, tense: tense, person: person, correct: false)
        }
        
        return isCorrect
    }
    
    func updateProgress(for verb: Verb, tense: Tense, person: Person, correct: Bool) {
        var progress = verbProgress[verb.id] ?? VerbProgress(verbId: verb.id)
        progress.updateAttempt(tense: tense, person: person, correct: correct)
        verbProgress[verb.id] = progress
        
        if progress.isMastered {
            masteredVerbs.insert(verb.id)
        }
    }
    
    func getRandomVerb() -> Verb {
        verbs.randomElement() ?? verbs[0]
    }
    
    func getRandomTense() -> Tense {
        Tense.allCases.randomElement() ?? .presentIndicative
    }
    
    func getRandomPerson() -> Person {
        Person.allCases.randomElement() ?? .yo
    }
    
    func getVerbOfTheDay() -> Verb {
        let dayOfYear = Calendar.current.ordinality(of: .day, in: .year, for: Date()) ?? 1
        let index = dayOfYear % verbs.count
        return verbs[index]
    }
    
    func incrementStreak() {
        streak += 1
    }
}

struct VerbProgress: Codable {
    let verbId: UUID
    var correctCount: Int = 0
    var attemptCount: Int = 0
    var tenseMastery: [String: Int] = [:]
    
    var accuracy: Double {
        guard attemptCount > 0 else { return 0 }
        return Double(correctCount) / Double(attemptCount) * 100
    }
    
    var isMastered: Bool {
        accuracy >= 80 && attemptCount >= 10
    }
    
    mutating func updateAttempt(tense: Tense, person: Person, correct: Bool) {
        attemptCount += 1
        if correct {
            correctCount += 1
            let key = "\(tense.rawValue)-\(person.rawValue)"
            tenseMastery[key, default: 0] += 1
        }
    }
}
