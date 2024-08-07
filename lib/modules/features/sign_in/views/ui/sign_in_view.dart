import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trainee/configs/routes/main_route.dart';
import 'package:trainee/configs/themes/main_color.dart';
import 'package:trainee/constants/cores/assets/image_constant.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:trainee/modules/features/sign_in/controllers/sign_in_controller.dart';
import 'package:trainee/modules/features/sign_in/views/components/form_sign_in_component.dart';
import 'package:trainee/shared/styles/elevated_button_style.dart';
import 'package:trainee/shared/styles/google_text_style.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      analytics.setCurrentScreen(
          screenName: "Sign In Screen", screenClassOverride: "Android");
    } else if (Platform.isIOS) {
      analytics.setCurrentScreen(
          screenName: "Sign In Screen", screenClassOverride: "IOS");
    } else if (Platform.isMacOS) {
      analytics.setCurrentScreen(
          screenName: "Sign In Screen", screenClassOverride: "MacOS");
    }

    if (kIsWeb) {
      analytics.setCurrentScreen(
          screenName: "Sign In Screen", screenClassOverride: "Web");
    }

    return Scaffold(
        extendBody: false,
        backgroundColor: MainColor.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(45),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 121.h),
                GestureDetector(
                  onDoubleTap: () => SignInController.to.flavorSeting(),
                  child: Image.asset(
                    ImageConstant.logo,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 121.h),
                Text(
                  'Login to your account',
                  style: GoogleTextStyle.fw600.copyWith(
                    fontSize: 22.sp,
                    color: MainColor.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40.h),
                const FormSignInComponent(),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(MainRoute.forgotPassword);
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                ElevatedButton(
                  style: ElevatedButtonStyle.mainRounded,
                  onPressed: () => SignInController.to.validateForm(context),
                  child: Text(
                    "Login",
                    style: GoogleTextStyle.fw800.copyWith(
                      fontSize: 14.sp,
                      color: MainColor.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text("or")),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity, 50),
                      ),
                    ),
                    onPressed: () {
                      SignInController.to.gmailFirebaseAuth(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          ImageConstant.googleLogo,
                          width: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Login with ",
                              style: GoogleTextStyle.fw400
                                  .copyWith(color: MainColor.black),
                            ),
                            Text(
                              "Google",
                              style: GoogleTextStyle.fw700
                                  .copyWith(color: MainColor.black),
                            ),
                            Container(
                              width: 30,
                            )
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
