import 'package:flutter/material.dart';

import 'cin_menu_tile.dart';

class CinMenu<T> extends StatelessWidget {
  const CinMenu(
      {required this.items, Key? key, this.child, this.resolveItemText, this.resolveItemIcon, this.onSelected})
      : super(key: key);

  final Widget? child;
  final List<T> items;
  final String Function(T item)? resolveItemText;
  final IconData Function(T item)? resolveItemIcon;
  final Function(T)? onSelected;

  @override
  Widget build(BuildContext context) => PopupMenuButton<T>(
        onSelected: onSelected,
        itemBuilder: (context) => items
            .map(
              (e) => PopupMenuItem(
                value: e,
                child: CinMenuTile(
                  text: resolveItemText == null ? e.toString() : resolveItemText!(e).toString(),
                  icon: resolveItemIcon == null ? null : resolveItemIcon!(e),
                ),
              ),
            )
            .toList(),
        shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            side: BorderSide(color: Theme.of(context).dividerColor)),
        child: child,
      );
}
