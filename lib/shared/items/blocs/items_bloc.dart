import 'package:flutter/material.dart';
import 'package:s_house/common/box/base_box.dart';
import 'package:s_house/shared/items/models/item.dart';

class ItemsBloc extends ChangeNotifier {
  ItemsBloc() {
    itemsBox.open();
  }

  final BaseBox<Item> itemsBox = BaseBox<Item>(Item.boxName);

  List<Item>? _items;
  List<Item> get items => _items ??= itemsBox.values.toList();
  set items(List<Item> value) {
    _items = value;
    notifyListeners();
  }

  void add(Item item) {
    itemsBox.add(item);
    items = itemsBox.values.toList();
  }
}
