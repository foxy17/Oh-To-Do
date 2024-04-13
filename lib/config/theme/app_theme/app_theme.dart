import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
part 'color_scheme.dart';
part 'colors.dart';
part 'text_theme.dart';
part 'custom_colors.dart';

@immutable
class OhToDoTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: _ColorScheme._lightColorScheme,
    fontFamily: GoogleFonts.figtree().fontFamily,
    textTheme: _TextTheme._textTheme,
    scaffoldBackgroundColor: _ColorScheme._lightColorScheme.background,
    extensions: const <ThemeExtension<dynamic>>[
      CustomColors.light,
    ],
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: _ColorScheme._darkColorScheme,
    fontFamily: GoogleFonts.figtree().fontFamily,
    textTheme: _TextTheme._textTheme,
    scaffoldBackgroundColor: _ColorScheme._darkColorScheme.background,
    extensions: const <ThemeExtension<dynamic>>[
      CustomColors.dark,
    ],
  );
}