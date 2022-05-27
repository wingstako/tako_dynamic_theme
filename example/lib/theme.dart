import 'package:example/palette.dart';
import 'package:flutter/material.dart';

class ThemeConfig {

  static final nightTheme = ThemeData.from(
    // useMaterial3: true,
    // toggleableActiveColor: nightPrimary,
      colorScheme:  ColorScheme(
        brightness: Brightness.values.first,
        primary: nightPrimary,
        onPrimary: nightOnPrimary,
        secondary: nightSecondary,
        onSecondary: nightOnSecondary,
        tertiary: nightAccent,
        onTertiary: nightNeutral,
        error: nightError,
        onError: nightNeutral,
        background: nightBackgroud,
        onBackground: nightOnBackgroud,
        surface: nightNeutral,
        onSurface: nightPrimary,
        onSurfaceVariant: nightPrimary));
}
