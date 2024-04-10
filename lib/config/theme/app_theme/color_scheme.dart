part of 'app_theme.dart';

@immutable
class _ColorScheme {
  static const _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: _Colors.lightPink,
    onPrimary: _Colors.lightOrange,
    secondary: _Colors.veryLightPink,
    onSecondary: _Colors.veryLightPink,
    tertiaryContainer: _Colors.brown,
    onTertiaryContainer: _Colors.white,
    error: _Colors.red,
    onError: _Colors.white,
    background: _Colors.white,
    onBackground: _Colors.white,
    surface: _Colors.white,
    onSurface: _Colors.white,
  );

  static const _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: _Colors.darkPink,
    onPrimary: _Colors.white,
    secondary: _Colors.lightOrange,
    onSecondary: _Colors.brown,
    tertiaryContainer: _Colors.brown,
    onTertiaryContainer: _Colors.black,
    error: _Colors.red,
    onError: _Colors.white,
    background: _Colors.brown,
    onBackground: _Colors.white,
    surface: _Colors.black,
    onSurface: _Colors.white,
  );
}