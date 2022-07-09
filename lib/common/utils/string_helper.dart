import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension StringUtils on String {
  String toLocalNumbers(BuildContext context) =>
      context.locale.toString() == 'fa' ? toPersianNumbers() : toEnglishNumbers();

  String toPersianNumbers() => replaceAll('1', '۱')
      .replaceAll('2', '۲')
      .replaceAll('3', '۳')
      .replaceAll('4', '۴')
      .replaceAll('5', '۵')
      .replaceAll('6', '۶')
      .replaceAll('7', '۷')
      .replaceAll('8', '۸')
      .replaceAll('9', '۹')
      .replaceAll('0', '۰');

  String toEnglishNumbers() => replaceAll('۱', '1')
      .replaceAll('۲', '2')
      .replaceAll('۳', '3')
      .replaceAll('۴', '4')
      .replaceAll('۵', '5')
      .replaceAll('۶', '6')
      .replaceAll('۷', '7')
      .replaceAll('۸', '8')
      .replaceAll('۹', '9')
      .replaceAll('۰', '0');

  String currencyFormatter() {
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    Function mathFunc = (Match match) => '${match[1]},';
    return replaceAllMapped(reg, mathFunc as String Function(Match));
  }

  String round() {
    double temp = double.parse(this);
    if (temp.round() == temp) {
      return temp.toInt().toString();
    } else {
      return temp.toString();
    }
  }

  Color toColor() => Color(int.parse(replaceAll('#', 'ff'), radix: 16));

  String cardNumberFormatter() {
    RegExp reg = RegExp(r'(\d{1,4})(?=(\d{4})+(?!\d))');
    Function mathFunc = (Match match) => '${match[1]} ';
    return replaceAllMapped(reg, mathFunc as String Function(Match));
  }
}
