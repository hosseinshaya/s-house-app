import 'package:flutter/material.dart';
import 'package:s_house/common/styles/appTheme/app_theme_helper.dart';

class ColorPalette {
  const ColorPalette({
    required this.primary,
    required this.success,
    required this.error,
    required this.warning,
    required this.info,
    required this.wtf,
    required this.scaffoldBackground,
    required this.background,
    required this.selectedBackground,
    required this.textPrimary,
    required this.textSecondary,
    required this.textCaption,
    required this.textDisabled,
    required this.divider,
    required this.shadow,
    required this.toolbarShadow,
    required this.splash,
    required this.disabled,
    required this.cursor,
    required this.textSelectionColor,
    required this.icon,
    required this.hint,
    this.white = Colors.white,
    this.black = Colors.black,
  });

  factory ColorPalette.of(BuildContext context) =>
      ColorPalette.fromBrightness(MediaQuery.of(context).platformBrightness);
  factory ColorPalette.fromBrightness(Brightness brightness) => brightness == Brightness.light ? light : dark;

  final ColorMode primary;
  final ColorMode success;
  final ColorMode error;
  final ColorMode warning;
  final ColorMode info;
  final ColorMode wtf;
  final Color textPrimary;
  final Color textSecondary;
  final Color hint;
  final Color textCaption;
  final Color textDisabled;
  final Color scaffoldBackground;
  final ColorMode background;
  final Color selectedBackground;
  final Color divider;
  final Color shadow;
  final Color toolbarShadow;
  final Color splash;
  final Color disabled;
  final Color cursor;
  final Color textSelectionColor;
  final Color icon;

  // no theme colors
  final Color black;
  final Color white;

  static ColorPalette dark = ColorPalette(
    primary: ColorMode(
      main: const Color(0xff2F3BBD),
      light: const Color(0xff4B57D6),
      dark: const Color(0xff1824A3),
      background: const Color(0xffE6E7FF),
    ),
    success: ColorMode(
      main: const Color(0xff46C93A),
      light: const Color(0xff68DC5E),
      dark: const Color(0xff33BB26),
      background: const Color(0xffECFAEB),
    ),
    error: ColorMode(
      main: const Color(0xffFF3849),
      light: const Color(0xffFF5967),
      dark: const Color(0xffDF2A3A),
      background: const Color(0xffFFEAEC),
    ),
    warning: ColorMode(
      main: const Color(0xffFFBA00),
      light: const Color(0xffFFCF4D),
      dark: const Color(0xffEDAD00),
      background: const Color(0xffFFF8E5),
    ),
    info: ColorMode(
      main: const Color(0xff1489FE),
      light: const Color(0xff49A3FC),
      dark: const Color(0xff1577D8),
      background: const Color(0xffE7F3FF),
    ),
    wtf: ColorMode(
      main: const Color(0xffCB38FF),
      light: const Color(0xffE395FF),
      dark: const Color(0xff9D12CE),
      background: const Color(0xffFAEAFF),
    ),
    scaffoldBackground: const Color(0xff2C3639),
    background: ColorMode(
      main: const Color(0xff3F4E4F),
      light: const Color(0xff515C5D),
      dark: const Color(0xff303C3D),
      background: const Color(0xff2A3233),
    ),
    selectedBackground: const Color(0xff303C3D),
    textPrimary: const Color(0xffDAE3E4),
    textSecondary: const Color(0xffCBD7D8),
    hint: const Color(0xffBDCACB),
    textCaption: const Color(0xffADBABB),
    textDisabled: const Color(0xffA5B5B6),
    divider: const Color(0xff829395),
    shadow: const Color(0x1E000000),
    toolbarShadow: const Color(0x3B000000),
    splash: const Color(0x0F000000),
    disabled: const Color(0xffA5B5B6),
    cursor: const Color(0xff525ddb),
    textSelectionColor: const Color(0xffADBABB),
    icon: const Color(0xffCBD7D8),
  );

  static ColorPalette light = ColorPalette( // todo
    primary: ColorMode(
      main: const Color(0xff2F3BBD),
      light: const Color(0xff4B57D6),
      dark: const Color(0xff1824A3),
      background: const Color(0xffE6E7FF),
    ),
    success: ColorMode(
      main: const Color(0xff46C93A),
      light: const Color(0xff68DC5E),
      dark: const Color(0xff33BB26),
      background: const Color(0xffECFAEB),
    ),
    error: ColorMode(
      main: const Color(0xffFF3849),
      light: const Color(0xffFF5967),
      dark: const Color(0xffDF2A3A),
      background: const Color(0xffFFEAEC),
    ),
    warning: ColorMode(
      main: const Color(0xffFFBA00),
      light: const Color(0xffFFCF4D),
      dark: const Color(0xffEDAD00),
      background: const Color(0xffFFF8E5),
    ),
    info: ColorMode(
      main: const Color(0xff1489FE),
      light: const Color(0xff49A3FC),
      dark: const Color(0xff1577D8),
      background: const Color(0xffE7F3FF),
    ),
    wtf: ColorMode(
      main: const Color(0xffCB38FF),
      light: const Color(0xffE395FF),
      dark: const Color(0xff9D12CE),
      background: const Color(0xffFAEAFF),
    ),
    scaffoldBackground: const Color(0xffFDFDFF),
    background: ColorMode(
      main: const Color(0xffF7F7FA),
      light: const Color(0xffFDFDFF),
      dark: const Color(0xffF0F0F5),
      background: const Color(0xffFFFFFF),
    ),
    selectedBackground: const Color(0xffe4e4e8),
    textPrimary: const Color(0xff2e2e33),
    textSecondary: const Color(0xff45454D),
    hint: const Color(0xff919199),
    textCaption: const Color(0xff5C5C66),
    textDisabled: const Color(0xffC2C2CC),
    divider: const Color(0xffE6E6EB),
    shadow: const Color(0x1E000000),
    toolbarShadow: const Color(0x3B000000),
    splash: const Color(0x0F000000),
    disabled: const Color(0xffe3e3e3),
    cursor: const Color(0xff525ddb),
    textSelectionColor: const Color(0x364b57d6),
    icon: const Color(0xff919199),
  );
}

class ColorMode extends Color {
  ColorMode({required this.main, required this.light, required this.dark, required this.background})
      : super.fromARGB(main.alpha, main.red, main.green, main.blue);

  final Color main;
  final Color light;
  final Color dark;
  final Color background;

  Color byBrightness(BuildContext context, {bool invert = false}) {
    bool condition = context.theme.brightness == Brightness.light;
    if (invert) {
      condition = !condition;
    }
    return condition ? light : dark;
  }
}
