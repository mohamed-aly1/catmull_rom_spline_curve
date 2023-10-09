import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:catmull_rom_spline_curve/catmull_rom_spline_curve.dart';

void main() {
  test('return CustomPainter', () {
    final curvePainter = CurvePainter(
        points: [
          const Offset(100, 20),
          const Offset(125, 80),
          const Offset(150, 20),
        ],
        color: Colors.red,
        pointcolor: Colors.red,
        strokeWidth: 2.0,
        style: PaintingStyle.stroke,
        drawPoints: false,
        pointsStrokeWidth: 4.0);

    expect(curvePainter.points[0], const Offset(100, 20));
    expect(curvePainter.points[1], const Offset(125, 80));
    expect(curvePainter.points[2], const Offset(150, 20));
    expect(curvePainter.color, Colors.red);
    expect(curvePainter.strokeWidth, 2.0);
    expect(curvePainter.style, PaintingStyle.stroke);
    expect(curvePainter.drawPoints, false);
    expect(curvePainter.pointsStrokeWidth, 4.0);
  });
}
