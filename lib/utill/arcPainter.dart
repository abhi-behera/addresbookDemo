import 'dart:math';

import 'package:flutter/material.dart';

class ArcPainter extends CustomPainter {
  final int shade; // colour of the tag
  final String status; // status text/ tag text need to be shown
  final double fontSize; // text font size
  final int fontColour;
  final double strokeWth; //tag stroke width
  final double radiusWth; // circle radius plus it moves it outside or inside
  final double letterSpacing; // space betten ech letter
  final double textDistancefromCenter;

  ArcPainter(
      {required this.shade,
      required this.status,
      required this.fontSize,
      required this.fontColour,
      required this.strokeWth,
      required this.radiusWth,
      required this.letterSpacing,
      required this.textDistancefromCenter});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - radiusWth;

    final gradient = SweepGradient(
      startAngle: 0.5,
      endAngle: pi,
      colors: [
        Color(shade).withOpacity(0.0),
        Color(shade).withOpacity(0.1),
        Color(shade).withOpacity(1),
        Color(shade).withOpacity(0.1),
        Color(shade).withOpacity(0.0),
      ],
      stops: const [0, 0.01, 0.8, 0.95, 1],
    );

    final arcPaint = Paint()
      ..shader =
          gradient.createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWth //tag stroke width
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0.3, // starting point of the arc...
      pi + 0.1, // end point of the arc...
      false,
      arcPaint,
    );

    drawCurvedText(canvas, center, radius - textDistancefromCenter, status);
  }

  void drawCurvedText(
      Canvas canvas, Offset center, double radius, String text) {
    TextStyle textStyle = TextStyle(
        color: const Color(0xFFFFFFFF),
        fontSize: fontSize,
        fontWeight: FontWeight.bold);
    double anglePerChar =
        pi / (text.length + letterSpacing); // Spread text along half-circle
    // inc the numeratore to make letter closer.

    for (int i = 0; i < text.length; i++) {
      final charAngle = pi - (i + 2) * anglePerChar; // Start from 180 degrees

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
