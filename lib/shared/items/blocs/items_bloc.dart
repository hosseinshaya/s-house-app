import 'package:flutter/material.dart';
import 'package:s_house/common/box/base_box.dart';
import 'package:s_house/common/utils/logging/log.dart';
import 'package:s_house/common/utils/logging/log_helper.dart';
import 'package:s_house/shared/items/models/item.dart';

class ItemsBloc extends ChangeNotifier {
  factory ItemsBloc() => _instance;

  ItemsBloc._init() {
    init().then((_) async {
      Log.wtf('length is ${itemsBox.length}');
      items = itemsBox.values.toList();
    });
  }

  static final ItemsBloc _instance = ItemsBloc._init();

  Future<void> init() async {
    try {
      await itemsBox.open();
    } catch (e) {
      e.log();
    }
  }

  final BaseBox<Item> itemsBox = BaseBox<Item>(Item.boxName);

  List<Item>? _items;
  List<Item>? get items => _items;
  set items(List<Item>? value) {
    _items = value;
    notifyListeners();
  }

  Future<void> add(Item item) async {
    await itemsBox.put(item.key, item);
    Log.wtf('length is ${itemsBox.length}');
    items = itemsBox.values.toList();
  }
}
