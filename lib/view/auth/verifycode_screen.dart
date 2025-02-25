// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heatlh_tourism/view/auth/passwordveified_screen.dart';
import 'package:heatlh_tourism/view/auth/widgets/animated_icons.dart';
import 'package:heatlh_tourism/view/auth/widgets/custom_richtext.dart';
import '../../utils/constants/app/color_strings.dart';
import '../../utils/constants/app/icons_strings.dart';
import '../comman_components/background_imagecontainer.dart';
import '../comman_components/primarybutton.dart';
import '../comman_components/primarytextfield.dart';

class VerifyCodeScreen extends StatelessWidget {
  VerifyCodeScreen({super.key});
  TextEditingController verifyCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BackgroundImageContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: EdgeInsets.only(top: 18.h, bottom: 18.h, left: 16.w),
            child: Row(
              children: [
                SvgPicture.asset(
                  AppIcons.kBackIcon,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  'Back to Log in',
                  style: TextStyle(
                      color: AppColor.kSecondary,
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 148.5.h, right: 173.w, bottom: 15.h, left: 10.w),
              child: Text(
                'Verify Code',
                style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w700,
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
                  color: AppColor.kSamiDarkColor.withOpacity(0.8),
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
                      Text(
                        'An authentication code has been sent to your email.',
                        style: TextStyle(
                          color: AppColor.kLightAccentColor,
                          fontSize: 14.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      PrimaryTextFormField(
                        hintText: 'Enter Code',
                        controller: verifyCodeController,
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
                          Get.to(() => PasswordVeifiedScreen());
                        },
                        borderRadius: 8.r,
                        fontSize: 14.sp,
                        height: 48.h,
                        width: 326.w,
                        text: 'Verify',
                        textColor: AppColor.kWhiteColor,
                        bgColor: AppColor.kSecondary,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 68.w),
                            child: CustomRichText(
                              subtitle: '  Resend',
                              title: 'Don’t receive a code?',
                              subtitleTextStyle: TextStyle(
                                color: AppColor.kSecondary,
                                fontSize: 14.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                              ),
                              onTab: () {
                                // Get.to(() => SignUpScreen());
                              },
                            ),
                          ),
                          const AnimatedIconWidgets()
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
