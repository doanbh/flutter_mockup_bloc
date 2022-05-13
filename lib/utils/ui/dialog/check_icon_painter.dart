// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class CheckIconPainter extends CustomPainter {
  const CheckIconPainter();

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
    paint_0_fill.color = Color(0xff32BA7C).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.3722371, size.height * 0.7255543);
    path_1.lineTo(size.width * 0.6293357, size.height * 0.9826514);
    path_1.cubicTo(
        size.width * 0.8422686,
        size.height * 0.9258686,
        size.width * 0.9999986,
        size.height * 0.7318629,
        size.width * 0.9999986,
        size.height * 0.5000014);
    path_1.cubicTo(
        size.width * 0.9999986,
        size.height * 0.4952700,
        size.width * 0.9999986,
        size.height * 0.4905371,
        size.width * 0.9999986,
        size.height * 0.4858057);
    path_1.lineTo(size.width * 0.7981057, size.height * 0.2996857);
    path_1.lineTo(size.width * 0.3722371, size.height * 0.7255543);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xff0AA06E).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.5126343, size.height * 0.6119914);
    path_2.cubicTo(
        size.width * 0.5347157,
        size.height * 0.6340743,
        size.width * 0.5347157,
        size.height * 0.6719286,
        size.width * 0.5126343,
        size.height * 0.6940100);
    path_2.lineTo(size.width * 0.4668929, size.height * 0.7397514);
    path_2.cubicTo(
        size.width * 0.4448100,
        size.height * 0.7618343,
        size.width * 0.4069557,
        size.height * 0.7618343,
        size.width * 0.3848729,
        size.height * 0.7397514);
    path_2.lineTo(size.width * 0.1845586, size.height * 0.5378586);
    path_2.cubicTo(
        size.width * 0.1624757,
        size.height * 0.5157771,
        size.width * 0.1624757,
        size.height * 0.4779229,
        size.width * 0.1845586,
        size.height * 0.4558400);
    path_2.lineTo(size.width * 0.2303000, size.height * 0.4100986);
    path_2.cubicTo(
        size.width * 0.2523814,
        size.height * 0.3880171,
        size.width * 0.2902357,
        size.height * 0.3880171,
        size.width * 0.3123186,
        size.height * 0.4100986);
    path_2.lineTo(size.width * 0.5126343, size.height * 0.6119914);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.6877271, size.height * 0.2634086);
    path_3.cubicTo(
        size.width * 0.7098100,
        size.height * 0.2413271,
        size.width * 0.7476643,
        size.height * 0.2413271,
        size.width * 0.7697471,
        size.height * 0.2634086);
    path_3.lineTo(size.width * 0.8154871, size.height * 0.3091500);
    path_3.cubicTo(
        size.width * 0.8375700,
        size.height * 0.3312314,
        size.width * 0.8375700,
        size.height * 0.3690871,
        size.width * 0.8154871,
        size.height * 0.3911686);
    path_3.lineTo(size.width * 0.4684843, size.height * 0.7365943);
    path_3.cubicTo(
        size.width * 0.4464029,
        size.height * 0.7586771,
        size.width * 0.4085471,
        size.height * 0.7586771,
        size.width * 0.3864657,
        size.height * 0.7365943);
    path_3.lineTo(size.width * 0.3407243, size.height * 0.6908529);
    path_3.cubicTo(
        size.width * 0.3186429,
        size.height * 0.6687714,
        size.width * 0.3186429,
        size.height * 0.6309171,
        size.width * 0.3407243,
        size.height * 0.6088343);
    path_3.lineTo(size.width * 0.6877271, size.height * 0.2634086);
    path_3.close();

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_3, paint_3_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
