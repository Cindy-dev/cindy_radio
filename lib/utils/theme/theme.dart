library theme;

import 'package:flutter/material.dart';
import 'colors_theme_extension.dart';
part 'app_colors.dart';
part 'app_fonts.dart';
part 'text_styles.dart';

final ThemeData appTheme = _buildLightTheme();

ThemeData _buildLightTheme() {
  const Color primaryColor = _Colors.primaryColor;
  const Color primaryColorLight = _Colors.primaryColorLight;
  const Color secondaryColor = _Colors.secondaryColor;
  const Color gray = _Colors.gray;
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
    error: _Colors.secondaryColor,
  );
  final themeData = ThemeData(
    // brightness: Brightness.dark,
    primaryColor: primaryColor,
    shadowColor: gray,
    primaryColorDark: primaryColorLight,
    scaffoldBackgroundColor: _Colors.white,
    cardColor: _Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: _Colors.white,
      centerTitle: true,
      elevation: 0,
    ),
    snackBarTheme: SnackBarThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      behavior: SnackBarBehavior.floating,
      contentTextStyle: AppTextStyles.body2Regular,
      insetPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.maxFinite, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
        backgroundColor: _Colors.primaryColor,
        textStyle: AppTextStyles.body2Regular.copyWith(color: _Colors.white),
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 13.5),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: _Colors.primaryColor),
        ),
        elevation: 0,
        textStyle: AppTextStyles.body2Regular.copyWith(color: _Colors.black),
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 13.5),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: AppTextStyles.body2Regular.copyWith(color: _Colors.black),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: _Colors.gray),
      ),
      isDense: true,
      hintStyle: const TextStyle(fontSize: 16, color: _Colors.gray),
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.displayLarge,
      titleLarge: AppTextStyles.subtitle1,
      headlineLarge: AppTextStyles.headingBold,
      headlineMedium: AppTextStyles.heading2Bold,
      headlineSmall: AppTextStyles.heading3Bold,
      titleMedium: AppTextStyles.subtitle2,
      bodyMedium: AppTextStyles.body2Regular,
    ),
    extensions: [
      ColorThemeExt(
        textGray: _Colors.textGray,
        secondaryColor: _Colors.secondaryColor,
        white: _Colors.white,
        textBlack: _Colors.black,
        primaryColor: _Colors.primaryColor,
        primaryColorLight: _Colors.primaryColorLight,
        grey: _Colors.gray,
        red: _Colors.red,
      ),
    ],
    colorScheme: colorScheme.copyWith(secondary: secondaryColor),
  );
  return themeData;
}
