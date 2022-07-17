import 'package:flutter/material.dart';
import 'package:s_house/common/box/base_box.dart';
import 'package:s_house/shared/items/models/item.dart';

class ItemsBloc extends ChangeNotifier {
  ItemsBloc() {
    itemsBox.open();
  }

  final BaseBox<Item> itemsBox = BaseBox<Item>(Item.boxName);
}
