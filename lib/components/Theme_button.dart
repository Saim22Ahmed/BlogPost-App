import 'package:blog_post_app/utils/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/styles.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    super.key,
    this.width = double.infinity,
    this.height = 52,
    required this.child,
  });

  final double width;
  final double height;
  final dynamic child;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: mytheme.blue, borderRadius: BorderRadius.circular(12.r)),
      child: child,
    );
  }
}
