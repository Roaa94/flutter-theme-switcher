import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme_switcher/presentation/providers/theme_provider.dart';
import 'package:flutter_theme_switcher/presentation/styles/app_colors.dart';
import 'package:flutter_theme_switcher/services/storage/storage_service.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  late ThemeProvider themeProvider;
  late StorageService storageService;

  setUp(() {
    GetIt.I.registerSingleton<StorageService>(MockStorageService());
    storageService = GetIt.I<StorageService>();
    themeProvider = ThemeProvider(storageService);
  });

  group('Primary color tests', () {
    test(
      'Initial value is default values when no color exists in local storage',
      () {
        when(() => storageService.get(StorageKeys.primaryColor))
            .thenReturn(null);
        themeProvider = ThemeProvider(storageService);

        expect(themeProvider.selectedPrimaryColor, AppColors.primary);
      },
    );

    test(
      'Initial value is taken from local storage when it exists',
      () {
        when(() => storageService.get(StorageKeys.primaryColor))
            .thenReturn(AppColors.primaryOption2.value);
        themeProvider = ThemeProvider(storageService);

        expect(themeProvider.selectedPrimaryColor, AppColors.primaryOption2);
      },
    );
  });

  group('Theme mode tests', () {
    test(
      'Initial value is default values when no theme mode exists in local storage',
          () {
        when(() => storageService.get(StorageKeys.themeMode))
            .thenReturn(null);
        themeProvider = ThemeProvider(storageService);

        expect(themeProvider.selectedThemeMode, ThemeMode.system);
      },
    );

    test(
      'Initial value is taken from local storage when it exists',
          () {
        when(() => storageService.get(StorageKeys.themeMode))
            .thenReturn(ThemeMode.dark.name);
        themeProvider = ThemeProvider(storageService);

        expect(themeProvider.selectedThemeMode, ThemeMode.dark);
      },
    );
  });

  tearDown(() async {
    await GetIt.I.reset();
  });
}
