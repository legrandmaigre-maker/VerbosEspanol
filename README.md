# VerbosEspanol 🇪🇸

An iOS app to master Spanish verb conjugations through interactive writing and speaking exercises. Perfect for Spanish learners who want to practice the most essential verbs.

## Features

### 📚 30 Most Used Spanish Verbs
Complete conjugation tables for the top 30 Spanish verbs including:
- **Irregular verbs**: ser, estar, ir, tener, hacer, decir, saber, venir, dar, ver, poner, salir, conocer, oír
- **Stem-changing verbs**: poder, querer, pensar, dormir, seguir, encontrar, sentir
- **Regular verbs**: hablar, comer, vivir, llegar, escribir, leer, trabajar, creer, llamar

### 🎯 8 Verb Tenses
Practice all major Spanish tenses:
- Presente (Present Indicative)
- Pretérito Indefinido (Preterite)
- Pretérito Imperfecto (Imperfect)
- Futuro (Future)
- Condicional (Conditional)
- Subjuntivo Presente (Present Subjunctive)
- Subjuntivo Imperfecto (Imperfect Subjunctive)
- Imperativo (Imperative)

### ✍️ Writing Exercises
Type conjugations to practice spelling and memorization with instant feedback.

### 🎤 Speaking Exercises
Practice pronunciation with speech recognition (Spanish locale). The app listens to your spoken conjugations and checks for accuracy.

### 🃏 Flashcards
Quick review mode with swipeable flashcards. Tap to flip, swipe to continue.

### 📝 Multiple Choice
Choose the correct conjugation from four options - perfect for beginners.

### 📄 Fill in the Blank
Complete sentences with the correct verb form in context.

### ⚡ Speed Challenge
Test your knowledge against the clock! How many conjugations can you get in 60 seconds?

### ⭐ Verb of the Day
Learn a new verb each day with example sentences and full conjugation tables.

### 📊 Progress Tracking
- Track your accuracy across all exercises
- See which verbs you've mastered
- Monitor progress by tense

## Requirements

- iOS 17.0+
- iPhone or iPad
- Microphone access (for speaking exercises)

## Installation

1. Open the project in Xcode or Swift Playgrounds
2. Build and run on your device or simulator

## Project Structure

```
VerbosEspanol.swiftpm/
├── Package.swift
└── Sources/
    ├── VerbosEspanolApp.swift
    ├── Models/
    │   ├── Verb.swift
    │   └── VerbData.swift
    ├── ViewModels/
    │   └── LearningManager.swift
    └── Views/
        ├── ContentView.swift
        ├── VerbListView.swift
        ├── WritingExerciseView.swift
        ├── SpeakingExerciseView.swift
        ├── FlashcardView.swift
        ├── VerbOfTheDayView.swift
        ├── PracticeMenuView.swift
        └── ProgressView.swift
```

## Technologies Used

- **SwiftUI** - Modern declarative UI framework
- **Speech Framework** - For speech recognition in speaking exercises
- **AVFoundation** - For audio recording
- **Charts** - For progress visualization (iOS 16+)

## Learning Approach

The app uses spaced repetition principles and multiple learning modalities:
1. **Visual learning** - See conjugation tables and flashcards
2. **Kinesthetic learning** - Type out conjugations
3. **Auditory learning** - Speak conjugations aloud
4. **Testing** - Multiple choice and fill-in-the-blank exercises
5. **Gamification** - Speed challenges and progress tracking

## Contributing

Feel free to submit issues and pull requests to improve the app!

## License

MIT License - feel free to use this project for learning purposes.

---

¡Buena suerte con tu español! 🎉
