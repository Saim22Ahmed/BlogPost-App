import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  // To get Data From TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final confirm_password = TextEditingController();
}
