import 'package:flutter/material.dart';

class PushUpClickable extends StatefulWidget {
  const PushUpClickable({
    required this.child,
    Key? key,
    this.onTap,
    this.duration = const Duration(milliseconds: 130),
    this.scale = 0.15,
  }) : super(key: key);

  final Widget child;
  final GestureTapCallback? onTap;
  final Duration duration;
  final double scale;

  @override
  _PushUpClickableState createState() => _PushUpClickableState();
}

class _PushUpClickableState extends State<PushUpClickable> with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      upperBound: widget.scale,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    Future.delayed(Duration(milliseconds: widget.duration.inMilliseconds + 20), () {
      _controller.reverse();
    });
  }

  void _onTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 + _controller.value;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: widget.onTap,
      child: Transform.scale(
        scale: _scale,
        child: widget.child,
      ),
    );
  }
}
