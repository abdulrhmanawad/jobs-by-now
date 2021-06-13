import 'package:flutter/material.dart';

class CardPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint=Paint()..color=Colors.white..style=PaintingStyle.fill;
    Path path=Path()..moveTo(0.0,0.0);
    path.lineTo(size.width-20, 0.0);
    path.quadraticBezierTo(size.width, 0.0, size.width,20.0);
    path.lineTo(size.width,size.height*0.40);
    path.arcToPoint(Offset(size.width,size.height*0.60),radius: Radius.circular(10),clockwise: false);
    path.lineTo(size.width, size.height-20);
    path.quadraticBezierTo(size.width, size.height, size.width-20, size.height);
    path.lineTo(20.0, size.height);
    path.quadraticBezierTo(0.0, size.height, 0.0, size.height-20);
    path.lineTo(0, size.height*0.60);
    path.arcToPoint(Offset(0.0,size.height*0.40),radius: Radius.circular(10),clockwise: false);
    path.lineTo(0.0, 20.0);
    path.quadraticBezierTo(0.0,0.0,20.0,0.0);
    path.close();
    canvas.drawShadow(path, Colors.black, 5.0, true);
    canvas.drawPath(path, paint,);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=>false;

}