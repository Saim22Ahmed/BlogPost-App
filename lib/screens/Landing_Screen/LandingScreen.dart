import 'package:blog_post_app/controller/animation_controllers/HomeScreenAnimationController.dart';
import 'package:blog_post_app/controller/image_controller.dart';
import 'package:blog_post_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Auth_Screen/Auth_Screen.dart';
import 'ImageCard.dart';
import 'button.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({super.key});

  final animation_controller = Get.put(IntroImagesAnimation());
  @override
  Widget build(BuildContext context) {
    animation_controller.StartAnimaton();
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 236, 239, 243),
          body: Stack(
            children: [
              Obx(
                () => AnimatedPositioned(
                  duration: Duration(milliseconds: 1400),
                  top: animation_controller.animate.value ? 80.h : 0,
                  left: 50.w,
                  curve: Curves.easeInOut,
                  child: AnimatedOpacity(
                      opacity: animation_controller.animate.value ? 1 : 0,
                      duration: Duration(milliseconds: 2000),
                      child: IntroImages()),
                ),
              ),
              SlideView(),
              InkWell(onTap: () => Get.to(() => AuthScreen()), child: Button()),
            ],
          )),
    );
  }

  Align SlideView() {
    return Align(
      alignment: Alignment(0.w, 1.h),
      child: Container(
        height: 380.h,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Read the article you \nwant instantly',
                style: MyTextStyles.HeadingStyle(),
              ),
              SizedBox(
                height: 19.h,
              ),
              Text(
                'You can read thousands of articles on Blog Club, save them in the application and share them with your loved ones.',
                style: MyTextStyles.SecondaryTextStyle(),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28.r), topRight: Radius.circular(28.r)),
        ),
      ),
    );
  }

  IntroImages() {
    return Container(
      height: 342.07.h,
      width: 310.02.w,
      decoration: BoxDecoration(
          // color: Colors.blue[900],
          ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageCard(
                height: 157.75.h,
                width: 92.12.w,
                image: AppImages.Img_IntroScreen1,
              ),
              ImageCard(
                height: 157.75.h,
                width: 190.82.w,
                image: AppImages.Img_IntroScreen2,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageCard(
                height: 157.75.h,
                width: 190.82.w,
                image: AppImages.Img_IntroScreen3,
              ),
              ImageCard(
                height: 157.75.h,
                width: 92.12.w,
                image: AppImages.Img_IntroScreen4,
              ),
            ],
          )
        ],
      ),
    );
  }
}
