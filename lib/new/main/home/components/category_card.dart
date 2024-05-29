import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/constants/app/app_typography.dart';
import '../../../../utils/constants/app/color_strings.dart';
import '../../../../view/comman_components/animations/bouncing_animation.dart';

class CategoryCard extends StatelessWidget {
  final String category;
  final VoidCallback onTap;
  final bool isSelected;
  const CategoryCard(
      {super.key,
      required this.category,
      required this.onTap,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return BouncingAnimation(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
            color: isSelected ? Colors.blue : null,
            borderRadius: BorderRadius.circular(12.r),
            border: isSelected
                ? null
                : Border.all(color: AppColor.kGrayscaleDark100, width: 0.5)),
        child: Text(
          category,
          style: AppTypography.kBold16.copyWith(
              color: isSelected
                  ? AppColor.kLine
                  : isDarkMode(context)
                      ? AppColor.kSecondary
                      : Colors.black),
        ),
      ),
    );
  }
}
