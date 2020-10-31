import 'package:flutter/material.dart';
import 'package:hear_better/theme/colors.dart';

@immutable
class AppTheme {
  static const colors = AppColors();

  const AppTheme._();

  static ThemeData define() {
    return ThemeData(
      fontFamily: "SFRegular",
      primaryColor: AppTheme.colors.white,
      accentColor: AppTheme.colors.black,
      brightness: Brightness.light,
    );
  }
}
