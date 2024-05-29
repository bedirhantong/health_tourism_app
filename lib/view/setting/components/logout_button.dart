import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/constants/app/app_typography.dart';
import '../../../utils/constants/app/color_strings.dart';
import '../../comman_components/animations/bouncing_animation.dart';

class LogoutButton extends StatelessWidget {
  final VoidCallback onTap;
  const LogoutButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BouncingAnimation(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: 212.w,
        decoration: BoxDecoration(
          color: AppColor.kPrimary,
          // gradient: AppColor.kGradient1,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Center(
          child: Text('Logout',
              style: AppTypography.kBold16.copyWith(color: AppColor.kWhite)),
        ),
      ),
    );
  }
}
