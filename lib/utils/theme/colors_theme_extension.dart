import 'package:flutter/material.dart';

/// Use context.theme.cardColor instead

class ColorThemeExt extends ThemeExtension<ColorThemeExt> {
  final Color primaryColor;
  final Color primaryColorLight;
  final Color secondaryColor;
  final Color textBlack;
  final Color grey;
  final Color red;
  final Color white;
  final Color textGray;

  ColorThemeExt({
    required this.primaryColor,
    required this.primaryColorLight,
    required this.secondaryColor,
    required this.white,
    required this.textBlack,
    required this.grey,
    required this.red,
    required this.textGray,
  });
  @override
  ThemeExtension<ColorThemeExt> copyWith({
    Color? primaryColor,
    Color? primaryColorLight,
    Color? secondaryColor,
    Color? textBlack,
    Color? white,
    Color? grey,
    Color? red,
    Color? textGray,
  }) {
    return ColorThemeExt(
      secondaryColor: secondaryColor ?? this.secondaryColor,
      textBlack: textBlack ?? this.textBlack,
      white: white ?? this.white,
      primaryColor: primaryColor ?? this.primaryColor,
      primaryColorLight: primaryColorLight ?? this.primaryColorLight,
      grey: grey ?? this.grey,
      red: red ?? this.red,
      textGray: textGray ?? this.textGray,
    );
  }

  @override
  ThemeExtension<ColorThemeExt> lerp(
    covariant ThemeExtension<ColorThemeExt>? other,
    double t,
  ) {
    return this;
  }
}
