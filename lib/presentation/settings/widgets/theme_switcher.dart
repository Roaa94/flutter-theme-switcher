import 'package:flutter/material.dart';
import 'package:flutter_theme_switcher/presentation/providers/theme_provider.dart';
import 'package:flutter_theme_switcher/presentation/settings/widgets/selected_theme_indicator.dart';
import 'package:flutter_theme_switcher/presentation/settings/widgets/switcher_container.dart';
import 'package:flutter_theme_switcher/presentation/styles/app_themes.dart';
import 'package:provider/provider.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double themeOptionIndicatorWidth =
        (MediaQuery
            .of(context)
            .size
            .width - (20 * 4)) /
            AppThemes.appThemeOptions.length;

    double themeSwitcherOptionsHeight = 60;

    return SwitcherContainer(
      title: 'Theme',
      content: SizedBox(
        height: themeSwitcherOptionsHeight,
        child: Consumer<ThemeProvider>(
          builder: (c, themeProvider, _) {
            int selectedThemeIndex = AppThemes.appThemeOptions.indexWhere(
                  (theme) => theme.mode == themeProvider.selectedThemeMode,
            );

            return Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme
                          .of(context)
                          .scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SelectedThemeIndicator(
                  width: themeOptionIndicatorWidth,
                  selectedThemeIndex: selectedThemeIndex,
                ),
                Positioned.fill(
                  child: Row(
                    children: List.generate(
                      AppThemes.appThemeOptions.length,
                          (i) {
                        bool isSelected = selectedThemeIndex == i;
                        return Expanded(
                          child: InkWell(
                            onTap: isSelected
                                ? null
                                : () =>
                                themeProvider.setSelectedThemeMode(
                                  AppThemes.appThemeOptions[i].mode,
                                ),
                            child: Container(
                              alignment: Alignment.center,
                              height: themeSwitcherOptionsHeight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Icon(AppThemes.appThemeOptions[i].icon),
                                  const SizedBox(width: 8),
                                  Center(
                                    child: Text(
                                      AppThemes.appThemeOptions[i].title,
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
