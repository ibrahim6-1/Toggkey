import 'package:flutter/material.dart';

class BgClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.lineTo(0, size.height * 0.7500000);
    path0.lineTo(0, size.height * 0.5000000);
    path0.lineTo(0, size.height * 0.1750000);
    path0.quadraticBezierTo(size.width * 0.1931000, size.height * 0.0207000,
        size.width * 0.5000000, 0);
    path0.quadraticBezierTo(size.width * 0.7986000, size.height * 0.0193000,
        size.width, size.height * 0.1750000);
    path0.lineTo(size.width, size.height * 0.4950000);
    path0.lineTo(size.width, size.height * 0.7500000);
    path0.lineTo(size.width, size.height);
    path0.lineTo(size.width * 0.4900000, size.height);
    path0.lineTo(0, size.height);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
