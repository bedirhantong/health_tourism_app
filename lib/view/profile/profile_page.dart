import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/constants/app/app_typography.dart';
import '../../utils/constants/app/color_strings.dart';
import '../../utils/constants/app/image_strings.dart';
import '../auth/login_screen.dart';
import '../comman_components/buttons/primary_button.dart';
import '../setting/components/logout_button.dart';
import 'components/profile_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kSecondary,
        elevation: 10,
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 35.r,
                  backgroundImage: AssetImage(ImagesPath.logo),
                ),
                SizedBox(width: 15.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ömer Özsoy', style: AppTypography.kBold20),
                    Text('omer-ozsoy@gmail.com',
                        style: AppTypography.kMedium14),
                    SizedBox(height: 5.h),
                    PrimaryButton(
                      onTap: () {},
                      text: 'Edit Profile',
                      height: 30.h,
                      width: 93.w,
                      fontSize: 12.sp,
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 20.h),
            Divider(color: AppColor.kWhite),
            SizedBox(height: 20.h),
            ProfileTile(
                onTap: () {}, icon: ImagesPath.kService, title: 'Services'),
            ProfileTile(
                onTap: () {},
                icon: ImagesPath.kNotificationWhite,
                title: 'Notifications'),
            ProfileTile(
                onTap: () {},
                icon: ImagesPath.kChat,
                title: 'Messages',
                badgeTitle: '3',
                isBadge: true),
            ProfileTile(
                onTap: () {},
                badgeTitle: '1',
                icon: ImagesPath.kChat,
                title: 'Chat Support',
                isBadge: true),
            ProfileTile(
                onTap: () {},
                icon: ImagesPath.kSettingWhite,
                title: 'Settings'),
            SizedBox(height: 40.h),
            Center(
              child: LogoutButton(
                onTap: () {
                  // Navigator.pushAndRemoveUntil(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: ((context) => LoginScreen()),
                  //   ),
                  //   (route) => false,
                  // );

                  Get.offAll(
                    () => LoginScreen(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
