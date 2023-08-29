import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreenController extends GetxController {
  final RxBool PanelValue = false.obs;
  final RxBool SignUpPanel = false.obs;

  onTapPanel() {
    PanelValue.value = true;
  }
}

class FieldController extends GetxController {
  Rx<FocusNode> emailfocus = FocusNode().obs;
  Rx<FocusNode> passwordfocus = FocusNode().obs;

  // ObscureText
  RxBool isHidden = true.obs;

  // SignInWith
  RxBool istaplogo = true.obs;

  ontapLogo() {
    istaplogo.value = false;
  }

  UnFocusFields() {
    emailfocus.value.unfocus();
    passwordfocus.value.unfocus();
  }

  toggleHiddenText() {
    isHidden.value = !isHidden.value;
  }
}
