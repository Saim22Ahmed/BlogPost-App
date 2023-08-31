import 'package:blog_post_app/Firebase_services/Auth/Auth.dart';
import 'package:blog_post_app/controller/Auth_Screen_Controller/auth_screen_controller.dart';
import 'package:blog_post_app/screens/Auth_Screen/Auth_Screen.dart';
import 'package:blog_post_app/screens/HomeScreen/Home_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MainAuthPage extends StatelessWidget {
  MainAuthPage({super.key});
  final auth_services = Get.put(AuthServices());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return AuthScreen();
          }
        },
      ),
    );
  }
}
