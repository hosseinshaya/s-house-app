import 'package:hive/hive.dart';
import 'package:s_house/common/constants/hive_id.dart';
import 'package:s_house/common/models/multi_lang_text.dart';

part 'item.g.dart';

@HiveType(typeId: HiveId.item)
class Item extends HiveObject {
  @HiveField(0)
  final MultiLangText name;
  @HiveField(1)
  final String src;

  static const String boxName = 'itemsBox';

  Item(this.name, this.src);
}
