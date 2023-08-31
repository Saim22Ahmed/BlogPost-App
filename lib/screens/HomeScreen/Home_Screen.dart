import 'package:blog_post_app/Firebase_services/Auth/Auth.dart';
import 'package:blog_post_app/controller/Auth_Screen_Controller/Signup_Controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final authservices = Get.put(AuthServices());

  final user = FirebaseAuth.instance.currentUser?.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Hi ${user ?? 'Guest'}")),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              authservices.SignOut();
            },
            child: Container(
              color: Colors.amber,
              height: 50,
              width: 100,
              child: Text('Logout'),
            ),
          )
        ],
      ),
    );
  }
}
