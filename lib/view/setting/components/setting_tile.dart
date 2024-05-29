import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/constants/app/app_typography.dart';
import '../../../utils/constants/app/color_strings.dart';
import '../../comman_components/animations/fade_animation.dart';
import 'custom_switch.dart';

class SettingTile extends StatefulWidget {
  final VoidCallback onTap;
  final String title;
  final String icon;
  final Color iconColor;
  final bool isSwitch;
  final Function(bool)? onSwitch;
  const SettingTile(
      {super.key,
      required this.onTap,
      required this.iconColor,
      required this.title,
      required this.icon,
      this.onSwitch,
      this.isSwitch = false});

  @override
  State<SettingTile> createState() => _SettingTileState();
}

class _SettingTileState extends State<SettingTile> {
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return FadeAnimation(
      delay: 1,
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          padding: EdgeInsets.all(14.h),
          decoration: BoxDecoration(
            color: AppColor.kPrimary,
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 36.h,
                width: 36.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.iconColor,
                ),
                child: Image.asset(widget.icon),
              ),
              SizedBox(width: 14.w),
              Text(widget.title, style: AppTypography.kMedium14),
              const Spacer(),
              widget.isSwitch
                  ? CustomSwitch(
                      switchCallback: widget.onSwitch,
                    )
                  : Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15.h,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
