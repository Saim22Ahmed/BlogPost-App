import 'package:blog_post_app/Firebase_services/Auth/Auth.dart';
import 'package:blog_post_app/controller/Auth_Screen_Controller/auth_screen_controller.dart';
import 'package:blog_post_app/screens/HomeScreen/Home_Screen.dart';
import 'package:blog_post_app/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../components/TapColorChanger.dart';
import '../../components/Theme_button.dart';
import '../../controller/Auth_Screen_Controller/Login_Controller.dart';
import '../../utils/styles.dart';
import 'ForgotPassScreen.dart';

class LoginPanel extends StatelessWidget {
  LoginPanel({
    super.key,
  });

  final FieldController fieldController = Get.put(FieldController());
  final loginController = Get.put(LoginController());
  final authservices = Get.put(AuthServices());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        fieldController.UnFocusFields();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome back',
            style: MyTextStyles.HeadingStyle(),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            'Sign in with your account',
            style: MyTextStyles.SecondaryTextStyle(),
          ),
          SizedBox(
            height: 37.h,
          ),
          EmailField(context),
          SizedBox(
            height: 15.h,
          ),

          // Password Field
          PasswordField(),
          SizedBox(
            height: 35.h,
          ),

          // Submit Button
          Obx(
            () => InkWell(
                onTap: () {
                  authservices.isloading.value = true;
                  authservices.SignIn(
                      email: loginController.email.value.text.trim(),
                      password: loginController.password.value.text.trim(),
                      context: context);
                },
                child: ThemeButton(
                  child: authservices.isloading.value
                      ? Transform.scale(
                          scale: 0.7,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          'LOGIN',
                          style: MyTextStyles.BtnTextStyle(Colors.white),
                        ),
                )),
          ),
          SizedBox(
            height: 24.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Forgot your password?',
                style: MyTextStyles.SecondaryTextStyle(),
              ),
              SizedBox(
                width: 8.w,
              ),

              // Reset Password
              InkWell(
                onTap: () {
                  Get.to(() => ForgotPassScreen())
                    ?..whenComplete(() => loginController.ClearControllers());
                },
                child: Text('Reset here',
                    style: TextStyle(
                        color: mytheme.blue,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500)),
              ),
            ],
          ),
          SizedBox(
            height: 38.h,
          ),
          Center(
            child: Container(
              // color: Colors.amberAccent,
              // height: 70.h,
              width: 172.w,
              child: Column(
                children: [
                  Text('OR SIGN IN WITH',
                      style: MyTextStyles.SecondaryTextStyle()
                          .copyWith(letterSpacing: 1.75, fontSize: 14.sp)),
                  SizedBox(
                    height: 26.h,
                  ),
                  SignInWith()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row SignInWith() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      TapColorChanger(
        fieldController: fieldController,
        icon: FontAwesome.google,
      ),
      TapColorChanger(
        fieldController: fieldController,
        icon: FontAwesome.facebook,
      ),
      TapColorChanger(
        fieldController: fieldController,
        icon: FontAwesome.twitter,
      ),
    ]);
  }

  PasswordField() {
    return Obx(
      () => Container(
        height: 65.h,
        child: TextFormField(
          textAlignVertical: TextAlignVertical.top,
          obscureText: fieldController.isHidden.value,
          textInputAction: TextInputAction.done,
          focusNode: fieldController.passwordfocus.value,
          // autofocus: true,
          onTap: () {},
          cursorColor: Colors.blue,

          controller: loginController.password,
          style: TextStyle(
            // color: Colors.blue,
            // height: 1.2,
            fontFamily: GoogleFonts.roboto().fontFamily,
            fontSize: 20.sp,
          ),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(55, 158, 158, 158),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(16.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: mytheme.blue,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(15.r),
            ),
            hintText: 'Password',
            hintStyle: TextStyle(
              fontSize: 18.sp,
            ),
            prefixIcon: Icon(
              BoxIcons.bxs_lock,
              color: mytheme.blue,
            ),
            suffix: Obx(
              () => InkWell(
                onTap: () {
                  fieldController.toggleHiddenText();
                },
                child: fieldController.isHidden.value
                    ? Icon(
                        OctIcons.eye_closed_24,
                        color: mytheme.blue,
                        size: 22,
                      )
                    : Icon(
                        IonIcons.eye,
                        size: 22,
                        color: mytheme.blue,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  EmailField(context) {
    return Obx(
      () => Container(
        height: 65.h,
        child: TextFormField(
          textAlignVertical: TextAlignVertical.top,
          onTap: () {},
          onFieldSubmitted: (value) => FocusScope.of(context)
              .requestFocus(fieldController.passwordfocus.value),
          controller: loginController.email,
          focusNode: fieldController.emailfocus.value,
          textInputAction: TextInputAction.next,
          // autofocus: true,
          maxLines: null,
          cursorColor: Colors.blue,
          style: TextStyle(
            height: 1.2,
            fontFamily: GoogleFonts.roboto().fontFamily,
            fontSize: 20.sp,
          ),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(55, 158, 158, 158),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: mytheme.blue,
                  width: 1.w,
                ),
                borderRadius: BorderRadius.circular(15.r),
              ),
              hintText: 'Email',
              hintStyle: TextStyle(
                fontSize: 18.sp,
              ),
              prefixIcon: Icon(EvaIcons.email, color: mytheme.blue)),
        ),
      ),
    );
  }
}
