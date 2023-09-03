import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/myutils.dart';

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

  // Animation of Login Button
  RxBool isAnimate = true.obs;

  ShowCustomSnackBar(context) {
    if (isAnimate.value == false) {
      return Utils.CustomSuccessSnackBar(context, 'Link has been Sent ! ',
          'Please check your inbox or spam folder after few seconds.');
    }
  }
}
