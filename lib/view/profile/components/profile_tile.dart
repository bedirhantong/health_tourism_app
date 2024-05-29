import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/constants/app/app_typography.dart';
import '../../../utils/constants/app/color_strings.dart';
import '../../comman_components/animations/fade_animation.dart';

class ProfileTile extends StatelessWidget {
  final VoidCallback onTap;
  final String icon;
  final String title;
  final bool isBadge;
  final String? badgeTitle;

  const ProfileTile({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
    this.isBadge = false,
    this.badgeTitle,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return FadeAnimation(
      delay: 1,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: Row(
            children: [
              Container(
                height: 30.h,
                width: 30.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDarkMode(context)
                        ? AppColor.kBlackColor
                        : AppColor.kLightAccentColor),
                child: SvgPicture.asset(icon),
              ),
              SizedBox(width: 18.w),
              Text(title, style: AppTypography.kMedium16),
              const Spacer(),
              isBadge
                  ? Container(
                      height: 20.h,
                      width: 20.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColor.kPrimary),
                      child: Text(
                        badgeTitle!,
                        style: AppTypography.kExtraLight12
                            .copyWith(color: AppColor.kLightAccentColor),
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
