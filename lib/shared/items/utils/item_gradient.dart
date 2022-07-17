import 'package:flutter/material.dart';
import 'package:s_house/common/styles/colorPalette/color_palette.dart';

class ItemGradient {
  static Gradient from(ColorMode colorMode) => RadialGradient(
        radius: 0.7,
        colors: [
          colorMode.light,
          colorMode.main,
        ],
      );
}
