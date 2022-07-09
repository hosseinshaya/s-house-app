import 'package:flutter/material.dart';
import 'package:s_house/common/styles/colorPalette/color_palette_helper.dart';
import 'package:s_house/common/uikit/switcher.dart';

class CircleBadge extends StatelessWidget {
  const CircleBadge({Key? key, this.visibility = true, this.size = 7}) : super(key: key);

  final bool visibility;
  final double size;

  @override
  Widget build(BuildContext context) => Switcher(
        child: visibility
            ? AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: context.colors.scaffoldBackground, width: 2),
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    color: context.colors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      );
}
