import 'package:blog_post_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class IntroImagesAnimation extends GetxController {
  RxBool animate = false.obs;

  Future StartAnimaton() async {
    await Future.delayed(const Duration(milliseconds: 200));
    animate.value = true;
  }
}
