import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FadeClickable extends StatefulWidget {
  const FadeClickable({
    required this.child,
    Key? key,
    this.onTap,
    this.duration = const Duration(milliseconds: 150),
  }) : super(key: key);

  final Widget child;
  final GestureTapCallback? onTap;
  final Duration duration;

  @override
  _FadeClickableState createState() => _FadeClickableState();
}

class _FadeClickableState extends State<FadeClickable> with SingleTickerProviderStateMixin {
  double _opacity = 1;

  void _onTapDown(TapDownDetails details) {
    _fade();
  }

  void _onTapUp(TapUpDetails details) {
    Future.delayed(Duration(milliseconds: widget.duration.inMilliseconds + 60), _show);
  }

  void _onTapCancel() {
    _show();
  }

  void _show() {
    setState(() {
      _opacity = 1;
    });
  }

  void _fade() {
    setState(() {
      _opacity = 0.85;
    });
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: widget.onTap == null ? null : _onTapDown,
        onTapUp: widget.onTap == null ? null : _onTapUp,
        onTapCancel: widget.onTap == null ? null : _onTapCancel,
        onTap: widget.onTap,
        child: AnimatedOpacity(
          duration: widget.duration,
          opacity: _opacity,
          child: widget.child,
        ),
      );
}
