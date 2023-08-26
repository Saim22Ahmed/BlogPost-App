import 'package:blog_post_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/styles.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    super.key,
    this.width = double.infinity,
    this.height = 62,
    required this.text,
  });

  final double width;
  final double height;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: mytheme.blue, borderRadius: BorderRadius.circular(12.r)),
      child: Text(
        text,
        style: MyTextStyles.BtnTextStyle(Colors.white),
      ),
    );
  }
}
