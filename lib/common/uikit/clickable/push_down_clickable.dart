import 'package:flutter/material.dart';

class PushDownClickable extends StatefulWidget {
  const PushDownClickable({
    required this.onTap,
    required this.child,
    Key? key,
    this.duration = const Duration(milliseconds: 130),
  }) : super(key: key);

  final Widget child;
  final GestureTapCallback? onTap;
  final Duration duration;

  @override
  _PushDownClickableState createState() => _PushDownClickableState();
}

class _PushDownClickableState extends State<PushDownClickable> with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      upperBound: 0.1,
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
    _scale = 1 - _controller.value;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: widget.onTap == null ? null : _onTapDown,
      onTapUp: widget.onTap == null ? null : _onTapUp,
      onTapCancel: widget.onTap == null ? null : _onTapCancel,
      onTap: widget.onTap,
      child: Transform.scale(
        scale: _scale,
        child: widget.child,
      ),
    );
  }
}
