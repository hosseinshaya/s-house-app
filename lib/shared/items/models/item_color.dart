import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:s_house/common/constants/hive_id.dart';
import 'package:s_house/common/styles/colorPalette/color_palette.dart';

part 'item_color.g.dart';

@HiveType(typeId: HiveId.itemColor)
class ItemColor {
  ItemColor(this.main, this.light, this.dark, this.background);

  factory ItemColor.fromColorMode(ColorMode colorMode) => ItemColor(
        colorMode.main,
        colorMode.light,
        colorMode.dark,
        colorMode.background,
      );

  ColorMode toColorMode() =>
      ColorMode(main: main, light: light, dark: dark, background: background);

  @HiveField(0)
  final Color main;
  @HiveField(1)
  final Color light;
  @HiveField(2)
  final Color dark;
  @HiveField(3)
  final Color background;
}
