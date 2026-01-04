import SwiftUI

@main
struct VerbosEspanolApp: App {
    @StateObject private var learningManager = LearningManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(learningManager)
        }
    }
}
