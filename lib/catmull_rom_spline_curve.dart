library catmull_rom_spline_curve;

import 'dart:ui';

import 'package:flutter/material.dart';

// The catmull curve class
class CatmullCurve {
// drawCurve static function to be called through a class object
  static CustomPaint drawCurve(
      List<Offset> points, Color color, double strokeWidth, PaintingStyle style,
      {bool drawPoints = false,
      double? pointsStrokeWidth,
      Color pointcolor = Colors.red}) {
    return CustomPaint(
        painter: CurvePainter(
            points: points,
            color: color,
            strokeWidth: strokeWidth,
            style: style,
            drawPoints: drawPoints,
            pointcolor: pointcolor,
            pointsStrokeWidth: pointsStrokeWidth ?? strokeWidth * 2));
  }
}

// CurvePainter Class that extends Flutter Custom Painter to do the Graphics part
class CurvePainter extends CustomPainter {
  final List<Offset> points;
  final Color color;
  final Color pointcolor;
  final double strokeWidth;
  final PaintingStyle style;
  final bool drawPoints;
  final double pointsStrokeWidth;

  CurvePainter({
    super.repaint,
    required this.points,
    required this.color,
    required this.pointcolor,
    required this.strokeWidth,
    required this.style,
    required this.drawPoints,
    required this.pointsStrokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();

    for (int i = 0; i < points.length - 1; i++) {
      Offset p1;
      Offset p2;
      Offset p3;

      Offset p1Spline;
      Offset p2Spline;
      Offset p3Spline;
      Offset p4Spline;
      if (points.length < 3) {
        p1 = points[i];
        p2 = points[i + 1];
        p3 = points[i];
        p1Spline = p1;
        p2Spline = p1;
        p3Spline = p2;
        p4Spline = p2;
      } else if (i == 0) {
        p1 = points[i];
        p2 = points[i + 1];
        p3 = points[i + 2];
        p1Spline = p1;
        p2Spline = p1 - ((p1 - p2) / 6);
        p3Spline = p2 - ((p3 - p1) / 6);
        p4Spline = p2;
      } else if (i == points.length - 1) {
        p1 = points[i - 1];
        p2 = points[i];
        p3 = points[i + 1];
        p1Spline = p2;
        p2Spline = p2 + ((p2 - p1) / 6);
        p3Spline = p3 - ((p3 - p2) / 6);
        p4Spline = p3;
      } else {
        p1 = points[i - 1];
        p2 = points[i];
        p3 = points[i + 1];
        p1Spline = p2;
        p2Spline = p2 + ((p2 - p1) / 6);
        p3Spline = p3 - ((p3 - p1) / 6);
        p4Spline = p3;
      }

      final paint = Paint();
      paint.color = color;
      paint.strokeWidth = strokeWidth;
      paint.style = style;

      final pointsPaint = Paint();
      pointsPaint.color = pointcolor;
      pointsPaint.strokeWidth = pointsStrokeWidth;
      pointsPaint.style = style;
      pointsPaint.strokeCap = StrokeCap.round;

      path.moveTo(p1Spline.dx, p1Spline.dy);
      path.cubicTo(p2Spline.dx, p2Spline.dy, p3Spline.dx, p3Spline.dy,
          p4Spline.dx, p4Spline.dy);

      canvas.drawPath(path, paint);
      if (drawPoints == true) {
        canvas.drawPoints(PointMode.points, points, pointsPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
