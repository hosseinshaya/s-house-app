import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBar {
  static SystemUiOverlayStyle page(BuildContext context) =>
      const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.black26,
          statusBarIconBrightness: Brightness.light);

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
