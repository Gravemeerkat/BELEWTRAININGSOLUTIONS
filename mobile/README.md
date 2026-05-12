# Backing Trainer Pro - Flutter Mobile App

A cross-platform mobile application built with Flutter for CDL backing maneuver training.

## Features

- **6 Training Modules:**
  - Straight Line Backing
  - Offset Left
  - Offset Right
  - Parallel Parking
  - Alley Dock
  - General Backing

- **Material Design 3 UI**
- **Voice Guidance** (using flutter_tts)
- **Interactive Training Diagrams**
- **Cross-platform** (iOS & Android)

## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK (included with Flutter)
- Android Studio or Xcode (for emulator/device testing)

### Installation

1. Navigate to the mobile directory:
   ```bash
   cd mobile
   ```

2. Get dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Project Structure

```
mobile/
├── lib/
│   ├── main.dart              # App entry point
│   ├── screens/
│   │   ├── home_screen.dart   # Dashboard with module grid
│   │   └── module_detail.dart # Training module details
│   ├── widgets/
│   │   └── module_button.dart # Reusable module button
│   └── services/
│       └── voice_service.dart # Text-to-speech service
├── pubspec.yaml               # Dependencies
└── README.md
```

## Dependencies

- **flutter_tts** - Text-to-speech for voice guidance
- **provider** - State management
- **cupertino_icons** - iOS-style icons

## Building for Release

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

## Future Enhancements

- Persistent data storage with SQLite
- Progress tracking and statistics
- Video tutorials integration
- Offline mode support
- User authentication
- Performance metrics dashboard

## Support

For issues or questions, please visit the main repository: [Backing Trainer Pro](https://github.com/Gravemeerkat/BELEWTRAININGSOLUTIONS)
