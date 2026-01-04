import SwiftUI

struct VerbListView: View {
    @EnvironmentObject var learningManager: LearningManager
    @State private var searchText = ""
    @State private var selectedFilter: IrregularType? = nil
    
    var filteredVerbs: [Verb] {
        var verbs = learningManager.verbs
        if !searchText.isEmpty {
            verbs = verbs.filter { 
                $0.infinitive.localizedCaseInsensitiveContains(searchText) ||
                $0.meaning.localizedCaseInsensitiveContains(searchText)
            }
        }
        if let filter = selectedFilter {
            verbs = verbs.filter { $0.irregularType == filter }
        }
        return verbs
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Filter chips
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        FilterChip(title: "Todos", isSelected: selectedFilter == nil) {
                            selectedFilter = nil
                        }
                        ForEach([IrregularType.regular, .irregular, .stemChanging], id: \.self) { type in
                            FilterChip(title: type.rawValue, isSelected: selectedFilter == type) {
                                selectedFilter = type
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                }
                .background(Color(.systemGray6))
                
                List(filteredVerbs) { verb in
                    NavigationLink(destination: VerbDetailView(verb: verb)) {
                        VerbRowView(verb: verb)
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Verbos")
            .searchable(text: $searchText, prompt: "Buscar verbos...")
        }
    }
}

struct FilterChip: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(isSelected ? Color.orange : Color(.systemBackground))
                .foregroundColor(isSelected ? .white : .primary)
                .cornerRadius(20)
        }
    }
}

struct VerbRowView: View {
    let verb: Verb
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(verb.infinitive)
                    .font(.headline)
                    .foregroundColor(.orange)
                
                Text(verb.meaning)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Text(verb.irregularType.rawValue)
                .font(.caption)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(irregularTypeColor(verb.irregularType).opacity(0.2))
                .foregroundColor(irregularTypeColor(verb.irregularType))
                .cornerRadius(8)
        }
        .padding(.vertical, 4)
    }
    
    func irregularTypeColor(_ type: IrregularType) -> Color {
        switch type {
        case .regular: return .green
        case .irregular: return .red
        case .stemChanging: return .purple
        case .reflexive: return .blue
        }
    }
}

struct VerbDetailView: View {
    let verb: Verb
    @State private var selectedTense: Tense = .presentIndicative
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 8) {
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
                            .background(Color.orange.opacity(0.2))
                            .foregroundColor(.orange)
                            .cornerRadius(12)
                    }
                }
                .padding()
                
                // Tense selector
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
                
                // Conjugation table
                ConjugationTableView(verb: verb, tense: selectedTense)
                    .padding(.horizontal)
            }
        }
        .navigationTitle(verb.infinitive)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TenseButton: View {
    let tense: Tense
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Text(tense.emoji)
                    .font(.title2)
                Text(tense.rawValue)
                    .font(.caption)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
            }
            .frame(width: 80, height: 70)
            .background(isSelected ? Color.orange : Color(.systemGray6))
            .foregroundColor(isSelected ? .white : .primary)
            .cornerRadius(12)
        }
    }
}

struct ConjugationTableView: View {
    let verb: Verb
    let tense: Tense
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(Person.allCases, id: \.self) { person in
                HStack {
                    Text(person.rawValue)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .frame(width: 120, alignment: .leading)
                    
                    Spacer()
                    
                    Text(verb.conjugation(tense: tense, person: person))
                        .font(.headline)
                        .foregroundColor(.orange)
                }
                .padding()
                .background(Person.allCases.firstIndex(of: person)! % 2 == 0 ? Color(.systemBackground) : Color(.systemGray6))
            }
        }
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(.systemGray4), lineWidth: 1)
        )
    }
}
