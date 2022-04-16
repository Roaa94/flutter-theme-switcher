import 'package:flutter/material.dart';
import 'package:flutter_theme_switcher/presentation/models/app_theme.dart';

class ThemeOption extends StatelessWidget {
  const ThemeOption({
    Key? key,
    this.onTap,
    required this.appTheme,
    this.isSelected = false,
    required this.height,
  }) : super(key: key);

  final VoidCallback? onTap;
  final AppTheme appTheme;
  final bool isSelected;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: isSelected ? null : onTap,
        child: Container(
          alignment: Alignment.center,
          height: height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(appTheme.icon),
              const SizedBox(width: 8),
              Center(
                child: Text(
                  appTheme.title,
                  style: Theme.of(context)
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
  }
}
