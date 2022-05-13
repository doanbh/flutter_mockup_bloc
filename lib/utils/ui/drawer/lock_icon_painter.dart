// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class LockIconPainter extends CustomPainter {
  const LockIconPainter();

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.6666667, size.height * 0.3333333);
    path_0.lineTo(size.width * 0.6666667, size.height * 0.2916667);
    path_0.cubicTo(
        size.width * 0.6666667,
        size.height * 0.1996192,
        size.width * 0.5920458,
        size.height * 0.1250000,
        size.width * 0.5000000,
        size.height * 0.1250000);
    path_0.cubicTo(
        size.width * 0.4079525,
        size.height * 0.1250000,
        size.width * 0.3333333,
        size.height * 0.1996192,
        size.width * 0.3333333,
        size.height * 0.2916667);
    path_0.lineTo(size.width * 0.3333333, size.height * 0.3333333);

    Paint paint_0_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.08333333;
    paint_0_stroke.color = Color(0xff4C5BD4).withOpacity(1.0);
    paint_0_stroke.strokeCap = StrokeCap.round;
    canvas.drawPath(path_0, paint_0_stroke);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.1616117, size.height * 0.3282783);
    path_1.cubicTo(
        size.width * 0.1250000,
        size.height * 0.3648900,
        size.width * 0.1250000,
        size.height * 0.4238167,
        size.width * 0.1250000,
        size.height * 0.5416667);
    path_1.lineTo(size.width * 0.1250000, size.height * 0.5833333);
    path_1.cubicTo(
        size.width * 0.1250000,
        size.height * 0.7404667,
        size.width * 0.1250000,
        size.height * 0.8190375,
        size.width * 0.1738154,
        size.height * 0.8678500);
    path_1.cubicTo(
        size.width * 0.2226312,
        size.height * 0.9166667,
        size.width * 0.3011983,
        size.height * 0.9166667,
        size.width * 0.4583333,
        size.height * 0.9166667);
    path_1.lineTo(size.width * 0.5416667, size.height * 0.9166667);
    path_1.cubicTo(
        size.width * 0.6988000,
        size.height * 0.9166667,
        size.width * 0.7773708,
        size.height * 0.9166667,
        size.width * 0.8261833,
        size.height * 0.8678500);
    path_1.cubicTo(
        size.width * 0.8750000,
        size.height * 0.8190375,
        size.width * 0.8750000,
        size.height * 0.7404667,
        size.width * 0.8750000,
        size.height * 0.5833333);
    path_1.lineTo(size.width * 0.8750000, size.height * 0.5416667);
    path_1.cubicTo(
        size.width * 0.8750000,
        size.height * 0.4238167,
        size.width * 0.8750000,
        size.height * 0.3648900,
        size.width * 0.8383875,
        size.height * 0.3282783);
    path_1.cubicTo(
        size.width * 0.8017750,
        size.height * 0.2916667,
        size.width * 0.7428500,
        size.height * 0.2916667,
        size.width * 0.6250000,
        size.height * 0.2916667);
    path_1.lineTo(size.width * 0.3750000, size.height * 0.2916667);
    path_1.cubicTo(
        size.width * 0.2571487,
        size.height * 0.2916667,
        size.width * 0.1982233,
        size.height * 0.2916667,
        size.width * 0.1616117,
        size.height * 0.3282783);
    path_1.close();
    path_1.moveTo(size.width * 0.5000000, size.height * 0.6250000);
    path_1.cubicTo(
        size.width * 0.5230125,
        size.height * 0.6250000,
        size.width * 0.5416667,
        size.height * 0.6063458,
        size.width * 0.5416667,
        size.height * 0.5833333);
    path_1.cubicTo(
        size.width * 0.5416667,
        size.height * 0.5603208,
        size.width * 0.5230125,
        size.height * 0.5416667,
        size.width * 0.5000000,
        size.height * 0.5416667);
    path_1.cubicTo(
        size.width * 0.4769875,
        size.height * 0.5416667,
        size.width * 0.4583333,
        size.height * 0.5603208,
        size.width * 0.4583333,
        size.height * 0.5833333);
    path_1.cubicTo(
        size.width * 0.4583333,
        size.height * 0.6063458,
        size.width * 0.4769875,
        size.height * 0.6250000,
        size.width * 0.5000000,
        size.height * 0.6250000);
    path_1.close();
    path_1.moveTo(size.width * 0.6250000, size.height * 0.5833333);
    path_1.cubicTo(
        size.width * 0.6250000,
        size.height * 0.6377583,
        size.width * 0.5902167,
        size.height * 0.6840625,
        size.width * 0.5416667,
        size.height * 0.7012208);
    path_1.lineTo(size.width * 0.5416667, size.height * 0.7916667);
    path_1.lineTo(size.width * 0.4583333, size.height * 0.7916667);
    path_1.lineTo(size.width * 0.4583333, size.height * 0.7012208);
    path_1.cubicTo(
        size.width * 0.4097837,
        size.height * 0.6840625,
        size.width * 0.3750000,
        size.height * 0.6377583,
        size.width * 0.3750000,
        size.height * 0.5833333);
    path_1.cubicTo(
        size.width * 0.3750000,
        size.height * 0.5142958,
        size.width * 0.4309625,
        size.height * 0.4583333,
        size.width * 0.5000000,
        size.height * 0.4583333);
    path_1.cubicTo(
        size.width * 0.5690375,
        size.height * 0.4583333,
        size.width * 0.6250000,
        size.height * 0.5142958,
        size.width * 0.6250000,
        size.height * 0.5833333);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xff4C5BD4).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
