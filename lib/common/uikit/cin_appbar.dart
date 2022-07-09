import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:s_house/common/styles/colorPalette/color_palette_helper.dart';
import 'package:s_house/common/uikit/clickable/push_down_clickable.dart';
import 'package:s_house/common/utils/status_bar.dart';

class CinAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CinAppBar(
    this.title, {
    Key? key,
    this.actions,
    this.elevation = 3,
    this.toolbarHeight = kToolbarHeight,
    this.titleWidget,
    this.centerTitle = false,
    this.bottom,
    this.backgroundColor,
    this.uiOverlayStyle,
    this.hasBackButton = true,
  }) : super(key: key);

  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final double elevation;
  final double toolbarHeight;
  final PreferredSizeWidget? bottom;
  final bool centerTitle;
  final Color? backgroundColor;
  final SystemUiOverlayStyle? uiOverlayStyle;
  final bool hasBackButton;

  @override
  Size get preferredSize => _PreferredAppBarSize(
      toolbarHeight,
      bottom == null
          ? 0
          : (bottom?.preferredSize.height ?? 0) <= 0
              ? kToolbarHeight
              : bottom!.preferredSize.height);

  @override
  Widget build(BuildContext context) => AppBar(
        title: titleWidget ?? Text(title ?? ''),
        systemOverlayStyle: uiOverlayStyle ?? StatusBar.page(context),
        automaticallyImplyLeading: false,
        leading: hasBackButton
            ? PushDownClickable(
                onTap: () {
                  context.pop();
                },
                child: const Icon(Icons.arrow_back_ios_rounded))
            : null,
        actions: actions,
        elevation: elevation,
        shadowColor: context.colors.toolbarShadow,
        bottom: bottom,
        centerTitle: centerTitle,
        backgroundColor: backgroundColor,
      );
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight((toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}
