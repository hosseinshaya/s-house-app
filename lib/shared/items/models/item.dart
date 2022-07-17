import 'package:hive/hive.dart';
import 'package:s_house/common/constants/hive_id.dart';
import 'package:s_house/common/models/multi_lang_text.dart';
import 'package:s_house/shared/items/models/item_color.dart';

part 'item.g.dart';

@HiveType(typeId: HiveId.item)
class Item extends HiveObject {
  @HiveField(0)
  final MultiLangText name = MultiLangText();
  @HiveField(1)
  int? imageIndex;
  @HiveField(2)
  ItemColor? color;
  @HiveField(3)
  String? pin;

  static const String boxName = 'itemsBox';

  Item({this.imageIndex});
}
