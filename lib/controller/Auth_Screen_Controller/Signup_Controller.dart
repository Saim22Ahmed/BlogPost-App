import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  // To get Data From TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final confirm_password = TextEditingController();

  ClearControllers() {
    email.clear();
    password.clear();
    confirm_password.clear();
  }
}
