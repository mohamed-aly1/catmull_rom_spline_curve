library catmull_rom_spline_curve;

import 'dart:ui';

import 'package:flutter/material.dart';

class CatmullCurve {
  static CustomPaint drawCurve(Offset p1, Offset p2, Offset p3, Color color,
      double strokeWidth, PaintingStyle style,
      {bool drawPoints = false, double? pointsStrokeWidth}) {
    return CustomPaint(
        painter: CurvePainter(
            p1: p1,
            p2: p2,
            p3: p3,
            color: color,
            strokeWidth: strokeWidth,
            style: style,
            drawPoints: drawPoints,
            pointsStrokeWidth: pointsStrokeWidth ?? strokeWidth * 2));
  }
}

class CurvePainter extends CustomPainter {
  final Offset p1;
  final Offset p2;
  final Offset p3;
  final Color color;
  final double strokeWidth;
  final PaintingStyle style;
  final bool drawPoints;
  final double pointsStrokeWidth;

  CurvePainter({
    super.repaint,
    required this.p1,
    required this.p2,
    required this.p3,
    required this.color,
    required this.strokeWidth,
    required this.style,
    required this.drawPoints,
    required this.pointsStrokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final Offset p1Spline = p1;
    final Offset p2Spline = p1 - ((p1 - p2) / 6);
    final Offset p3Spline = p2 - ((p3 - p1) / 6);
    final Offset p4Spline = p2;
    final Offset p5Spline = p2;
    final Offset p6Spline = p2 + ((p3 - p1) / 6);
    final Offset p7Spline = p3 - ((p3 - p2) / 6);
    final Offset p8Spline = p3;

    final paint = Paint();
    paint.color = color;
    paint.strokeWidth = strokeWidth;
    paint.style = style;

    final pointsPaint = Paint();
    pointsPaint.color = color;
    pointsPaint.strokeWidth = pointsStrokeWidth;
    pointsPaint.style = style;
    pointsPaint.strokeCap = StrokeCap.round;

    path.moveTo(p1Spline.dx, p1Spline.dy);
    path.cubicTo(p2Spline.dx, p2Spline.dy, p3Spline.dx, p3Spline.dy,
        p4Spline.dx, p4Spline.dy);
    path.moveTo(p5Spline.dx, p5Spline.dy);
    path.cubicTo(p6Spline.dx, p6Spline.dy, p7Spline.dx, p7Spline.dy,
        p8Spline.dx, p8Spline.dy);

    canvas.drawPath(path, paint);
    if (drawPoints == true) {
      canvas.drawPoints(PointMode.points, [p1, p2, p3], pointsPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
