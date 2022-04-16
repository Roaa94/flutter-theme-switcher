import 'package:flutter/material.dart';
import 'package:flutter_theme_switcher/presentation/providers/theme_provider.dart';
import 'package:flutter_theme_switcher/presentation/settings/widgets/primary_color_option.dart';
import 'package:flutter_theme_switcher/presentation/styles/app_colors.dart';
import 'package:provider/provider.dart';

class PrimaryColorSwitcher extends StatelessWidget {
  const PrimaryColorSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Theme.of(context).dividerColor),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Primary Color',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 20),
          Consumer<ThemeProvider>(
            builder: (c, themeProvider, _) {
              return Wrap(
                children: List.generate(
                  AppColors.primaryColorOptions.length,
                  (i) => PrimaryColorOption(
                    color: AppColors.primaryColorOptions[i],
                    isSelected: themeProvider.selectedPrimaryColor ==
                        AppColors.primaryColorOptions[i],
                    onTap: () => themeProvider.setSelectedPrimaryColor(
                      AppColors.primaryColorOptions[i],
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
