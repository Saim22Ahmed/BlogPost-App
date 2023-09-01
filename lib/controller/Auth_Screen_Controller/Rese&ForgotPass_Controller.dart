import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Reset_Forgot_Pass_Controller extends GetxController {
  // Forgot Password Field Controller
  RxBool ontap = false.obs;
  final email = TextEditingController();
  Rx<FocusNode> emailfocus = FocusNode().obs;

  UnFocusFields() {
    emailfocus.value.unfocus();
    ontap.value = false;
  }

  //Reset Password Fields Controllers

  final password = TextEditingController();
  final confirm_password = TextEditingController();
}
