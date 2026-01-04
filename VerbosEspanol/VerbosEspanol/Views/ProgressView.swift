import SwiftUI
import Charts

struct ProgressView: View {
    @EnvironmentObject var learningManager: LearningManager
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // Overall stats
                    VStack(spacing: 16) {
                        Text("📊")
                            .font(.system(size: 50))
                        
                        Text("Tu Progreso")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    
                    // Stats grid
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ProgressStatCard(
                            title: "Intentos",
                            value: "\(learningManager.totalAttempts)",
                            icon: "number.circle.fill",
                            color: .blue
                        )
                        
                        ProgressStatCard(
                            title: "Correctas",
                            value: "\(learningManager.totalCorrect)",
                            icon: "checkmark.circle.fill",
                            color: .green
                        )
                        
                        ProgressStatCard(
                            title: "Precisión",
                            value: String(format: "%.0f%%", learningManager.accuracy),
                            icon: "target",
                            color: .orange
                        )
                        
                        ProgressStatCard(
                            title: "Dominados",
                            value: "\(learningManager.masteredVerbs.count)/30",
                            icon: "star.fill",
                            color: .yellow
                        )
                    }
                    .padding(.horizontal)
                    
                    // Accuracy chart placeholder
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Progreso por Tiempo")
                            .font(.headline)
                        
                        if #available(iOS 16.0, *) {
                            AccuracyChartView()
                                .frame(height: 200)
                        } else {
                            Text("Gráfico disponible en iOS 16+")
                                .foregroundColor(.secondary)
                                .frame(height: 200)
                        }
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(16)
                    .shadow(color: .black.opacity(0.05), radius: 5)
                    .padding(.horizontal)
                    
                    // Verb mastery list
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Verbos Dominados")
                            .font(.headline)
                        
                        if learningManager.masteredVerbs.isEmpty {
                            Text("¡Sigue practicando para dominar verbos!")
                                .foregroundColor(.secondary)
                                .padding()
                        } else {
                            ForEach(learningManager.verbs.filter { learningManager.masteredVerbs.contains($0.id) }) { verb in
                                HStack {
                                    Text("⭐")
                                    Text(verb.infinitive)
                                        .fontWeight(.medium)
                                    Spacer()
                                    Text(verb.meaning)
                                        .foregroundColor(.secondary)
                                }
                                .padding(.vertical, 4)
                            }
                        }
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(16)
                    .shadow(color: .black.opacity(0.05), radius: 5)
                    .padding(.horizontal)
                    
                    // Tense progress
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Progreso por Tiempo Verbal")
                            .font(.headline)
                        
                        ForEach(Tense.allCases, id: \.self) { tense in
                            TenseProgressRow(tense: tense, progress: getTenseProgress(tense))
                        }
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(16)
                    .shadow(color: .black.opacity(0.05), radius: 5)
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
            }
            .navigationTitle("Progreso")
        }
    }
    
    func getTenseProgress(_ tense: Tense) -> Double {
        // Simulated progress - in real app would calculate from verbProgress
        return Double.random(in: 0.2...1.0)
    }
}

struct ProgressStatCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(color)
            
            Text(value)
                .font(.title)
                .fontWeight(.bold)
            
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 5)
    }
}

struct TenseProgressRow: View {
    let tense: Tense
    let progress: Double
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(tense.emoji)
                Text(tense.rawValue)
                    .font(.subheadline)
                Spacer()
                Text(String(format: "%.0f%%", progress * 100))
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color(.systemGray5))
                        .frame(height: 8)
                        .cornerRadius(4)
                    
                    Rectangle()
                        .fill(Color.orange)
                        .frame(width: geometry.size.width * progress, height: 8)
                        .cornerRadius(4)
                }
            }
            .frame(height: 8)
        }
    }
}

@available(iOS 16.0, *)
struct AccuracyChartView: View {
    let data = [
        (day: "Lun", value: 65.0),
        (day: "Mar", value: 72.0),
        (day: "Mié", value: 68.0),
        (day: "Jue", value: 80.0),
        (day: "Vie", value: 75.0),
        (day: "Sáb", value: 85.0),
        (day: "Dom", value: 90.0)
    ]
    
    var body: some View {
        Chart {
            ForEach(data, id: \.day) { item in
                BarMark(
                    x: .value("Día", item.day),
                    y: .value("Precisión", item.value)
                )
                .foregroundStyle(Color.orange.gradient)
                .cornerRadius(4)
            }
        }
        .chartYScale(domain: 0...100)
        .chartYAxis {
            AxisMarks(position: .leading)
        }
    }
}
