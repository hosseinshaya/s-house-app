import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:s_house/common/styles/colorPalette/color_palette.dart';

class StatusBar {
  static SystemUiOverlayStyle page(BuildContext context) =>
      SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: ColorPalette.of(context).scaffoldBackground,
          statusBarIconBrightness: Brightness.dark);

  static SystemUiOverlayStyle whiteTransparent(BuildContext context) =>
      const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark);

  static SystemUiOverlayStyle blackTransparent(BuildContext context) =>
      const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.black26,
          statusBarIconBrightness: Brightness.light);
}
