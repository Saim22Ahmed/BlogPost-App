import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formField = GlobalKey<FormState>().obs;

  final email = TextEditingController();
  final password = TextEditingController();

  ClearControllers() {
    email.clear();
    password.clear();
  }
}
