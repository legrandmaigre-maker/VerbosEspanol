import SwiftUI

struct ContentView: View {
    @EnvironmentObject var learningManager: LearningManager
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Inicio", systemImage: "house.fill")
                }
                .tag(0)
            
            VerbListView()
                .tabItem {
                    Label("Verbos", systemImage: "book.fill")
                }
                .tag(1)
            
            PracticeMenuView()
                .tabItem {
                    Label("Practicar", systemImage: "pencil.and.outline")
                }
                .tag(2)
            
            ProgressView()
                .tabItem {
                    Label("Progreso", systemImage: "chart.bar.fill")
                }
                .tag(3)
        }
        .tint(.orange)
    }
}

struct HomeView: View {
    @EnvironmentObject var learningManager: LearningManager
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // Hero Section
                    VStack(spacing: 12) {
                        Text("🇪🇸")
                            .font(.system(size: 80))
                        
                        Text("¡Hola!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text("Domina los verbos españoles")
                            .font(.title3)
                            .foregroundColor(.secondary)
                    }
                    .padding(.top, 20)
                    
                    // Stats Cards
                    HStack(spacing: 16) {
                        StatCard(
                            title: "Verbos",
                            value: "30",
                            icon: "textformat.abc",
                            color: .orange
                        )
                        
                        StatCard(
                            title: "Tiempos",
                            value: "8",
                            icon: "clock.fill",
                            color: .blue
                        )
                        
                        StatCard(
                            title: "Racha",
                            value: "\(learningManager.streak)",
                            icon: "flame.fill",
                            color: .red
                        )
                    }
                    .padding(.horizontal)
                    
                    // Quick Actions
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Aprende Hoy")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        NavigationLink(destination: WritingExerciseView()) {
                            QuickActionCard(
                                title: "Ejercicio de Escritura",
                                subtitle: "Practica conjugando verbos",
                                icon: "pencil.circle.fill",
                                color: .green
                            )
                        }
                        .buttonStyle(.plain)
                        
                        NavigationLink(destination: SpeakingExerciseView()) {
                            QuickActionCard(
                                title: "Ejercicio de Habla",
                                subtitle: "Mejora tu pronunciación",
                                icon: "mic.circle.fill",
                                color: .purple
                            )
                        }
                        .buttonStyle(.plain)
                        
                        NavigationLink(destination: FlashcardView()) {
                            QuickActionCard(
                                title: "Tarjetas de Memoria",
                                subtitle: "Repaso rápido de conjugaciones",
                                icon: "rectangle.stack.fill",
                                color: .orange
                            )
                        }
                        .buttonStyle(.plain)
                        
                        NavigationLink(destination: VerbOfTheDayView()) {
                            QuickActionCard(
                                title: "Verbo del Día",
                                subtitle: "Aprende un verbo nuevo",
                                icon: "star.circle.fill",
                                color: .yellow
                            )
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(.bottom, 20)
                }
            }
            .navigationTitle("VerbosEspanol")
        }
    }
}

struct StatCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
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
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

struct QuickActionCard: View {
    let title: String
    let subtitle: String
    let icon: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 40))
                .foregroundColor(color)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}
