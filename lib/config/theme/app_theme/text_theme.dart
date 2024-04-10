part of 'app_theme.dart';

@immutable
class _TextTheme {
  static final _textTheme = TextTheme(
    ///DISPLAY
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
    displayMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
    displaySmall: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w700,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),

    //HEADLINE
    headlineLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),

    //TITLE
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
    titleSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
  );
}
