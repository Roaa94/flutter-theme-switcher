import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_theme_switcher/presentation/providers/theme_provider.dart';
import 'package:flutter_theme_switcher/presentation/settings/pages/settings_page.dart';
import 'package:flutter_theme_switcher/presentation/styles/app_themes.dart';
import 'package:flutter_theme_switcher/services/service_locator.dart';
import 'package:flutter_theme_switcher/services/storage/storage_service.dart';
import 'package:provider/provider.dart';

void main() {
  runZonedGuarded<Future<void>>(() async {
    setUpServiceLocator();
    WidgetsFlutterBinding.ensureInitialized();

    final StorageService storageService = getIt<StorageService>();
    await storageService.init();

    runApp(App(
      storageService: storageService,
    ));
  }, (e, _) => throw e);
}

class App extends StatelessWidget {
  final StorageService storageService;

  const App({
    Key? key,
    required this.storageService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(storageService),
        ),
      ],
      child: Consumer<ThemeProvider>(
        child: const SettingsPage(),
        builder: (c, themeProvider, home) => MaterialApp(
          title: 'Flutter Theme And Primary Color Switcher',
          debugShowCheckedModeBanner: false,
          theme: AppThemes.main(
            primaryColor: themeProvider.selectedPrimaryColor,
          ),
          darkTheme: AppThemes.main(
            isDark: true,
            primaryColor: themeProvider.selectedPrimaryColor,
          ),
          themeMode: themeProvider.selectedThemeMode,
          home: home,
        ),
      ),
    );
  }
}
