import 'package:blog_post_app/screens/Auth_Screen/Auth_Screen.dart';
import 'package:blog_post_app/screens/Home_Screen/HomeScreen.dart';
import 'package:blog_post_app/screens/Splash_Screen/SplashScreen.dart';
import 'package:blog_post_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 892),
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Metropolis',
            useMaterial3: true,
          ),
          home: AuthScreen(),
        );
      },
    );
  }
}
