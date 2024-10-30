// painters/circular_progress_bar_painter.dart
import 'package:flutter/material.dart';

class CircularProgressBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Draw the background circle
    canvas.drawCircle(center, radius, paint);

    // Draw the progress
    final progressPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15;

    double malePercentage = 0.42; // Example value for male percentage
    double femalePercentage = 0.58; // Example value for female percentage

    double maleAngle = (malePercentage * 2 * 3.141592653589793238) - (3.141592653589793238 / 2);
    double femaleAngle = (femalePercentage * 2 * 3.141592653589793238) - (3.141592653589793238 / 2);

    // Draw male arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.141592653589793238 / 2,
      maleAngle,
      false,
      progressPaint,
    );

    // Draw female arc
    progressPaint.color = Colors.pink; // Change color for female
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      maleAngle - (3.141592653589793238 / 2),
      femaleAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}