import 'package:blog_post_app/controller/animation_controllers/HomeScreenAnimationController.dart';
import 'package:blog_post_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:icons_plus/icons_plus.dart';

class ThemeIconButton extends StatelessWidget {
  ThemeIconButton({
    super.key,
    required this.icon,
  });

  final IconData icon;

  final IntroImagesAnimation animation_controller =
      Get.put(IntroImagesAnimation());

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0.65.w, 0.84.h),
      child: InkWell(
          child: Container(
        height: 66.h,
        width: 80.w,
        child: Icon(
          icon,
          color: Colors.white,
        ),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 10,
            offset: Offset(0, 6),
          )
        ], color: mytheme.blue, borderRadius: BorderRadius.circular(10.r)),
      )),
    );
  }
}
