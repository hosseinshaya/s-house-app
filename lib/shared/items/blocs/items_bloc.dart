import 'package:flutter/material.dart';
import 'package:s_house/common/utils/logging/log.dart';
import 'package:s_house/common/utils/logging/log_helper.dart';
import 'package:s_house/objectbox.g.dart';
import 'package:s_house/shared/items/models/item.dart';

class ItemsBloc extends ChangeNotifier {
  factory ItemsBloc() => _instance;

  ItemsBloc._init() {
    init().then((_) async {
      Log.wtf('count is ${box.count()}');
      items = box.getAll();
    });
  }

  static final ItemsBloc _instance = ItemsBloc._init();

  Future<void> init() async {
    try {
      final store = await openStore();
      box = store.box<Item>();
    } catch (e) {
      e.log();
    }
  }

  late Box<Item> box;

  List<Item>? _items;
  List<Item>? get items => _items;
  set items(List<Item>? value) {
    _items = value;
    for (final item in _items ?? []) {
      item.color?.toJson().wtfLog();
    }
    notifyListeners();
  }

  void add(Item item) {
    box.put(item);
    // Log.wtf('length is ${itemsBox.length}');
    items = box.getAll();
  }
}
