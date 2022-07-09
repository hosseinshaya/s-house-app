import 'package:flutter/material.dart';
import 'package:s_house/common/styles/colorPalette/color_palette.dart';

extension ColorPaletteHelper on BuildContext {
  ColorPalette get colors => ColorPalette.of(this);
}
