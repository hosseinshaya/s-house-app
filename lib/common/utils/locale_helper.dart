import 'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:s_house/common/constants/fonts.dart';
import 'package:s_house/common/resources/resources.dart';

extension LocaleHelper on Locale {
  String get languageName {
    switch (languageCode) {
      case 'fa':
        return 'فارسی';
      case 'en':
        return 'English';
      case 'ar':
        return 'العربية';
    }
    return 'ERR';
  }
}

extension LocaleUtils on BuildContext {
  bool get isEn => locale.languageCode == 'en';

  bool get isFa => locale.languageCode == 'fa';

  bool get isAr => locale.languageCode == 'ar';

  bool get isRtl => isFa || isAr;

  bool get isLtr => !isRtl;

  ui.TextDirection get localeDirection =>
      isRtl ? ui.TextDirection.rtl : ui.TextDirection.ltr;

  ui.TextDirection get invertLocaleDirection =>
      isRtl ? ui.TextDirection.ltr : ui.TextDirection.rtl;

  String get localeNumericFont => isFa ? Fonts.yekanBakhFaNum : Fonts.yekanBakh;

  String get localeLogoType => isFa || isAr ? Svgs.logoTypeFa : Svgs.logoTypeEn;
}
