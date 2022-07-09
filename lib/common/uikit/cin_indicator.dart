import 'package:flutter/widgets.dart';

enum CinIndicatorSize {
  tiny,
  normal,
  full,
  normalForIconTab,
}

class CinIndicator extends Decoration {
  const CinIndicator(
      {this.indicatorHeight = 3, required this.indicatorColor, this.indicatorSize = CinIndicatorSize.normal});

  final double indicatorHeight;
  final Color indicatorColor;
  final CinIndicatorSize indicatorSize;

  @override
  CinIndicatorPainter createBoxPainter([VoidCallback? onChanged]) => CinIndicatorPainter(this, onChanged);
}

class CinIndicatorPainter extends BoxPainter {
  CinIndicatorPainter(this.decoration, VoidCallback? onChanged) : super(onChanged);

  final CinIndicator decoration;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    late Rect rect;
    if (decoration.indicatorSize == CinIndicatorSize.full) {
      rect = Offset(offset.dx, configuration.size!.height - decoration.indicatorHeight) &
          Size(configuration.size!.width, decoration.indicatorHeight);
    } else if (decoration.indicatorSize == CinIndicatorSize.normal) {
      rect = Offset(offset.dx + 6, configuration.size!.height - decoration.indicatorHeight) &
          Size(configuration.size!.width - 12, decoration.indicatorHeight);
    } else if (decoration.indicatorSize == CinIndicatorSize.tiny) {
      rect = Offset(
              offset.dx + configuration.size!.width / 2 - 8, configuration.size!.height - decoration.indicatorHeight) &
          Size(16, decoration.indicatorHeight);
    } else if (decoration.indicatorSize == CinIndicatorSize.normalForIconTab) {
      rect = Offset(offset.dx + 45, configuration.size!.height - decoration.indicatorHeight) &
          Size(configuration.size!.width - 90, decoration.indicatorHeight);
    }

    final Paint paint = Paint();
    paint.color = decoration.indicatorColor;
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(
        RRect.fromRectAndCorners(rect, topRight: const Radius.circular(8), topLeft: const Radius.circular(8)), paint);
  }
}
