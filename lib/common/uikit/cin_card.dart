import 'package:flutter/material.dart';
import 'package:s_house/common/styles/colorPalette/color_palette.dart';

enum BorderType { border, shadow, none }

class CinCard extends StatelessWidget {
  const CinCard({
    required this.child,
    Key? key,
    this.width,
    this.alignment,
    this.height,
    this.backgroundColor,
    this.margin,
    this.padding,
    this.scrollable = false,
    this.borderType = BorderType.shadow,
  }) : super(key: key);

  final Widget child;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final bool scrollable;
  final BorderType borderType;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) => Container(
        width: width,
        alignment: alignment,
        margin: margin,
        padding: padding,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor ?? ColorPalette.of(context).scaffoldBackground,
          borderRadius: BorderRadius.circular(12),
          boxShadow: <BoxShadow>[
            if (borderType == BorderType.shadow)
              BoxShadow(color: ColorPalette.of(context).shadow.withOpacity(0.13), blurRadius: 1),
          ],
          border:
              borderType == BorderType.border ? Border.all(width: 1.5, color: ColorPalette.of(context).divider) : null,
        ),
        child: scrollable
            ? SingleChildScrollView(
                child: child,
              )
            : child,
      );
}
