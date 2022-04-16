import 'package:flutter/material.dart';

class SelectedThemeIndicator extends StatelessWidget {
  const SelectedThemeIndicator({
    Key? key,
    this.selectedThemeIndex = 0,
    required this.width,
  }) : super(key: key);

  final int selectedThemeIndex;
  final double width;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositionedDirectional(
      duration: const Duration(milliseconds: 300),
      start: selectedThemeIndex * width,
      top: 0,
      bottom: 0,
      child: Container(
        margin: const EdgeInsets.all(10),
        width: width - 20,
        height: width - 20,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              blurRadius: 10,
            ),
          ],
        ),
      ),
    );
  }
}
