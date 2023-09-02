import 'package:blog_post_app/controller/Auth_Screen_Controller/Login_Controller.dart';
import 'package:blog_post_app/controller/Auth_Screen_Controller/Rese&ForgotPass_Controller.dart';
import 'package:blog_post_app/controller/Auth_Screen_Controller/Signup_Controller.dart';
import 'package:blog_post_app/screens/Auth_Screen/Auth_Screen.dart';
import 'package:blog_post_app/screens/HomeScreen/Home_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../utils/myutils.dart';

class AuthServices extends GetxController {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  final signup_controller = Get.put(SignUpController());
  final login_controller = Get.put(LoginController());
  final forgot_pass_controller = Get.put(Forgot_Pass_Controller());

  String? error_msg = '';

  RxBool isloading = false.obs;

  Future<void> SignIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      error_msg = e.message;
      if (e.code == 'user-not-found') {
        Utils.CustomSuccessSnackBar(
            context, 'User Not Found', 'Please sign up.');
      } else if (e.code == 'wrong-password') {
        Utils.CustomSuccessSnackBar(
            context, 'Incorrect Password', 'Please try again.');
      }
    }
    isloading.value = false;
  }

  Future<void> SignUp(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      if (PasswordConfirmed()) {
        await _firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
      } else {
        Utils.CustomErrorSnackBar(context, 'Password Do Not Match',
            'Ensure that both the passwords are same');
      }
    } on FirebaseAuthException catch (e) {
      error_msg = e.message;
      if (e.code == 'email-already-in-use') {
        Utils.CustomErrorSnackBar(context, 'Email Already in Use',
            'This email is already registered. Please log in or reset your password.');
      } else if (e.code == 'invalid-email') {
        Utils.CustomErrorSnackBar(
            context, 'Invalid Email', 'Please enter a valid email address.');
      }
    }
    isloading.value = false;
  }

  Future SignOut() async {
    await _firebaseAuth.signOut();
    // Get.offAll(() => AuthScreen());
    login_controller.ClearControllers();
    signup_controller.ClearControllers();
  }

  bool PasswordConfirmed() {
    if (signup_controller.password.text.trim() ==
        signup_controller.confirm_password.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> ResetPassword(String email, context) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email).then((value) =>
          Utils.CustomSuccessSnackBar(context, 'Email has been Sent ! ',
              'Please check your inbox or spam folder after few seconds.'));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Utils.CustomErrorSnackBar(context, 'Email has been Sent ',
            'Check your inbox or spam folder after few seconds');
      } else if (e.code == 'wrong-password') {
        Utils.CustomErrorSnackBar(
            context, 'Incorrect Password', 'Please try again.');
      }
    }
    forgot_pass_controller.isLoading.value = false;
    if (forgot_pass_controller.isLoading.value == false) {
      forgot_pass_controller.isLinkSent.value = true;
    }
  }
}
