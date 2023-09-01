import 'package:blog_post_app/components/Theme_button.dart';
import 'package:blog_post_app/controller/image_controller.dart';
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

class ForgotPassScreen extends StatelessWidget {
  ForgotPassScreen({super.key});

  final forgotpass_controller = Get.put(Reset_Forgot_Pass_Controller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: InkWell(
        onTap: () {
          forgotpass_controller.UnFocusFields();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 19.0.w, vertical: 10.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // color: Colors.grey,
                // height: 200.h,
                // width: 200.w,
                child: SvgPicture.asset(
                  'assets/images/forgot_pass.svg',
                  fit: BoxFit.cover,
                  height: 380.h,
                  width: 380.w,
                ),
              ),
              SizedBox(
                height: 14.h,
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
                height: 38.h,
              ),
              EmailField(),
              SizedBox(
                height: 30.h,
              ),
              ThemeButton(
                  child: Text(
                'Send',
                style: MyTextStyles.BtnTextStyle(Colors.white),
              ))
            ],
          ),
        ),
      ),
    ));
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

  EmailField() {
    return Obx(
      () => Container(
        height: 63.h,
        child: TextFormField(
          onTap: () {
            forgotpass_controller.ontap.value = true;
          },
          focusNode: forgotpass_controller.emailfocus.value,
          controller: forgotpass_controller.email,
          cursorColor: mytheme.blue,
          style: TextStyle(
            height: 1.0.h,
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
    );
  }
}
