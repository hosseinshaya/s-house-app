import 'package:flutter/material.dart';

class SizeIndexedStack extends StatelessWidget {
  const SizeIndexedStack({Key? key, required this.index, required this.children}) : super(key: key);

  final int index;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => AnimatedSize(
        duration: const Duration(milliseconds: 200),
        child: SizedBox(
          key: Key('sizeIndexedStackItem$index'),
          child: children[index],
        ),
      );
}
