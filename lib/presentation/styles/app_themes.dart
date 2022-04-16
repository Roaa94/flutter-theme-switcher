import 'package:flutter/material.dart';
import 'package:flutter_theme_switcher/presentation/styles/app_colors.dart';

class AppThemes {
  static ThemeData main({
    bool isDark = false,
    Color primaryColor = AppColors.primary,
  }) {
    return ThemeData(
      fontFamily: 'TitilliumWeb',
      brightness: isDark ? Brightness.dark : Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: isDark ? AppColors.black : AppColors.gray,
      cardColor: isDark ? AppColors.blackLight : AppColors.white,
      dividerColor: isDark
          ? AppColors.white.withOpacity(0.2)
          : AppColors.black.withOpacity(0.1),
      shadowColor: isDark ? AppColors.text : AppColors.black.withOpacity(0.1),
      primarySwatch: AppColors.getMaterialColorFromColor(primaryColor),
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: primaryColor,
      ),
    );
  }
}
