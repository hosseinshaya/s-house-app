import 'package:flutter/cupertino.dart';

typedef CinMenuItemCallback = Future<void> Function(BuildContext context);

class CinMenuItem {
  CinMenuItem({required this.title, this.icon, this.onPressed});

  final String title;
  final IconData? icon;
  final CinMenuItemCallback? onPressed;
}