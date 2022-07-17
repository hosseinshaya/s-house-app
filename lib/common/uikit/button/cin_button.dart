import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:s_house/common/styles/colorPalette/color_palette.dart';
import 'package:s_house/common/uikit/loading_widget.dart';
import 'package:s_house/common/uikit/switcher.dart';
import 'package:s_house/common/utils/logging/log_helper.dart';

enum ButtonType { primary, secondary }

class CinButton extends StatefulWidget {
  const CinButton(
      {required this.onPressed,
      this.text,
      this.child,
      bool widthFromHeight = false,
      double? width,
      this.enabled = true,
      this.loading,
      this.height = 48,
      this.color,
      this.maxWidth,
      this.minWidth,
      this.borderSide = BorderSide.none,
      this.type = ButtonType.primary,
      Key? key,
      this.icon,
      this.iconSize = 20,
      this.foregroundColor,
      this.margin})
      : width = widthFromHeight ? height : (width ?? double.infinity),
        super(key: key);

  final Widget? child;
  final String? text;
  final AsyncCallback onPressed;
  final bool enabled;
  final bool? loading;
  final double width;
  final double height;
  final Color? color;
  final double? maxWidth;
  final double? minWidth;
  final BorderSide borderSide;
  final ButtonType type;
  final IconData? icon;
  final EdgeInsets? margin;
  final double iconSize;
  final Color? foregroundColor;

  @override
  State<CinButton> createState() => CinButtonState();
}

class CinButtonState extends State<CinButton> {
  bool loading = false;

  bool get finalLoading => widget.loading ?? loading;

  @override
  Widget build(BuildContext context) => Container(
        height: widget.height,
        width: widget.width,
        margin: widget.margin,
        constraints: BoxConstraints(
          maxWidth:
              widget.maxWidth == null ? double.infinity : widget.maxWidth!,
          minWidth: widget.minWidth == null ? 0 : widget.minWidth!,
        ),
        child: ElevatedButton(
          onPressed: !finalLoading && widget.enabled
              ? () async {
                  if (mounted) {
                    setState(() => loading = true);
                  }
                  FocusScope.of(context).requestFocus(FocusNode());
                  try {
                    await widget.onPressed();
                  } catch (e) {
                    e.errLog();
                  }
                  if (mounted) {
                    setState(() => loading = false);
                  }
                }
              : () {},
          style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                elevation: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) {
                  if (widget.type == ButtonType.secondary ||
                      finalLoading ||
                      !widget.enabled) {
                    return 0;
                  } else if (states.contains(MaterialState.hovered) ||
                      states.contains(MaterialState.pressed) ||
                      states.contains(MaterialState.focused) ||
                      states.contains(MaterialState.dragged)) {
                    return 0;
                  } else {
                    return 6;
                  }
                }),
                backgroundColor: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) => states
                            .contains(MaterialState.disabled)
                        ? (widget.type == ButtonType.primary
                            ? (widget.color ?? Theme.of(context).primaryColor)
                                .withOpacity(0.1)
                            : ColorPalette.of(context)
                                .background
                                .withOpacity(0.45))
                        : widget.color ??
                            (widget.type == ButtonType.primary
                                ? Theme.of(context).primaryColor
                                : ColorPalette.of(context).background)),
                shadowColor: MaterialStateProperty.all(
                    (widget.color ?? ColorPalette.of(context).primary)
                        .withOpacity(0.6)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: (widget.enabled && !finalLoading)
                        ? widget.borderSide
                        : widget.borderSide
                            .copyWith(color: ColorPalette.of(context).divider),
                  ),
                ),
                padding: MaterialStateProperty.all(const EdgeInsets.all(4)),
              ),
          child: Builder(builder: (_) {
            Color foregroundColor = widget.foregroundColor ??
                (widget.type == ButtonType.primary
                    ? ColorPalette.of(context).white
                    : widget.enabled
                        ? ColorPalette.of(context).textCaption
                        : ColorPalette.of(context).textDisabled);
            return Switcher(
                child: finalLoading
                    ? Center(
                        key: const Key('loading'),
                        child: LoadingWidget(
                            color: foregroundColor, size: widget.height / 3))
                    : (widget.child ??
                        Center(
                          key: const Key('normal'),
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 4,
                            children: <Widget>[
                              if (widget.icon != null)
                                Icon(widget.icon,
                                    size: widget.iconSize,
                                    color: foregroundColor),
                              if (widget.text != null)
                                Text(widget.text!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .button!
                                        .copyWith(
                                            color: foregroundColor,
                                            fontWeight: FontWeight.w700)),
                            ],
                          ),
                        )));
          }),
        ),
      );
}
