import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:s_house/common/localization/locale_keys.g.dart';
import 'package:s_house/common/models/cin_menu_item.dart';
import 'package:s_house/common/uikit/cin_listview.dart';
import 'package:s_house/common/uikit/modal.dart';
import 'package:s_house/common/uikit/modalMenu/cin_modal_menu_tile.dart';
import 'package:s_house/common/uikit/modal_title.dart';

class CinModalMenu<T> extends StatelessWidget {
  const CinModalMenu({required this.items, this.resolveItemText, this.resolveItemIcon, this.onSelected, Key? key})
      : super(key: key);

  factory CinModalMenu.manual(List<T> items) => CinModalMenu<T>(
        items: items,
        resolveItemText: (item) => (item as CinMenuItem).title,
        resolveItemIcon: (item) => (item as CinMenuItem).icon,
        onSelected: (context, item) async {
          if ((item as CinMenuItem).onPressed != null) {
            await item.onPressed!(context);
          }
        },
      );

  final List<T> items;
  final String Function(T item)? resolveItemText;
  final IconData? Function(T item)? resolveItemIcon;
  final Future<void> Function(BuildContext context, T)? onSelected;

  @override
  Widget build(BuildContext context) => Modal(
        child: Column(
          children: [
            ModalTitle(LocaleKeys.common_options.tr()),
            CinListView<T>(
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              items: items,
              itemBuilder: (context, item) => CinModalMenuTile(
                title: resolveItemText == null ? item.toString() : resolveItemText!(item).toString(),
                icon: resolveItemIcon == null ? null : resolveItemIcon!(item),
                onPressed: () async {
                  if (onSelected != null) {
                    await onSelected!(context, item);
                  }
                },
              ),
              loadingBuilder: (_) => CinModalMenuTile.shimmer(),
              separatorBuilder: (_) => const SizedBox(height: 12),
            ),
          ],
        ),
      );
}
