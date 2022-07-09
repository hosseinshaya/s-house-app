import 'package:flutter/material.dart';

extension AppThemeHelper on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  Brightness get brightness => theme.brightness;
}
