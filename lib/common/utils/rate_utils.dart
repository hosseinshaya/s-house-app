import 'package:flutter/material.dart';
import 'package:s_house/common/styles/colorPalette/color_palette_helper.dart';

class RateUtils {
  static Color getRateColorByPercent(BuildContext context,
      {required double rate}) {
    if (rate >= 0.0 && rate <= 0.25) {
      return context.colors.error;
    } else if (rate >= 0.25 && rate <= 0.5) {
      return context.colors.warning;
    } else if (rate >= 0.5 && rate <= 0.75) {
      return context.colors.success;
    } else if (rate >= 0.75 && rate <= 1.0) {
      return context.colors.info;
    } else {
      return Colors.transparent;
    }
  }

  static Color getRateColorByStars(BuildContext context,
      {required double rate}) {
    if (rate >= 0 && rate <= 2) {
      return context.colors.error;
    } else if (rate >= 2 && rate <= 3) {
      return context.colors.warning;
    } else if (rate >= 3 && rate <= 4) {
      return context.colors.success;
    } else if (rate >= 4 && rate <= 5) {
      return context.colors.info;
    } else {
      return Colors.transparent;
    }
  }
}
