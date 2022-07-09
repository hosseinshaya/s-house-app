import 'package:flutter/material.dart';

enum SwitcherAnimation { scale, rotate, fade }

class Switcher extends StatelessWidget {
  const Switcher(
      {Key? key,
      this.child,
      this.switcherAnimation = SwitcherAnimation.scale,
      this.duration,
      this.alignment = Alignment.center,
      this.switchInCurve = Curves.linear,
      this.switchOutCurve = Curves.linear})
      : super(key: key);

  final Widget? child;
  final SwitcherAnimation switcherAnimation;
  final Duration? duration;
  final Alignment alignment;
  final Curve switchInCurve;
  final Curve switchOutCurve;

  @override
  Widget build(BuildContext context) => AnimatedSwitcher(
      duration: duration ?? const Duration(milliseconds: 220),
      switchInCurve: switchInCurve,
      switchOutCurve: switchOutCurve,
      transitionBuilder: (Widget child, Animation<double> animation) => switcherAnimation == SwitcherAnimation.scale
          ? ScaleTransition(scale: animation, alignment: alignment, child: child)
          : switcherAnimation == SwitcherAnimation.rotate
              ? RotationTransition(turns: animation, child: child)
              : FadeTransition(opacity: animation, child: child),
      child: child);
}
