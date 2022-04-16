import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme_switcher/presentation/providers/theme_provider.dart';
import 'package:flutter_theme_switcher/presentation/styles/app_colors.dart';
import 'package:flutter_theme_switcher/presentation/styles/app_themes.dart';
import 'package:provider/provider.dart';

import 'mocks.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpRawApp(Widget widget) async {
    return pumpWidget(
      MaterialApp(
        home: widget,
      ),
    );
  }

  Future<void> pumpApp(
    Widget widget, {
    ThemeProvider? themeProvider,
  }) async {
    return pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => themeProvider ?? MockThemeProvider(),
          )
        ],
        child: Builder(
          builder: (context) => MaterialApp(
            theme: AppThemes.main(
              primaryColor: themeProvider == null
                  ? AppColors.primary
                  : context.watch<ThemeProvider>().selectedPrimaryColor,
            ),
            darkTheme: AppThemes.main(
              isDark: true,
              primaryColor: themeProvider == null
                  ? AppColors.primary
                  : context.watch<ThemeProvider>().selectedPrimaryColor,
            ),
            themeMode: themeProvider == null
                ? ThemeMode.system
                : context.watch<ThemeProvider>().selectedThemeMode,
            home: widget,
          ),
        ),
      ),
    );
  }
}
