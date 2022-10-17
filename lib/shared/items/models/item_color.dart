import 'package:flutter/material.dart';
import 'package:s_house/common/styles/colorPalette/color_palette.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:s_house/common/utils/color_helper.dart';
import 'package:s_house/common/utils/string_helper.dart';

part 'item_color.g.dart';

@JsonSerializable(explicitToJson: true)
class ItemColor {
  ItemColor(
      {required this.main,
      required this.light,
      required this.dark,
      required this.background});

  factory ItemColor.fromJson(Map<String, dynamic> json) =>
      _$ItemColorFromJson(json);

  factory ItemColor.fromColorMode(ColorMode colorMode) => ItemColor(
        main: colorMode.main,
        light: colorMode.light,
        dark: colorMode.dark,
        background: colorMode.background,
      );

  ColorMode toColorMode() =>
      ColorMode(main: main, light: light, dark: dark, background: background);

  @ColorConverter()
  final Color main;
  @ColorConverter()
  final Color light;
  @ColorConverter()
  final Color dark;
  @ColorConverter()
  final Color background;

  Map<String, dynamic> toJson() => _$ItemColorToJson(this);
}

class ColorConverter implements JsonConverter<Color, String> {
  const ColorConverter();

  @override
  Color fromJson(String json) => json.toColor();

  @override
  String toJson(Color object) => object.toHexString();
}
