import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:s_house/common/styles/colorPalette/color_palette.dart';

enum ToastType { error, success, info, warning }

class Toast {
  static CancelFunc? cancelFunc;

  static void show(String text,
      {ToastType type = ToastType.error, EdgeInsetsGeometry? margin}) {
    if (cancelFunc != null) {
      cancelFunc!.call();
    }
    cancelFunc = BotToast.showCustomText(
      duration: getDuration(text),
      align: Alignment.bottomRight,
      toastBuilder: (_) => Builder(builder: (BuildContext context) {
        late Color background;
        late Color foreground;
        late IconData icon;
        switch (type) {
          case ToastType.error:
            background = ColorPalette.light.error.background;
            foreground = ColorPalette.light.error.dark;
            icon = Icons.cancel_rounded;
            break;
          case ToastType.success:
            background = ColorPalette.light.success.background;
            foreground = ColorPalette.light.success.dark;
            icon = Icons.check_circle_rounded;
            break;
          case ToastType.info:
            background = ColorPalette.light.info.background;
            foreground = ColorPalette.light.info.dark;
            icon = Icons.info_rounded;
            break;
          case ToastType.warning:
            background = ColorPalette.light.warning.background;
            foreground = ColorPalette.light.warning.dark;
            icon = Icons.warning_rounded;
            break;
        }
        return GestureDetector(
          onTap: getDuration(text).inMilliseconds > 3000
              ? () {
                  if (cancelFunc != null) {
                    cancelFunc!.call();
                  }
                }
              : null,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30)
                .add(margin ?? EdgeInsets.zero),
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.horizontal(left: Radius.circular(10)),
              color: background,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    blurRadius: 10,
                    offset: const Offset(-3, 3),
                    color: Colors.black.withOpacity(0.1))
              ],
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(width: 2, color: foreground),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 13, horizontal: 12),
                        child: Row(
                          children: <Widget>[
                            Icon(icon, color: foreground, size: 22),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(text,
                                    style:
                                        Theme.of(context).textTheme.subtitle2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
      wrapToastAnimation:
          (AnimationController controller, CancelFunc cancel, Widget child) =>
              CustomAnimationWidget(
        controller: controller,
        child: child,
      ),
    );
  }

  static Duration getDuration(String? text) {
    int milliseconds = ((text?.length ?? 0) * 48).round();
    milliseconds = milliseconds < 2000 ? 2000 : milliseconds;
    milliseconds = milliseconds > 6000 ? 6000 : milliseconds;
    return Duration(milliseconds: milliseconds);
  }
}

class CustomAnimationWidget extends StatefulWidget {
  const CustomAnimationWidget(
      {required this.controller, required this.child, Key? key})
      : super(key: key);

  final AnimationController controller;
  final Widget child;

  @override
  _CustomAnimationWidgetState createState() => _CustomAnimationWidgetState();
}

class _CustomAnimationWidgetState extends State<CustomAnimationWidget> {
  static final Tween<Offset> tweenOffset = Tween<Offset>(
    begin: const Offset(125, 0),
    end: const Offset(0, 0),
  );

  static final Tween<double> tweenScale = Tween<double>(begin: 0.7, end: 1.0);
  late Animation<double> animation;

  @override
  void initState() {
    animation =
        CurvedAnimation(parent: widget.controller, curve: Curves.decelerate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) => Transform.translate(
          offset: tweenOffset.evaluate(animation),
          child: Transform.scale(
            scale: tweenScale.evaluate(animation),
            child: Opacity(
              opacity: animation.value,
              child: child,
            ),
          ),
        ),
        child: widget.child,
      );
}
