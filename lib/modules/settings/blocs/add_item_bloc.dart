import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s_house/common/styles/colorPalette/color_palette.dart';
import 'package:s_house/shared/items/blocs/items_bloc.dart';
import 'package:s_house/shared/items/models/item.dart';
import 'package:s_house/shared/items/models/item_color.dart';

class AddItemBloc extends ChangeNotifier {
  AddItemBloc(this.context);

  final BuildContext context;

  Item selectedItem = Item();

  bool get isSubmitEnabled =>
      selectedItem.name.fa != null &&
      selectedItem.name.en != null &&
      selectedItem.imageIndex != null &&
      selectedItem.color != null;

  set faName(String? value) {
    selectedItem.name.fa = value;
    notifyListeners();
  }

  set enName(String? value) {
    selectedItem.name.en = value;
    notifyListeners();
  }

  set imageIndex(int? value) {
    selectedItem.imageIndex = value;
    notifyListeners();
  }

  ColorMode? selectedColor;

  set color(ColorMode? value) {
    selectedItem.color = value == null ? null : ItemColor.fromColorMode(value);
    selectedColor = value;
    notifyListeners();
  }

  void submit() {
    context.read<ItemsBloc>().add(selectedItem);
  }
}
