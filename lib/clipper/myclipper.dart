import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 2.5);
    path.lineTo(size.width * ((1 / 2) - (1 / 10)), 2.5);
    path.arcToPoint(
      Offset(size.width * ((1 / 2) - (1 / 13)), 10),
      radius: Radius.circular(12),
    );
    path.arcToPoint(
      Offset(size.width * ((1 / 2) + (1 / 13)), 10),
      clockwise: false,
      radius: Radius.circular(size.width / 12),
    );
    path.arcToPoint(
      Offset(size.width * ((1 / 2) + (1 / 10)), 2.5),
      radius: Radius.circular(12),
    );
    path.lineTo(size.width, 2.5);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(MyClipper oldClipper) => false;
}

class MyClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * ((1 / 2) - (1 / 10)), 0);
    path.arcToPoint(
      Offset(size.width * ((1 / 2) - (1 / 13)), 7),
      radius: Radius.circular(12),
    );
    path.arcToPoint(
      Offset(size.width * ((1 / 2) + (1 / 13)), 7),
      clockwise: false,
      radius: Radius.circular(size.width / 12),
    );
    path.arcToPoint(
      Offset(size.width * ((1 / 2) + (1 / 10)), 0),
      radius: Radius.circular(12),
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(MyClipper1 oldClipper) => false;
}
