import 'package:flutter/material.dart';
import 'package:s_house/common/styles/appTheme/app_theme_helper.dart';

class CinMenuTile extends StatelessWidget {
  const CinMenuTile({Key? key, this.icon, required this.text}) : super(key: key);

  final IconData? icon;
  final String text;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
              child: Icon(icon),
            ),
          Text(
            text,
            style: context.textTheme.subtitle2,
          ),
        ],
      );
}
