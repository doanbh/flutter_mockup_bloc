// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class EmailIconPainter extends CustomPainter {
  const EmailIconPainter();

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9583333, size.height * 0.1253333);
    path_0.cubicTo(
        size.width * 0.9540167,
        size.height * 0.1248887,
        size.width * 0.9496625,
        size.height * 0.1248887,
        size.width * 0.9453458,
        size.height * 0.1253333);
    path_0.lineTo(size.width * 0.05845417, size.height * 0.1253333);
    path_0.cubicTo(
        size.width * 0.05277000,
        size.height * 0.1254208,
        size.width * 0.04712333,
        size.height * 0.1262725,
        size.width * 0.04166667,
        size.height * 0.1278654);
    path_0.lineTo(size.width * 0.4993667, size.height * 0.5833333);
    path_0.lineTo(size.width * 0.9583333, size.height * 0.1253333);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff4C5BD4).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.9962500, size.height * 0.1666667);
    path_1.lineTo(size.width * 0.5412500, size.height * 0.6209292);
    path_1.cubicTo(
        size.width * 0.5295417,
        size.height * 0.6325958,
        size.width * 0.5137000,
        size.height * 0.6391458,
        size.width * 0.4971875,
        size.height * 0.6391458);
    path_1.cubicTo(
        size.width * 0.4806750,
        size.height * 0.6391458,
        size.width * 0.4648333,
        size.height * 0.6325958,
        size.width * 0.4531250,
        size.height * 0.6209292);
    path_1.lineTo(size.width * 0.002187500, size.height * 0.1701129);
    path_1.cubicTo(
        size.width * 0.0008012333,
        size.height * 0.1752204,
        size.width * 0.00006620875,
        size.height * 0.1804838,
        0,
        size.height * 0.1857771);
    path_1.lineTo(0, size.height * 0.8123417);
    path_1.cubicTo(
        0,
        size.height * 0.8289625,
        size.width * 0.006584792,
        size.height * 0.8448958,
        size.width * 0.01830583,
        size.height * 0.8566500);
    path_1.cubicTo(
        size.width * 0.03002683,
        size.height * 0.8684000,
        size.width * 0.04592417,
        size.height * 0.8750000,
        size.width * 0.06250000,
        size.height * 0.8750000);
    path_1.lineTo(size.width * 0.9375000, size.height * 0.8750000);
    path_1.cubicTo(
        size.width * 0.9540750,
        size.height * 0.8750000,
        size.width * 0.9699750,
        size.height * 0.8684000,
        size.width * 0.9816958,
        size.height * 0.8566500);
    path_1.cubicTo(size.width * 0.9934167, size.height * 0.8448958, size.width,
        size.height * 0.8289625, size.width, size.height * 0.8123417);
    path_1.lineTo(size.width, size.height * 0.1857771);
    path_1.cubicTo(
        size.width * 0.9997500,
        size.height * 0.1792500,
        size.width * 0.9984875,
        size.height * 0.1728017,
        size.width * 0.9962500,
        size.height * 0.1666667);
    path_1.close();
    path_1.moveTo(size.width * 0.1053125, size.height * 0.8123417);
    path_1.lineTo(size.width * 0.06187500, size.height * 0.8123417);
    path_1.lineTo(size.width * 0.06187500, size.height * 0.7675458);
    path_1.lineTo(size.width * 0.2890625, size.height * 0.5416667);
    path_1.lineTo(size.width * 0.3331250, size.height * 0.5858417);
    path_1.lineTo(size.width * 0.1053125, size.height * 0.8123417);
    path_1.close();
    path_1.moveTo(size.width * 0.9368750, size.height * 0.8123417);
    path_1.lineTo(size.width * 0.8931250, size.height * 0.8123417);
    path_1.lineTo(size.width * 0.6653125, size.height * 0.5858417);
    path_1.lineTo(size.width * 0.7093750, size.height * 0.5416667);
    path_1.lineTo(size.width * 0.9365625, size.height * 0.7675458);
    path_1.lineTo(size.width * 0.9368750, size.height * 0.8123417);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xff4C5BD4).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
