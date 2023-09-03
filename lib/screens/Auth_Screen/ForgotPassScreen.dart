import 'dart:async';

import 'package:blog_post_app/Firebase_services/Auth/Auth.dart';
import 'package:blog_post_app/components/Theme_button.dart';
import 'package:blog_post_app/controller/image_controller.dart';
import 'package:blog_post_app/screens/Landing_Screen/button.dart';
import 'package:blog_post_app/utils/colors.dart';
import 'package:blog_post_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../controller/Auth_Screen_Controller/Rese&ForgotPass_Controller.dart';
import '../../utils/myutils.dart';

class ForgotPassScreen extends StatelessWidget {
  ForgotPassScreen({super.key});
  final _formkey = GlobalKey<FormState>();
  final auth_services = Get.put(AuthServices());
  final forgotpass_controller = Get.put(Forgot_Pass_Controller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: InkWell(
        onTap: () {
          forgotpass_controller.UnFocusFields();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 19.0.w, vertical: 10.0.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        Get.back();
                        Future.delayed(Duration(milliseconds: 200), () {
                          forgotpass_controller.email.clear();
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        // color: Colors.grey,
                        child: Icon(
                          HeroIcons.arrow_long_left,
                          size: 32..sp,
                          color: mytheme.blue,
                        ),
                      )),
                ],
              ),

              Container(
                // color: Colors.grey,
                margin: EdgeInsets.only(left: 16.w),
                child: SvgPicture.asset(
                  'assets/images/forgot_pass.svg',
                  fit: BoxFit.cover,
                  height: 310.h,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              // Forgor Password Heading
              ForgetPasswordHeading(),
              SizedBox(
                height: 20.h,
              ),
              // Sub Text
              Container(
                alignment: Alignment.center,
                // color: Colors.yellow,
                width: 330.w,
                child: Text(
                  'Don\'t worry ! We got you . Please enter the email address associated with your account.',
                  style: MyTextStyles.SecondaryTextStyle(),
                ),
              ),
              SizedBox(
                height: 42.h,
              ),
              EmailField(),
              SizedBox(
                height: 16.h,
              ),
              ResetButton(context),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Obx(
                  () => AnimatedScale(
                    onEnd: () {
                      forgotpass_controller.isAnimate.value = false;
                      Timer(Duration(milliseconds: 200), () {
                        forgotpass_controller.ShowCustomSnackBar(context);
                      });
                    },
                    curve: Curves.easeInOut,
                    scale: forgotpass_controller.isLinkSent.value ? 1 : 0,
                    duration: Duration(milliseconds: 600),
                    child: ThemeButton(
                        child: Text(
                      'Login',
                      style: MyTextStyles.BtnTextStyle(Colors.white),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Obx ResetButton(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () {
          if (_formkey.currentState!.validate()) {
            forgotpass_controller.isLoading.value = true;
            auth_services.ResetPassword(
                forgotpass_controller.email.text.trim(), context);
          }
        },
        child: ThemeButton(
          child: forgotpass_controller.isLoading.value
              ? Transform.scale(
                  scale: 0.7,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : Text(
                  forgotpass_controller.isLinkSent.value
                      ? 'Send Link Again'
                      : 'Send Reset Link',
                  style: MyTextStyles.BtnTextStyle(Colors.white),
                ),
          color: forgotpass_controller.isLinkSent.value
              ? Colors.green
              : mytheme.blue,
        ),
      ),
    );
  }

  Obx EmailField() {
    return Obx(
      () => Form(
        key: _formkey,
        child: Container(
          // color: Colors.grey,
          height: 88.h,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Email Field cant be empty';
              }
            },
            onTap: () {
              forgotpass_controller.ontap.value = true;
            },
            focusNode: forgotpass_controller.emailfocus.value,
            controller: forgotpass_controller.email,
            cursorColor: mytheme.blue,
            style: TextStyle(
              height: 1.2.h,
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontSize: 18.sp,
            ),
            keyboardType: TextInputType.emailAddress,
            onFieldSubmitted: (value) {
              forgotpass_controller.ontap.value = false;
            },
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
                prefixIcon: forgotpass_controller.ontap.value
                    ? Icon(
                        EvaIcons.email,
                        color: mytheme.blue,
                      )
                    : Icon(EvaIcons.email, color: Colors.grey)),
          ),
        ),
      ),
    );
  }

  Container ForgetPasswordHeading() {
    return Container(
        alignment: Alignment.center,
        // color: Colors.red,
        width: 165.w,
        child: RichText(
          text: TextSpan(
            style: MyTextStyles.HeadingStyle().copyWith(
              fontWeight: FontWeight.w800,
              fontSize: 32.sp,
              letterSpacing: -1,
            ),
            children: [
              TextSpan(
                text: 'Forgot',
              ),
              TextSpan(text: ' Password?'),
            ],
          ),
        ));
  }
}
