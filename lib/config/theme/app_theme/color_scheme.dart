part of 'app_theme.dart';

@immutable
class _ColorScheme {
  static const _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: _Colors.primary,
    onPrimary: _Colors.white,
    secondary: _Colors.white,
    onSecondary: _Colors.heading,
    tertiaryContainer: _Colors.white,
    onTertiaryContainer: _Colors.primary,
    error: _Colors.red,
    onError: _Colors.white,
    background: _Colors.background,
    onBackground: _Colors.white,
    surface: _Colors.white,
    onSurface: _Colors.label,
    primaryContainer: _Colors.white,
    onPrimaryContainer: _Colors.primary,
  );

  static const _darkColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: _Colors.primary,
    onPrimary: _Colors.white,
    secondary: _Colors.white,
    onSecondary: _Colors.heading,
    tertiaryContainer: _Colors.white,
    onTertiaryContainer: _Colors.primary,
    error: _Colors.red,
    onError: _Colors.white,
    background: _Colors.background,
    onBackground: _Colors.white,
    surface: _Colors.white,
    onSurface: _Colors.label,
    primaryContainer: _Colors.white,
    onPrimaryContainer: _Colors.primary,
  );
}