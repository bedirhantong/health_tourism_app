import 'package:flutter/material.dart';

class SliderThumbShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(0, 0);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double>? activationAnimation,
    Animation<double>? enableAnimation,
    bool? isDiscrete,
    TextPainter? labelPainter,
    RenderBox? parentBox,
    required Size sizeWithOverflow,
    SliderThemeData? sliderTheme,
    TextDirection? textDirection,
    required double textScaleFactor,
    double? value,
    Offset? secondaryOffset,
  }) {
    final canvas = context.canvas;

    final thumbRadius = sizeWithOverflow.width / 30;
    final circleRadius = thumbRadius / 2; 
    final circleCenter = center;

    final thumbPaint = Paint()
      ..color = sliderTheme?.thumbColor ?? Colors.blue
      ..style = PaintingStyle.fill;

    final circlePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, thumbRadius, thumbPaint);
    canvas.drawCircle(circleCenter, circleRadius, circlePaint);
  }
}
