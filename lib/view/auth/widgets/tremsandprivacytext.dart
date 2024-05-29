import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/constants/app/color_strings.dart';

class TermsAndPrivacyText extends StatelessWidget {
  const TermsAndPrivacyText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        style: TextStyle(
          color: AppColor.kLightAccentColor,
          fontSize: 14.sp,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        children: [
          const TextSpan(
            text: ' By selecting Create Account below,  ',
          ),
          const TextSpan(
            text: ' I agree to        ',
          ),
          TextSpan(
            text: '     Terms of Service',
            style: TextStyle(
              color: AppColor.kSecondary4,
              fontSize: 14.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
          const TextSpan(
            text: ' & ',
          ),
          TextSpan(
            text: 'Privacy Policy  ',
            style: TextStyle(
              color: AppColor.kSecondary4,
              fontSize: 14.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
