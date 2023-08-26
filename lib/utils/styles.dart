import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextStyles {
  static TextStyle HeadingStyle() {
    return TextStyle(
      fontFamily: 'Metropolis',
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: Color(0xff0D253C),
    );
  }

  static TextStyle SecondaryTextStyle() {
    return TextStyle(
      fontFamily: 'Metropolis',
      fontSize: 14.sp,
      fontWeight: FontWeight.w300,
      color: Color(0xff2D4379),
    );
  }

  static TextStyle BtnTextStyle(Color color) {
    return TextStyle(
      fontFamily: 'Metropolis',
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }
}
