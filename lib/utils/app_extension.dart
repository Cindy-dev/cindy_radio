import 'package:cindy_radio/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'theme/colors_theme_extension.dart';

extension AppExtension on BuildContext{
  Color get primaryColor => appTheme.primaryColor;
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorThemeExt get colors => customTheme<ColorThemeExt>();

  customTheme<T>() => Theme.of(this).extension<T>();
}