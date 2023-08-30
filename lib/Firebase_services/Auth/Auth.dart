import 'package:blog_post_app/screens/HomeScreen/Home_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthServices extends GetxController {
  String? error_msg = '';

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> SignIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.to(() => HomeScreen());
    } on FirebaseAuthException catch (e) {
      error_msg = e.message;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('$error_msg')));
    }
  }

  Future<void> SignUp(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      error_msg = e.message;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('$error_msg')));
    }
  }

  Future<void> SignOut() async {
    await _firebaseAuth.signOut();
  }
}
