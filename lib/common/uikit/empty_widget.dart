import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_house/common/styles/appTheme/app_theme_helper.dart';
import 'package:s_house/common/styles/colorPalette/color_palette_helper.dart';
import 'package:separated_column/separated_column.dart';

import '../resources/resources.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget(
      {Key? key,
      this.image,
      this.title,
      this.subtitle,
      this.prefixWidget,
      this.suffixWidget})
      : super(key: key);

  final String? image;
  final String? title;
  final String? subtitle;
  final Widget? prefixWidget;
  final Widget? suffixWidget;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(65),
        child: SeparatedColumn(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          separatorBuilder: (_, __) => const SizedBox(height: 6),
          children: [
            if (prefixWidget != null) prefixWidget!,
            SvgPicture.asset(
              image ?? Svgs.defaultEmpty,
              height: 190,
            ),
            if (title != null)
              Text(
                title!,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w800,
                    color: context.colors.textSecondary),
              ),
            if (subtitle != null)
              Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyText2!
                    .copyWith(color: context.colors.textCaption),
              ),
            if (suffixWidget != null) suffixWidget!,
          ],
        ),
      );
}
