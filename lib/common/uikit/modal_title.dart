import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:s_house/common/styles/appTheme/app_theme_helper.dart';
import 'package:s_house/common/styles/colorPalette/color_palette_helper.dart';
import 'package:s_house/common/uikit/clickable/push_down_clickable.dart';
import 'package:s_house/common/utils/status_bar.dart';

class ModalTitle extends StatelessWidget implements PreferredSizeWidget {
  const ModalTitle(
    this.title, {
    Key? key,
    this.actions,
    this.elevation = 3,
    this.toolbarHeight = kToolbarHeight,
    this.titleWidget,
    this.centerTitle = false,
    this.appbarBottom,
    this.backgroundColor,
    this.foregroundColor,
    this.uiOverlayStyle,
    this.hasBackButton = true,
    this.onBackPressed,
    this.titleStyle,
  }) : super(key: key);

  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final double elevation;
  final double toolbarHeight;
  final PreferredSizeWidget? appbarBottom;
  final bool centerTitle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final SystemUiOverlayStyle? uiOverlayStyle;
  final bool hasBackButton;
  final GestureTapCallback? onBackPressed;
  final TextStyle? titleStyle;

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);

  @override
  Widget build(BuildContext context) => AppBar(
        title: titleWidget ??
            Text(
              title ?? '',
              style: titleStyle ??
                  context.theme.appBarTheme.titleTextStyle!.copyWith(
                      color: foregroundColor ?? context.colors.textCaption),
            ),
        systemOverlayStyle: uiOverlayStyle ?? StatusBar.page(context),
        automaticallyImplyLeading: false,
        leading: hasBackButton
            ? PushDownClickable(
                onTap: onBackPressed ??
                    () {
                      Navigator.of(context).pop();
                    },
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: foregroundColor ?? context.colors.textCaption,
                ))
            : null,
        actions: actions,
        elevation: 0,
        shadowColor: context.colors.toolbarShadow,
        bottom: appbarBottom,
        centerTitle: centerTitle,
        backgroundColor: Colors.transparent,
      );
}
