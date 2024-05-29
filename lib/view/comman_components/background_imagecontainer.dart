import 'package:flutter/material.dart';
import 'package:heatlh_tourism/utils/constants/app/image_strings.dart';

import '../../utils/constants/app/color_strings.dart';

class BackgroundImageContainer extends StatelessWidget {
  const BackgroundImageContainer({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColor.kGradient3,
        image: DecorationImage(
          image: AssetImage(
            ImagesPath.login4,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
