import 'package:blog_post_app/controller/image_controller.dart';
import 'package:blog_post_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 720.h,
                decoration: BoxDecoration(
                    color: mytheme.blue,
                    borderRadius: BorderRadius.circular(40.r)),
              )),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 650.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40.r)),
              ))
        ],
      ),
    ));
  }
}
