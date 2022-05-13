// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class XIconPainter extends CustomPainter {
  const XIconPainter();

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5000000, size.height);
    path_0.cubicTo(size.width * 0.7761429, size.height, size.width,
        size.height * 0.7761429, size.width, size.height * 0.5000000);
    path_0.cubicTo(size.width, size.height * 0.2238571, size.width * 0.7761429,
        0, size.width * 0.5000000, 0);
    path_0.cubicTo(size.width * 0.2238571, 0, 0, size.height * 0.2238571, 0,
        size.height * 0.5000000);
    path_0.cubicTo(0, size.height * 0.7761429, size.width * 0.2238571,
        size.height, size.width * 0.5000000, size.height);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffE21B1B).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.9966300, size.height * 0.5572343);
    path_1.lineTo(size.width * 0.7185686, size.height * 0.2791714);
    path_1.lineTo(size.width * 0.2934429, size.height * 0.7199371);
    path_1.lineTo(size.width * 0.5686929, size.height * 0.9951871);
    path_1.cubicTo(
        size.width * 0.7936457,
        size.height * 0.9642500,
        size.width * 0.9708029,
        size.height * 0.7837657,
        size.width * 0.9966300,
        size.height * 0.5572343);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xffC40606).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.6921629, size.height * 0.7256557);
    path_2.cubicTo(
        size.width * 0.6821629,
        size.height * 0.7256557,
        size.width * 0.6721771,
        size.height * 0.7218429,
        size.width * 0.6645371,
        size.height * 0.7142186);
    path_2.lineTo(size.width * 0.2859743, size.height * 0.3356400);
    path_2.cubicTo(
        size.width * 0.2707086,
        size.height * 0.3203743,
        size.width * 0.2707086,
        size.height * 0.2956557,
        size.width * 0.2859743,
        size.height * 0.2804057);
    path_2.cubicTo(
        size.width * 0.3012400,
        size.height * 0.2651557,
        size.width * 0.3259586,
        size.height * 0.2651400,
        size.width * 0.3412086,
        size.height * 0.2804057);
    path_2.lineTo(size.width * 0.7197871, size.height * 0.6589843);
    path_2.cubicTo(
        size.width * 0.7350529,
        size.height * 0.6742500,
        size.width * 0.7350529,
        size.height * 0.6989686,
        size.width * 0.7197871,
        size.height * 0.7142186);
    path_2.cubicTo(
        size.width * 0.7121471,
        size.height * 0.7218429,
        size.width * 0.7021629,
        size.height * 0.7256557,
        size.width * 0.6921629,
        size.height * 0.7256557);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.3135714, size.height * 0.7256557);
    path_3.cubicTo(
        size.width * 0.3035714,
        size.height * 0.7256557,
        size.width * 0.2935871,
        size.height * 0.7218429,
        size.width * 0.2859471,
        size.height * 0.7142171);
    path_3.cubicTo(
        size.width * 0.2706814,
        size.height * 0.6989514,
        size.width * 0.2706814,
        size.height * 0.6742329,
        size.width * 0.2859471,
        size.height * 0.6589829);
    path_3.lineTo(size.width * 0.6645243, size.height * 0.2804043);
    path_3.cubicTo(
        size.width * 0.6797900,
        size.height * 0.2651400,
        size.width * 0.7045100,
        size.height * 0.2651400,
        size.width * 0.7197600,
        size.height * 0.2804043);
    path_3.cubicTo(
        size.width * 0.7350086,
        size.height * 0.2956700,
        size.width * 0.7350243,
        size.height * 0.3203900,
        size.width * 0.7197600,
        size.height * 0.3356400);
    path_3.lineTo(size.width * 0.3411971, size.height * 0.7142171);
    path_3.cubicTo(
        size.width * 0.3335714,
        size.height * 0.7218429,
        size.width * 0.3235714,
        size.height * 0.7256557,
        size.width * 0.3135714,
        size.height * 0.7256557);
    path_3.close();

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_3, paint_3_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
