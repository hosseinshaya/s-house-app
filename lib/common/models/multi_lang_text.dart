import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'multi_lang_text.g.dart';

@JsonSerializable(explicitToJson: true)
class MultiLangText{
  int id;
  String? fa;
  String? en;

  factory MultiLangText.fromJson(Map<String, dynamic> json) =>
      _$MultiLangTextFromJson(json);

  MultiLangText({this.id = 0, this.fa, this.en});

  Map<String, dynamic> toJson() => _$MultiLangTextToJson(this);

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
