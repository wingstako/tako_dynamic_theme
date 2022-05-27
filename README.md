<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

<h1 align="center"> Tako Dynamic Theme </h1>

<p align="center">Change theme in just a snap!</p>

## Demo

<p>
<img src="/demo.gif" width="250"> 
</p>

## Getting started

1. Add ```tako_dynamic_theme``` to your pubspec.yaml.
```yml
dependencies:
    flutter:
        sdk: flutter
    tako_dynamic_theme: x.y.z
```

2. Run ```flutter pub get``` in the terminal.

## Usage

This package use key-value to index the ThemeData.

You can wrap your app by ```TakoDynamicTheme``` widget.
```dart
void main() {
  runApp(
      TakoDynamicThemeWidget(
        themeMap: {
            "light": ThemeData.light(),
            "dark": ThemeData.dark(),
            "night": ThemeConfig.nightTheme // pre-defined ThemeData
        }, 
        fallbackTheme: ThemeData.light(), 
        child: const MyApp()));
}
```

You can change the theme by the following code inside widget.
```dart
TakoDynamicTheme.of(context).changeTheme(themeKey: "night"),
```

You can checkout the example in this repository.
```bash
cd example
flutter run
```

