import 'package:blog_post_app/Firebase_services/Auth/Auth.dart';
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
      body: Center(child: Text("Hi ${user ?? 'Guest'}")),
    );
  }
}
