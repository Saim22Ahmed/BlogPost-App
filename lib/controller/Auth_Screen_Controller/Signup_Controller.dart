import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  // To get Data From TextFields
  final email_controller = TextEditingController();
  final password_password = TextEditingController();
}
