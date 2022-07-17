import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:s_house/common/constants/hive_id.dart';

part 'multi_lang_text.g.dart';

@HiveType(typeId: HiveId.multiLangText)
class MultiLangText {
  @HiveField(0)
  String? fa;
  @HiveField(1)
  String? en;

  MultiLangText({this.fa, this.en});

  String tr(BuildContext context) {
    switch (context.locale.languageCode) {
      case 'fa':
        return fa!;
      case 'en':
        return en!;
      default:
        return fa!;
    }
  }
}
