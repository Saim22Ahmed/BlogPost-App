import 'package:blog_post_app/controller/image_controller.dart';
import 'package:blog_post_app/utils/colors.dart';
import 'package:blog_post_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../components/Theme_button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: mytheme.whitebgcolor,
      body: Stack(
        children: [
          Positioned(
            top: 52.h,
            left: 150.4.w,
            child: Container(
              height: 56.h,
              width: 110.7.w,
              decoration: BoxDecoration(
                  // color: Color.fromARGB(255, 160, 150, 161),
                  image: DecorationImage(
                image: AppImages.Img_Logo,
              )),
            ),
          ),
          // Login & Signup Panel
          Positioned(
              top: 150.h,
              left: 0.w,
              right: 0.w,
              child: Container(
                height: 120.h,
                decoration: BoxDecoration(
                    color: mytheme.blue,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.r),
                        topRight: Radius.circular(40.r))),
                child: Align(
                  alignment: Alignment(0, -0.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'LOGIN',
                        style: MyTextStyles.BtnTextStyle(Colors.white),
                      ),
                      SizedBox(
                        width: 0,
                      ),
                      Text('SIGN UP',
                          style: MyTextStyles.BtnTextStyle(
                              Colors.white.withOpacity(0.30))),
                    ],
                  ),
                ),
              )),
          Positioned(
              bottom: 0.h,
              left: 0.w,
              right: 0.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 30.h),
                height: 650.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40.r)),
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
                    // Email Field
                    EmailField(),
                    SizedBox(
                      height: 10.h,
                    ),

                    // Password Field
                    PasswordField(),

                    SizedBox(
                      height: 30.h,
                    ),

                    ThemeButton(
                      text: 'LOGIN',
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
                        Text('Reset here',
                            style: TextStyle(
                                color: mytheme.blue,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500)),
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
                                    .copyWith(
                                        letterSpacing: 1.75, fontSize: 12.sp)),
                            SizedBox(
                              height: 22.h,
                            ),
                            Row(
                              children: [
                                Image(image: AppImages.Google_logo),
                                // Image(image: AppImages.fb_logo),
                                // Image(image: AppImages.twitter_logo),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    ));
  }

  TextFormField EmailField() {
    return TextFormField(
      onTap: () {},
      // onFieldSubmitted: (value) => FocusScope.of(context)
      //     .requestFocus(passwordfocus),
      // controller: email_controller,
      // focusNode: emailfocus,
      textInputAction: TextInputAction.next,
      // autofocus: true,
      maxLines: null,
      cursorColor: Colors.blue,
      style: TextStyle(
        // height: 1.4,
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
              width: 2.w,
            ),
            borderRadius: BorderRadius.circular(15.r),
          ),
          hintText: 'Email',
          hintStyle: TextStyle(
            fontSize: 18.sp,
          ),
          prefixIcon: Icon(EvaIcons.email, color: mytheme.blue)),
    );
  }

  TextFormField PasswordField() {
    return TextFormField(
      obscureText: true,
      textInputAction: TextInputAction.done,
      // focusNode: passwordfocus,
      // autofocus: true,
      onTap: () {},
      cursorColor: Colors.blue,
      // obscureText: isHidden,
      // controller: password_controller,
      style: TextStyle(
        // color: Colors.blue,
        // height: 1.4,
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
            width: 2.w,
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
        // : Icon(
        //     BoxIcons.bxs_lock,
        //     color: Colors.grey,
        //   ),
        suffix: InkWell(
            onTap: () {},
            child: Icon(IonIcons.eye, color: mytheme.blue
                // size: 23,
                )),
      ),
    );
  }
}
