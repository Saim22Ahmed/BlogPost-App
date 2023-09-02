import 'dart:ui';

import 'package:blog_post_app/utils/colors.dart';
import 'package:blog_post_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Utils {
  static void CustomErrorSnackBar(
      BuildContext context, String message, String submessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: EdgeInsets.only(bottom: 20),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Container(
          padding: EdgeInsets.all(16),
          height: 100.h,
          child: Row(
            children: [
              SizedBox(
                width: 50.w,
              ),
              Expanded(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: MyTextStyles.HeadingStyle()
                          .copyWith(color: Colors.white, fontSize: 18.sp),
                    ),
                    Text(
                      submessage,
                      style: MyTextStyles.SecondaryTextStyle()
                          .copyWith(color: Colors.white, fontSize: 12.sp),
                      // maxLines: 4,
                    ),
                  ],
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.red.shade400,
                  Colors.red.shade700
                ], // Define your gradient colors.
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(20.r)),
        ),
      ),
    );
  }

  static void CustomSuccessSnackBar(
      BuildContext context, String message, String submessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 10),
        margin: EdgeInsets.only(bottom: 20),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Container(
          padding: EdgeInsets.all(16),
          height: 100.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/checked(1).png',
                width: 28.w,
                height: 28.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: MyTextStyles.HeadingStyle()
                          .copyWith(color: Colors.white, fontSize: 18.sp),
                    ),
                    Text(
                      submessage,
                      style: MyTextStyles.SecondaryTextStyle()
                          .copyWith(color: Colors.white, fontSize: 12.sp),
                      // maxLines: 4,
                    ),
                  ],
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.green.shade400,
                  Colors.green.shade700
                ], // Define your gradient colors.
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(20.r)),
        ),
      ),
    );
  }
}
