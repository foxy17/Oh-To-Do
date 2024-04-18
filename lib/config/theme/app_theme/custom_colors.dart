part of 'app_theme.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors(
      {required this.subHeading, required this.label, required this.lightGrey});

  final Color? subHeading;
  final Color? label;
  final Color? lightGrey;

  // the light theme
  static const light = CustomColors(
      subHeading: _Colors.subHeading,
      label: _Colors.label,
      lightGrey: _Colors.lightGrey);

  // the dark theme
  static const dark = CustomColors(
      subHeading: _Colors.subHeading,
      label: _Colors.label,
      lightGrey: _Colors.lightGrey);

  @override
  ThemeExtension<CustomColors> copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  ThemeExtension<CustomColors> lerp(
      covariant ThemeExtension<CustomColors>? other, double t) {
    // TODO: implement lerp
    throw UnimplementedError();
  }
}
