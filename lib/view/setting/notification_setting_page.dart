import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constants/app/app_typography.dart';
import '../../utils/constants/app/color_strings.dart';
import 'components/custom_switch.dart';
import 'components/logout_button.dart';

// class NotificationSettingPage extends StatefulWidget {
//   const NotificationSettingPage({super.key});
//
//   @override
//   State<NotificationSettingPage> createState() =>
//       _NotificationSettingPageState();
// }
//
// class _NotificationSettingPageState extends State<NotificationSettingPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const BackButton(),
//         title: Text('Notification Setting', style: AppTypography.kMedium20),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.h),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: 30.h),
//             Text('Mobile Notification', style: AppTypography.kExtraLight14),
//             Divider(color: AppColor.kPrimary),
//             Row(children: [
//               Text('Enable text message notification',
//                   style: AppTypography.kExtraLight14),
//               const Spacer(),
//               CustomSwitch(
//                 switchCallback: (value) {},
//               )
//             ]),
//             Divider(color: AppColor.kPrimary),
//             Row(children: [
//               Text('Push Notifications', style: AppTypography.kExtraLight14),
//               const Spacer(),
//               Icon(Icons.arrow_forward_ios_rounded, size: 15.h),
//             ]),
//             Divider(color: AppColor.kPrimary),
//             SizedBox(height: 20.h),
//             Text('Email Notification', style: AppTypography.kExtraLight14),
//             Divider(color: AppColor.kPrimary),
//             Row(
//               children: [
//                 Text('Promotions and announcements',
//                     style: AppTypography.kMedium12),
//                 const Spacer(),
//                 CustomSwitch(
//                   switchCallback: (value) {},
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
