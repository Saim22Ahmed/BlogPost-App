import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Forgot_Pass_Controller extends GetxController {
  // Forgot Password Field Controller
  RxBool ontap = false.obs;
  final email = TextEditingController();
  Rx<FocusNode> emailfocus = FocusNode().obs;

  // Circular Progress Indicator
  RxBool isLoading = false.obs;
  RxBool isLinkSent = false.obs;

  UnFocusFields() {
    emailfocus.value.unfocus();
  }

  //Reset Password Fields Controllers
}
