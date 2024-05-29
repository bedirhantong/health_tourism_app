// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heatlh_tourism/view/auth/widgets/custom_richtext.dart';
import 'package:heatlh_tourism/view/auth/widgets/tremsandprivacytext.dart';
import '../../utils/constants/app/color_strings.dart';
import '../comman_components/background_imagecontainer.dart';
import '../comman_components/passwordtextfield.dart';
import '../comman_components/primarybutton.dart';
import '../comman_components/primarytextfield.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
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
                top: 200.h, right: 240.w, bottom: 15.h, left: 32.w),
            child: Text(
              'Sign up',
              style: TextStyle(
                fontSize: 32.sp,
                color: AppColor.kLightAccentColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Container(
              width: 358.w,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
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
                    SizedBox(
                      height: 12.h,
                    ),
                    CustomRichText(
                        title:
                            'Looks like you don’t have an account.                                        ',
                        subtitle: 'Let’s create a new account for you.',
                        subtitleTextStyle: TextStyle(
                          color: AppColor.kLightAccentColor,
                          fontSize: 14.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                        onTab: () {}),
                    SizedBox(
                      height: 12.h,
                    ),
                    PrimaryTextFormField(
                      hintText: 'First Name',
                      controller: nameController,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r)),
                      width: 326.w,
                      height: 48.h,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    PrimaryTextFormField(
                      hintText: 'Last Name',
                      controller: nameController,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r)),
                      width: 326.w,
                      height: 48.h,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    PrimaryTextFormField(
                      hintText: 'Email',
                      controller: emailController,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r)),
                      width: 326.w,
                      height: 48.h,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    PasswordTextField(
                      hintText: 'Password',
                      controller: passController,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r)),
                      width: 326.w,
                      height: 48.h,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    const TermsAndPrivacyText(),
                    SizedBox(
                      height: 16.h,
                    ),
                    PrimaryButton(
                      onTap: () {
                        // Get.to(() => const ChooseInterestScreen());
                      },
                      borderRadius: 8.r,
                      fontSize: 14.sp,
                      height: 48.h,
                      width: 326.w,
                      text: 'Create Account',
                      textColor: AppColor.kWhiteColor,
                      bgColor: AppColor.kSecondary,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomRichText(
                      subtitle: ' Log in',
                      title: 'Already have an account?',
                      subtitleTextStyle: TextStyle(
                        color: AppColor.kSecondary,
                        fontSize: 14.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                      onTab: () {
                        Get.off(() => LoginScreen());
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
