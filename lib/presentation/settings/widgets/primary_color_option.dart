import 'package:flutter/material.dart';

class PrimaryColorOption extends StatelessWidget {
  const PrimaryColorOption({
    Key? key,
    required this.color,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);

  final Color color;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        key: Key('__${color.value}_color_option__'),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? Theme.of(context).dividerColor
                : Colors.transparent,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: color,
          ),
        ),
      ),
    );
  }
}
