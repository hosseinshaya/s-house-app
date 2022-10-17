import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:objectbox/objectbox.dart';
import 'package:s_house/common/utils/logging/log_helper.dart';
import 'package:s_house/objectbox.g.dart';
import 'package:s_house/shared/items/models/item_color.dart';

@Entity()
class Item extends HiveObject {
  Item({this.id = 0, this.imageIndex});

  int id;
  String? faName;
  String? enName;
  int? imageIndex;
  String? colorJson;
  String? pin;

  String trName(BuildContext context) {
    switch (context.locale.languageCode) {
      case 'fa':
        return faName ?? enName ?? '';
      case 'en':
        return enName ?? faName ?? '';
      default:
        return faName ?? '';
    }
  }

  set color(ItemColor? value) {
    colorJson = json.encode(value?.toJson());
  }

  ItemColor? get color =>
      colorJson == null ? null : ItemColor.fromJson(json.decode(colorJson!));

  static const String boxName = 'itemsBox';
}
