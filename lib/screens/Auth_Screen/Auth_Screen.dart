import 'package:blog_post_app/controller/image_controller.dart';
import 'package:blog_post_app/utils/colors.dart';
import 'package:blog_post_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/auth_screen_controller.dart';
import 'Login_Panel.dart';
import 'SignUp_Panel.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  final AuthScreenController authScreenController =
      Get.put(AuthScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mytheme.whitebgcolor,
      body: Stack(
        children: [
          Positioned(
            top: 52.h,
            left: 150.4.w,
            child: Container(
              height: 56.h,
              width: 110.7.w,
              decoration: BoxDecoration(
                  // color: Color.fromARGB(255, 160, 150, 161),
                  image: DecorationImage(
                image: AppImages.Img_Logo,
              )),
            ),
          ),
          // Login & Signup Panel
          Positioned(
              top: 150.h,
              left: 0.w,
              right: 0.w,
              child: Container(
                height: 120.h,
                decoration: BoxDecoration(
                    color: mytheme.blue,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.r),
                        topRight: Radius.circular(40.r))),
                child: Align(
                  alignment: Alignment(0.w, -0.9.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          authScreenController.PanelValue.value = false;
                        },
                        child: Obx(
                          () => Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 16.h, horizontal: 20.w),
                            child: Text('LOGIN',
                                style: authScreenController.PanelValue.value
                                    ? MyTextStyles.BtnTextStyle(
                                        Colors.white.withOpacity(0.30))
                                    : MyTextStyles.BtnTextStyle(Colors.white)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 0,
                      ),
                      InkWell(
                          onTap: () {
                            authScreenController.onTapPanel();
                          },
                          child: Obx(
                            () => Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16.h, horizontal: 20.w),
                              child: Text('SIGN UP',
                                  style: authScreenController.PanelValue.value
                                      ? MyTextStyles.BtnTextStyle(Colors.white)
                                      : MyTextStyles.BtnTextStyle(
                                          Colors.white.withOpacity(0.30))),
                            ),
                          )),
                    ],
                  ),
                ),
              )),
          // Form
          Positioned(
              bottom: 0.h,
              left: 0.w,
              right: 0.w,
              child: Obx(
                () => Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
                  height: 640.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40.r)),
                  child: authScreenController.PanelValue.value
                      ? SignUpPanel()
                      : LoginPanel(),
                ),
              ))
        ],
      ),
    ));
  }
}
