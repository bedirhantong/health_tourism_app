import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/constants/app/app_typography.dart';
import '../../utils/constants/app/image_strings.dart';
import '../auth/login_screen.dart';
import '../comman_components/animations/fade_animation.dart';
import 'components/logout_button.dart';
import 'components/setting_tile.dart';
import 'notification_setting_page.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Setting', style: AppTypography.kMedium20),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // SettingTile(
            //     onTap: () {
            //       Get.to(
            //         () => const NotificationSettingPage(),
            //       );
            //     },
            //     iconColor: const Color(0xFFF6DFDF),
            //     title: 'Notification Settings',
            //     icon: ImagesPath.kNotificationColoredIcon),
            SizedBox(height: 16.h),
            SettingTile(
                onTap: () {},
                iconColor: const Color(0xFFFFF3D0),
                title: 'Saved Places',
                icon: ImagesPath.kSavedPlaces),
            SizedBox(height: 16.h),
            // SettingTile(
            //     onTap: () {},
            //     iconColor: const Color(0xFFFFCDCD),
            //     title: 'Location',
            //     icon: ImagesPath.kLocation),
            // const Spacer(),
            // FadeAnimation(
            //   delay: 1.5,
            //   child: LogoutButton(
            //     onTap: () {
            //       Get.offAll(
            //         () => LoginScreen(),
            //       );
            //     },
            //   ),
            // ),
            SizedBox(height: 60.h)
          ],
        ),
      ),
    );
  }
}
