import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  // Extra Light.
  static TextStyle kExtraLight12 =
      GoogleFonts.nunito(fontSize: 12.sp, fontWeight: FontWeight.w400);
  static TextStyle kExtraLight14 =
      GoogleFonts.nunito(fontSize: 14.sp, fontWeight: FontWeight.w400);

  //  Light.
  static TextStyle kLight14 =
      GoogleFonts.nunito(fontSize: 14.sp, fontWeight: FontWeight.w500);

  // Medium.
  static TextStyle kMedium12 =
      GoogleFonts.nunito(fontSize: 12.sp, fontWeight: FontWeight.w600);
  static TextStyle kMedium14 = GoogleFonts.nunito(
      fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.white);
  static TextStyle kMedium14Button = GoogleFonts.nunito(
      fontSize: 12.sp, fontWeight: FontWeight.w600, color: Colors.white);
  static TextStyle kMedium16 = GoogleFonts.nunito(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle kMedium20 =
      GoogleFonts.nunito(fontSize: 20.sp, fontWeight: FontWeight.w600);

  // Bold.
  static TextStyle kBold14 =
      GoogleFonts.nunito(fontSize: 14.sp, fontWeight: FontWeight.w700);
  static TextStyle kBold16 =
      GoogleFonts.nunito(fontSize: 16.sp, fontWeight: FontWeight.w700);
  static TextStyle kBold20 =
      GoogleFonts.nunito(fontSize: 20.sp, fontWeight: FontWeight.w700);
  static TextStyle kBold24 =
      GoogleFonts.nunito(fontSize: 24.sp, fontWeight: FontWeight.w700);
  static TextStyle kBold32 =
      GoogleFonts.nunito(fontSize: 32.sp, fontWeight: FontWeight.w700);
}
