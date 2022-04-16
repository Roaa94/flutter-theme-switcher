import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme_switcher/presentation/settings/widgets/primary_color_option.dart';
import 'package:flutter_theme_switcher/presentation/styles/app_colors.dart';
import 'package:flutter_theme_switcher/presentation/styles/app_themes.dart';

import '../../pump_app.dart';

void main() {
  testWidgets(
    'Has transparent Border if not selected',
    (WidgetTester tester) async {
      await tester.pumpRawApp(
        const PrimaryColorOption(
          color: AppColors.primary,
          isSelected: false,
        ),
      );

      await tester.pumpAndSettle();

      final finder = find.byKey(
        Key('__${AppColors.primary.value}_color_option__'),
      );

      expect(finder, findsOneWidget);

      final container = tester.widget<AnimatedContainer>(finder);
      final BoxDecoration decoration = container.decoration as BoxDecoration;
      expect(decoration.border!.top.color, equals(Colors.transparent));
    },
  );

  testWidgets('Has gray Border if selected', (WidgetTester tester) async {
    await tester.pumpRawApp(
      const PrimaryColorOption(
        color: AppColors.primary,
        isSelected: true,
      ),
    );

    await tester.pumpAndSettle();

    final finder = find.byKey(
      Key('__${AppColors.primary.value}_color_option__'),
    );

    expect(finder, findsOneWidget);

    final container = tester.widget<AnimatedContainer>(finder);
    final BoxDecoration decoration = container.decoration as BoxDecoration;
    expect(
      decoration.border!.top.color,
      equals(AppThemes.main().dividerColor),
    );
  });
}
