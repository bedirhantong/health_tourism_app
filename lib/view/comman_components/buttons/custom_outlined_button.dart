import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/constants/app/app_typography.dart';
import '../../../utils/constants/app/color_strings.dart';
import '../animations/bouncing_animation.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double? height;
  final double? width;
  final double? fontSize;
  final Color? fontColor;
  final Color? btnColor;

  const CustomOutlinedButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.btnColor,
      this.height,
      this.width,
      this.fontSize,
      this.fontColor});

  @override
  Widget build(BuildContext context) {
    return BouncingAnimation(
      onTap: onTap,
      child: Container(
        height: height ?? 50.h,
        width: width ?? double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: btnColor ?? AppColor.kSecondary),
            borderRadius: BorderRadius.circular(23.r)),
        child: Text(
          text,
          style: AppTypography.kBold16.copyWith(
              color: fontColor ?? AppColor.kBackground, fontSize: fontSize),
        ),
      ),
    );
  }
}
