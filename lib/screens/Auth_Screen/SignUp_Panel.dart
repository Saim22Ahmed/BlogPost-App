import 'package:blog_post_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../components/Theme_button.dart';
import '../../controller/image_controller.dart';
import '../../utils/styles.dart';

class SignUpPanel extends StatelessWidget {
  const SignUpPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create Your Account',
          style: MyTextStyles.HeadingStyle(),
        ),
        SizedBox(
          height: 12.h,
        ),
        Text(
          'Sign up with your account',
          style: MyTextStyles.SecondaryTextStyle(),
        ),
        SizedBox(
          height: 37.h,
        ),
        // Email Field
        EmailField(),
        SizedBox(
          height: 15.h,
        ),

        // Password Field
        PasswordField(),

        SizedBox(
          height: 35.h,
        ),

        ThemeButton(
          text: 'SIGN UP',
        ),
        SizedBox(
          height: 24.h,
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
                  height: 22.h,
                ),
                SignInWith()
              ],
            ),
          ),
        )
      ],
    );
  }

  Row SignInWith() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image(
          image: AppImages.Google_logo,
          width: 36.w,
          height: 36.h,
        ),
        Image(
          image: AppImages.fb_logo,
          width: 36.w,
          height: 36.h,
        ),
        Image(
          image: AppImages.twitter_logo,
          width: 36.w,
          height: 36.h,
        ),
      ],
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
}
