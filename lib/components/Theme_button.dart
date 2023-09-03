import 'package:blog_post_app/utils/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/styles.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    super.key,
    this.width = double.infinity,
    this.height = 52,
    this.color = mytheme.blue,
    required this.child,
  });

  final double width;
  final double height;
  final dynamic child;
  final dynamic color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(microseconds: 500),
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(12.r)),
      child: child,
    );
  }
}
