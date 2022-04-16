import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xff16b9fd);
  static const Color primaryOption2 = Color(0xff03569b);
  static const Color primaryOption3 = Color(0xffd23156);
  static const Color primaryOption4 = Color(0xff13d0c1);
  static const Color primaryOption5 = Color(0xffe5672f);
  static const Color primaryOption6 = Color(0xffb73d99);

  static const Color white = Color(0xffffffff);
  static const Color white50 = Color(0x88ffffff);
  static const Color grayDark = Color(0xffeaeaea);
  static const Color gray = Color(0xfff3f3f3);
  static const Color text = Color(0xff000000);
  static const Color text50 = Color(0x88000000);
  static const Color black = Color(0xff001424);
  static const Color black50 = Color(0x88001424);
  static const Color blackLight = Color(0xff011f35);

  static List<Color> primaryColorOptions = const [
    primary,
    primaryOption2,
    primaryOption3,
    primaryOption4,
    primaryOption5,
    primaryOption6,
  ];

  static Color getShade(Color color, {bool darker = false, double value = .1}) {
    assert(value >= 0 && value <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness(
        (darker ? (hsl.lightness - value) : (hsl.lightness + value))
            .clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  static MaterialColor getMaterialColorFromColor(Color color) {
    Map<int, Color> _colorShades = {
      50: getShade(color, value: 0.5),
      100: getShade(color, value: 0.4),
      200: getShade(color, value: 0.3),
      300: getShade(color, value: 0.2),
      400: getShade(color, value: 0.1),
      500: color, //Primary value
      600: getShade(color, value: 0.1, darker: true),
      700: getShade(color, value: 0.15, darker: true),
      800: getShade(color, value: 0.2, darker: true),
      900: getShade(color, value: 0.25, darker: true),
    };
    return MaterialColor(color.value, _colorShades);
  }
}
