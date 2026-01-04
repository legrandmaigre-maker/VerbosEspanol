import Foundation

struct Verb: Identifiable, Codable, Hashable {
    let id: UUID
    let infinitive: String
    let meaning: String
    let irregularType: IrregularType
    let conjugations: [Tense: [Person: String]]
    
    init(id: UUID = UUID(), infinitive: String, meaning: String, irregularType: IrregularType, conjugations: [Tense: [Person: String]]) {
        self.id = id
        self.infinitive = infinitive
        self.meaning = meaning
        self.irregularType = irregularType
        self.conjugations = conjugations
    }
    
    func conjugation(tense: Tense, person: Person) -> String {
        return conjugations[tense]?[person] ?? ""
    }
}

enum Tense: String, CaseIterable, Codable, Hashable {
    case presentIndicative = "Presente"
    case preterite = "Pretérito Indefinido"
    case imperfect = "Pretérito Imperfecto"
    case future = "Futuro"
    case conditional = "Condicional"
    case presentSubjunctive = "Subjuntivo Presente"
    case imperfectSubjunctive = "Subjuntivo Imperfecto"
    case imperative = "Imperativo"
    
    var description: String { rawValue }
    var emoji: String {
        switch self {
        case .presentIndicative: return "🎯"
        case .preterite: return "⏮️"
        case .imperfect: return "🔄"
        case .future: return "🔮"
        case .conditional: return "🤔"
        case .presentSubjunctive: return "💭"
        case .imperfectSubjunctive: return "🌙"
        case .imperative: return "📢"
        }
    }
}

enum Person: String, CaseIterable, Codable, Hashable {
    case yo = "yo"
    case tu = "tú"
    case elElla = "él/ella/usted"
    case nosotros = "nosotros"
    case vosotros = "vosotros"
    case ellosEllas = "ellos/ellas/ustedes"
}

enum IrregularType: String, Codable, Hashable {
    case regular = "Regular"
    case stemChanging = "Cambio de raíz"
    case irregular = "Irregular"
    case reflexive = "Reflexivo"
}
