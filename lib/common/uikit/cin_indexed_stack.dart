import 'package:flutter/material.dart';

class CinIndexedStack extends StatelessWidget {
  const CinIndexedStack({required this.index, required this.children, Key? key}) : super(key: key);

  final int index;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => FadeIndexedStack(
        index: index,
        children: children
            .asMap()
            .map((index, Widget element) => MapEntry(index, Visibility(visible: index == this.index, child: element)))
            .values
            .toList(),
      );
}

class FadeIndexedStack extends StatefulWidget {
  const FadeIndexedStack({
    required this.index,
    required this.children,
    Key? key,
    this.duration = const Duration(
      milliseconds: 350,
    ),
  }) : super(key: key);

  final int index;
  final List<Widget> children;
  final Duration duration;

  @override
  _FadeIndexedStackState createState() => _FadeIndexedStackState();
}

class _FadeIndexedStackState extends State<FadeIndexedStack> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void didUpdateWidget(FadeIndexedStack oldWidget) {
    if (widget.index != oldWidget.index) {
      _controller.forward(from: 0.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
        opacity: _controller,
        child: IndexedStack(
          index: widget.index,
          children: widget.children,
        ),
      );
}
