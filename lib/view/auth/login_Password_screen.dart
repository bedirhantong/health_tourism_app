// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heatlh_tourism/utils/constants/app/image_strings.dart';
import '../../new/main/landing_screen/landing_screen.dart';
import '../../utils/constants/app/color_strings.dart';
import '../comman_components/background_imagecontainer.dart';
import '../comman_components/passwordtextfield.dart';
import '../comman_components/primarybutton.dart';
import '../comman_components/primarytextbutton.dart';
import 'forgetpassword_screen.dart';

class LoginPasswordScreen extends StatelessWidget {
  LoginPasswordScreen({super.key});
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
                top: 235.h, right: 263.w, bottom: 15.h, left: 32.w),
            child: Text(
              'Login',
              style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                  color: AppColor.kLightAccentColor),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Container(
              width: 358.w,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColor.kSamiDarkColor.withOpacity(0.4),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.kPrimary.withOpacity(0.8),
                    blurRadius: 10, // Adjust the blur radius
                  ),
                ],
              ),
              child: Container(
                color: Colors.transparent,
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: SizedBox(
                        width: 60.w,
                        height: 70.h,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(ImagesPath.logo),
                        ),
                      ),
                      title: Text(
                        'H&T',
                        style: TextStyle(
                          color: AppColor.kLightAccentColor,
                          fontSize: 16.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: Text(
                        'health-tourism@akdeniz.com',
                        style: TextStyle(
                          color: AppColor.kLightAccentColor,
                          fontSize: 14.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: Icon(
                        Icons.check_circle_outline,
                        color: AppColor.kSecondary,
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
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
                    PrimaryButton(
                      onTap: () {
                        Get.offAll(
                          () => const BottomNavMain(
                            initIndex: 0,
                          ),
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
