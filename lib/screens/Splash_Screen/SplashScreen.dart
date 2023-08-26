import 'dart:async';

import 'package:blog_post_app/controller/image_controller.dart';
import 'package:blog_post_app/screens/Home_Screen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    Timer(Duration(seconds: 4), () {
      Get.to(HomeScreen());
    });
    setState(() {});
    // Animation Controller
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000))
          ..forward();
    super.initState();

    // Rotation Controller

    _rotationAnimation = Tween(begin: -0.1, end: 0.1).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack));

    _controller.addListener(() {
      setState(() {});
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        Image(
          image: AppImages.Img_SplashScreen_bg,
          fit: BoxFit.cover,
        ),
        Transform.rotate(
          angle: _rotationAnimation.value,
          child: Image(
            image: AppImages.Img_Logo,
            height: 81.99.h,
            width: 161.31.w,
          ),
        )
      ],
    ));
  }
}
