// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heatlh_tourism/view/auth/signup_screen.dart';
import 'package:heatlh_tourism/view/auth/widgets/custom_richtext.dart';
import 'package:heatlh_tourism/view/auth/widgets/dividerrow.dart';
import '../../utils/constants/app/color_strings.dart';
import '../../utils/constants/app/image_strings.dart';
import '../comman_components/background_imagecontainer.dart';
import '../comman_components/primarybutton.dart';
import '../comman_components/primarytextbutton.dart';
import '../comman_components/primarytextfield.dart';
import '../comman_components/secondarybutton.dart';
import 'forgetpassword_screen.dart';
import 'login_Password_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BackgroundImageContainer(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(
                top: 235.h, right: 263.w, bottom: 15.h, left: 32.w),
            child: Text(
              'Log in',
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
                color: AppColor.kLightAccentColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Container(
              width: 358.w,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColor.kPrimary.withOpacity(0.8),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.kSamiDarkColor.withOpacity(0.5),
                    blurRadius: 10, // Adjust the blur radius
                  ),
                ],
              ),
              child: Container(
                color: Colors.transparent,
                child: Column(
                  children: [
                    PrimaryTextFormField(
                      hintText: 'Email',
                      controller: emailController,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r)),
                      width: 326.w,
                      height: 48.h,
                      fillColor: AppColor.kLightAccentColor,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    PrimaryButton(
                      onTap: () {
                        Get.to(
                          () => LoginPasswordScreen(),
                        );
                      },
                      borderRadius: 8.r,
                      fontSize: 14.sp,
                      height: 48.h,
                      width: 326.w,
                      text: 'Continue',
                      textColor: AppColor.kWhiteColor,
                      bgColor: AppColor.kSecondary,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    PrimaryTextButton(
                      title: 'Forgot password?',
                      fontSize: 14.sp,
                      onPressed: () {
                        Get.to(() => ForgetPasswordScreen());
                      },
                      textColor: Colors.white,
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    const DividerRow(),
                    SizedBox(
                      height: 32.h,
                    ),
                    SecondaryButton(
                        onTap: () {},
                        borderRadius: 8.r,
                        fontSize: 14.sp,
                        height: 48.h,
                        width: 326.w,
                        text: 'Login with Google',
                        textColor: AppColor.kBlackColor,
                        bgColor: AppColor.kLightAccentColor,
                        icons: ImagesPath.googleLogo),
                    SizedBox(
                      height: 16.h,
                    ),
                    SecondaryButton(
                        onTap: () {},
                        borderRadius: 8.r,
                        fontSize: 14.sp,
                        height: 48.h,
                        width: 326.w,
                        text: 'Login with Apple',
                        textColor: AppColor.kBlackColor,
                        bgColor: AppColor.kLightAccentColor,
                        icons: ImagesPath.appleLogo),
                    SizedBox(
                      height: 32.h,
                    ),
                    CustomRichText(
                      subtitle: ' Sign up ',
                      title: 'Don’t have an account?',
                      subtitleTextStyle: TextStyle(
                        color: AppColor.kSecondary,
                        fontSize: 14.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                      onTab: () {
                        Get.off(() => SignUpScreen());
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    ));
  }
}
