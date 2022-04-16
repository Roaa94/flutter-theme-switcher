import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme_switcher/presentation/settings/widgets/selected_theme_indicator.dart';

import '../../pump_app.dart';

void main() {
  testWidgets(
    'Has a start offset equal to the selected theme index multiplied by the indicator width',
    (WidgetTester tester) async {
      double indicatorWidth = 100;
      int selectedThemeIndex = 2;

      await tester.pumpRawApp(
        Stack(
          children: [
            SelectedThemeIndicator(
              width: indicatorWidth,
              selectedThemeIndex: selectedThemeIndex,
            ),
          ],
        ),
      );

      await tester.pumpAndSettle();
      final finder = find.byType(AnimatedPositionedDirectional);
      expect(finder, findsOneWidget);

      final indicator = tester.widget<AnimatedPositionedDirectional>(finder);
      expect(
        indicator.start,
        equals(indicatorWidth * selectedThemeIndex),
      );
    },
  );
}
