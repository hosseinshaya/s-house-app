import 'package:flutter/material.dart';

class AnimatedCondition extends StatelessWidget {
  // ignore: avoid_positional_boolean_parameters
  const AnimatedCondition(this.condition, {required this.child, Key? key}) : super(key: key);

  final bool condition;
  final Widget child;

  @override
  Widget build(BuildContext context) => AnimatedSize(
        duration: const Duration(milliseconds: 200),
        child: condition ? child : const SizedBox(key: Key('shrink'), width: double.infinity),
      );
}
