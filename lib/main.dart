import 'package:blog_post_app/Firebase_services/Auth/main_auth_page.dart';
import 'package:blog_post_app/screens/Auth_Screen/Auth_Screen.dart';
import 'package:blog_post_app/screens/Auth_Screen/ForgotPassScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          home: ForgotPassScreen(),
        );
      },
    );
  }
}
