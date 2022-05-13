// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class TrashIconPainter extends CustomPainter {
  const TrashIconPainter();

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
    paint_0_fill.color = Color(0xffF56868).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.9985943, size.height * 0.5376543);
    path_1.lineTo(size.width * 0.7314457, size.height * 0.2705057);
    path_1.lineTo(size.width * 0.6838943, size.height * 0.2431657);
    path_1.lineTo(size.width * 0.5999100, size.height * 0.1589700);
    path_1.lineTo(size.width * 0.4290371, size.height * 0.1796857);
    path_1.lineTo(size.width * 0.4000900, size.height * 0.2402329);
    path_1.lineTo(size.width * 0.2402343, size.height * 0.3601243);
    path_1.lineTo(size.width * 0.3606271, size.height * 0.4805171);
    path_1.lineTo(size.width * 0.3217600, size.height * 0.8410229);
    path_1.lineTo(size.width * 0.4803129, size.height * 0.9995757);
    path_1.cubicTo(
        size.width * 0.4868471,
        size.height * 0.9998300,
        size.width * 0.4934029,
        size.height * 0.9999971,
        size.width * 0.4999986,
        size.height * 0.9999971);
    path_1.cubicTo(
        size.width * 0.7634743,
        size.height * 0.9999971,
        size.width * 0.9793414,
        size.height * 0.7962043,
        size.width * 0.9985943,
        size.height * 0.5376543);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xffF54C4C).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.4000843, size.height * 0.1589743);
    path_2.lineTo(size.width * 0.4000843, size.height * 0.2801986);
    path_2.lineTo(size.width * 0.5999043, size.height * 0.2801986);
    path_2.lineTo(size.width * 0.5999043, size.height * 0.1589743);
    path_2.lineTo(size.width * 0.4000843, size.height * 0.1589743);
    path_2.close();
    path_2.moveTo(size.width * 0.5599400, size.height * 0.2402343);
    path_2.lineTo(size.width * 0.4400471, size.height * 0.2402343);
    path_2.lineTo(size.width * 0.4400471, size.height * 0.1989371);
    path_2.lineTo(size.width * 0.5599400, size.height * 0.1989371);
    path_2.lineTo(size.width * 0.5599400, size.height * 0.2402343);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Color(0xff8B8892).withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.5999100, size.height * 0.1589743);
    path_3.lineTo(size.width * 0.5999100, size.height * 0.2801986);
    path_3.lineTo(size.width * 0.5000000, size.height * 0.2801986);
    path_3.lineTo(size.width * 0.5000000, size.height * 0.2402343);
    path_3.lineTo(size.width * 0.5599457, size.height * 0.2402343);
    path_3.lineTo(size.width * 0.5599457, size.height * 0.1989371);
    path_3.lineTo(size.width * 0.5000000, size.height * 0.1989371);
    path_3.lineTo(size.width * 0.5000000, size.height * 0.1589743);
    path_3.lineTo(size.width * 0.5999100, size.height * 0.1589743);
    path_3.close();

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = Color(0xff787780).withOpacity(1.0);
    canvas.drawPath(path_3, paint_3_fill);

    Path path_4 = Path();
    path_4.moveTo(size.width * 0.2782086, size.height * 0.3201629);
    path_4.lineTo(size.width * 0.3217671, size.height * 0.8410257);
    path_4.lineTo(size.width * 0.6782471, size.height * 0.8410257);
    path_4.lineTo(size.width * 0.7218057, size.height * 0.3201629);
    path_4.lineTo(size.width * 0.2782086, size.height * 0.3201629);
    path_4.close();

    Paint paint_4_fill = Paint()..style = PaintingStyle.fill;
    paint_4_fill.color = Color(0xffAEADB3).withOpacity(1.0);
    canvas.drawPath(path_4, paint_4_fill);

    Path path_5 = Path();
    path_5.moveTo(size.width * 0.7217986, size.height * 0.3201629);
    path_5.lineTo(size.width * 0.6782400, size.height * 0.8410257);
    path_5.lineTo(size.width * 0.5000000, size.height * 0.8410257);
    path_5.lineTo(size.width * 0.5000000, size.height * 0.3201629);
    path_5.lineTo(size.width * 0.7217986, size.height * 0.3201629);
    path_5.close();

    Paint paint_5_fill = Paint()..style = PaintingStyle.fill;
    paint_5_fill.color = Color(0xff8B8892).withOpacity(1.0);
    canvas.drawPath(path_5, paint_5_fill);

    Path path_6 = Path();
    path_6.moveTo(size.width * 0.6598557, size.height * 0.2402343);
    path_6.lineTo(size.width * 0.3401443, size.height * 0.2402343);
    path_6.cubicTo(
        size.width * 0.2849943,
        size.height * 0.2402343,
        size.width * 0.2402343,
        size.height * 0.2849943,
        size.width * 0.2402343,
        size.height * 0.3401443);
    path_6.lineTo(size.width * 0.2402343, size.height * 0.3601271);
    path_6.lineTo(size.width * 0.7597657, size.height * 0.3601271);
    path_6.lineTo(size.width * 0.7597657, size.height * 0.3401443);
    path_6.cubicTo(
        size.width * 0.7597657,
        size.height * 0.2849943,
        size.width * 0.7150057,
        size.height * 0.2402343,
        size.width * 0.6598557,
        size.height * 0.2402343);
    path_6.close();

    Paint paint_6_fill = Paint()..style = PaintingStyle.fill;
    paint_6_fill.color = Color(0xffE5E5E5).withOpacity(1.0);
    canvas.drawPath(path_6, paint_6_fill);

    Path path_7 = Path();
    path_7.moveTo(size.width * 0.5199871, size.height * 0.4400571);
    path_7.lineTo(size.width * 0.4800229, size.height * 0.4400571);
    path_7.lineTo(size.width * 0.4800229, size.height * 0.7610914);
    path_7.lineTo(size.width * 0.5199871, size.height * 0.7610914);
    path_7.lineTo(size.width * 0.5199871, size.height * 0.4400571);
    path_7.close();

    Paint paint_7_fill = Paint()..style = PaintingStyle.fill;
    paint_7_fill.color = Color(0xffE5E5E5).withOpacity(1.0);
    canvas.drawPath(path_7, paint_7_fill);

    Path path_8 = Path();
    path_8.moveTo(size.width * 0.5999257, size.height * 0.4400571);
    path_8.lineTo(size.width * 0.5599614, size.height * 0.4400571);
    path_8.lineTo(size.width * 0.5599614, size.height * 0.7610914);
    path_8.lineTo(size.width * 0.5999257, size.height * 0.7610914);
    path_8.lineTo(size.width * 0.5999257, size.height * 0.4400571);
    path_8.close();

    Paint paint_8_fill = Paint()..style = PaintingStyle.fill;
    paint_8_fill.color = Color(0xffC8C6CD).withOpacity(1.0);
    canvas.drawPath(path_8, paint_8_fill);

    Path path_9 = Path();
    path_9.moveTo(size.width * 0.4400757, size.height * 0.4400571);
    path_9.lineTo(size.width * 0.4001114, size.height * 0.4400571);
    path_9.lineTo(size.width * 0.4001114, size.height * 0.7610914);
    path_9.lineTo(size.width * 0.4400757, size.height * 0.7610914);
    path_9.lineTo(size.width * 0.4400757, size.height * 0.4400571);
    path_9.close();

    Paint paint_9_fill = Paint()..style = PaintingStyle.fill;
    paint_9_fill.color = Color(0xffE5E5E5).withOpacity(1.0);
    canvas.drawPath(path_9, paint_9_fill);

    Path path_10 = Path();
    path_10.moveTo(size.width * 0.5199829, size.height * 0.4400571);
    path_10.lineTo(size.width * 0.5000000, size.height * 0.4400571);
    path_10.lineTo(size.width * 0.5000000, size.height * 0.7610914);
    path_10.lineTo(size.width * 0.5199829, size.height * 0.7610914);
    path_10.lineTo(size.width * 0.5199829, size.height * 0.4400571);
    path_10.close();

    Paint paint_10_fill = Paint()..style = PaintingStyle.fill;
    paint_10_fill.color = Color(0xffC8C6CD).withOpacity(1.0);
    canvas.drawPath(path_10, paint_10_fill);

    Path path_11 = Path();
    path_11.moveTo(size.width * 0.7597657, size.height * 0.3401443);
    path_11.lineTo(size.width * 0.7597657, size.height * 0.3601271);
    path_11.lineTo(size.width * 0.5000000, size.height * 0.3601271);
    path_11.lineTo(size.width * 0.5000000, size.height * 0.2402343);
    path_11.lineTo(size.width * 0.6598557, size.height * 0.2402343);
    path_11.cubicTo(
        size.width * 0.7150057,
        size.height * 0.2402343,
        size.width * 0.7597657,
        size.height * 0.2849943,
        size.width * 0.7597657,
        size.height * 0.3401443);
    path_11.close();

    Paint paint_11_fill = Paint()..style = PaintingStyle.fill;
    paint_11_fill.color = Color(0xffC8C6CD).withOpacity(1.0);
    canvas.drawPath(path_11, paint_11_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
