import 'package:flutter/material.dart';
import 'package:green_leaf/src/core/utils/sizer/app_sizer.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.height, 0);
    path.lineTo(size.width, size.height + (AppSizes.height * 0.35));

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
