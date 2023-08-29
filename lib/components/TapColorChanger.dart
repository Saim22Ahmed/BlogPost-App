import 'dart:async';

import 'package:blog_post_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/Auth_Screen_Controller/auth_screen_controller.dart';

class TapColorChanger extends StatelessWidget {
  const TapColorChanger({
    super.key,
    required this.fieldController,
    required this.icon,
  });

  final IconData icon;

  final FieldController fieldController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTapDown: (details) {
          fieldController.istaplogo.value = false;
        },
        onTapUp: (details) {
          Timer(Duration(milliseconds: 200), () {
            fieldController.istaplogo.value = true;
          });
        },
        onTapCancel: () {
          fieldController.istaplogo.value = true;
        },
        child: Icon(
          icon,
          size: 32.sp,
          color: fieldController.istaplogo.value
              ? mytheme.HeadingColor
              : mytheme.blue,
        ),
      ),
    );
  }
}
