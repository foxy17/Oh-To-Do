
# Oh To Do

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)


## About
Oh-To-Do is a free, open-source todo app that integrates a pomodoro timer in it and has an intuitive way to help you tackle the tasks you dread to do.
## Getting Started

To compile Oh-To-Do from the source code, follow these steps:

1. Install Flutter [directly](https://flutter.dev) or using [fvm](https://fvm.app) (see [version required](.fvm/fvm_config.json))
2. Clone the `Oh-To-Do` repository
3. Run `cd app` to enter the app directory
4. Run `dart run build_runner build --delete-conflicting-outputs` to generate code
5. Run `flutter pub get` to download dependencies
## Run on different platforms for development

### Web
Ensure you have chrome or some browser open, you can check this by
```bash
flutter devices 
```

If it shows a browser you can run
`flutter run -d <device_name> `

```bash
flutter run -d chrome
```

### Desktop Versions

To compile on desktop you will need to install visual studio and Make sure to install the Desktop development with C++ . You can use `flutter doctor` to check what you are missing.

More details - https://docs.flutter.dev/get-started/install/windows/desktop

### macOS

```bash
flutter run -d macos
```

### Windows

```bash
flutter run -d windows
```

### Linux

```bash
flutter run -d linux
```

## Building

These commands are intended for maintainers only.

### Android

Traditional APK

```bash
flutter build apk
```

AppBundle for Google Play

```bash
flutter build appbundle
```

### iOS

```bash
flutter build ipa
```

### macOS

```bash
flutter build macos
```

### Windows

**Traditional**

```bash
flutter build windows
```

**Local MSIX App**

```bash
flutter pub run msix:create
```

**Store ready**

```bash
flutter pub run msix:create --store
```

### Linux

**Traditional**

```bash
flutter build linux
```

**AppImage**

```bash
appimage-builder --recipe AppImageBuilder.yml
```