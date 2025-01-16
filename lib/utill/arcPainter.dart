import 'dart:math';

import 'package:flutter/material.dart';

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;

    // Red Gradient Arc
    final gradient = SweepGradient(
      startAngle: 0.5,
      endAngle: pi,
      colors: [
        const Color.fromARGB(0, 255, 255, 255).withOpacity(0.1),
        Color.fromARGB(255, 54, 192, 68).withOpacity(0.9),
        Color.fromARGB(222, 49, 219, 40).withOpacity(0.0)
      ],
      stops: [0.0, 0.5, 1.0],
    );

    final arcPaint = Paint()
      ..shader =
          gradient.createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0,
      pi,
      false,
      arcPaint,
    );

    // Curved "#hiring" Text
    drawCurvedText(canvas, center, radius - 5, "#hiring");
  }

  void drawCurvedText(
      Canvas canvas, Offset center, double radius, String text) {
    const textStyle = TextStyle(
        color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);
    double anglePerChar =
        pi / (text.length + 4); // Spread text along half-circle

    for (int i = 0; i < text.length; i++) {
      final charAngle = pi - (i + 1) * anglePerChar; // Start from 180 degrees

      // Character position
      final x = center.dx + radius * cos(charAngle);
      final y = center.dy + radius * sin(charAngle);

      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(charAngle - pi / 2); // Align text along the curve

      TextPainter(
        text: TextSpan(text: text[i], style: textStyle),
        textDirection: TextDirection.rtl,
      )
        ..layout()
        ..paint(canvas, const Offset(-5, -5)); // Center the character

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
