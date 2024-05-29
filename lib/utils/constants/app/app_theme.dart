import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../view/comman_components/customPaint/slider_thumb_shape.dart';
import '../../../view/comman_components/customPaint/slider_track_shape.dart';
import 'app_typography.dart';
import 'color_strings.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      scaffoldBackgroundColor: AppColor.kLine,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.kLine,
        surfaceTintColor: AppColor.kLine,
      ),
      inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          filled: true,
          fillColor: AppColor.kLine,
          hintStyle: AppTypography.kExtraLight14.copyWith(color: Colors.grey),
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.r)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.r)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.r)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.r)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.r))),
      sliderTheme: SliderThemeData(
          trackShape: CustomSliderTrackShape(),
          thumbShape: SliderThumbShape(),
          activeTrackColor: AppColor.kPrimary,
          inactiveTrackColor: AppColor.kGrayscale40),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: AppColor.kLightAccentColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColor.kPrimary,
        unselectedItemColor: AppColor.kBlackColor,
        selectedLabelStyle: AppTypography.kMedium14,
        unselectedLabelStyle: AppTypography.kMedium14,
      ));

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      primarySwatch: Colors.blue,
      brightness: Brightness.dark,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      scaffoldBackgroundColor: AppColor.kBlackColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.kBlackColor,
        surfaceTintColor: AppColor.kBlackColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          filled: true,
          fillColor: const Color(0xFF222222),
          hintStyle:
              AppTypography.kExtraLight14.copyWith(color: AppColor.kBlackColor),
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.r)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.r)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.r)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.r)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.r))),
      sliderTheme: SliderThemeData(
          trackShape: CustomSliderTrackShape(),
          thumbShape: SliderThumbShape(),
          activeTrackColor: AppColor.kPrimary,
          inactiveTrackColor: AppColor.kGrayscaleDark100),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: AppColor.kBlackColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColor.kPrimary,
        unselectedItemColor: AppColor.kBlackColor,
        selectedLabelStyle: AppTypography.kMedium14,
        unselectedLabelStyle: AppTypography.kMedium14,
      ));
}

SystemUiOverlayStyle defaultOverlay = const SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarColor: Colors.black,
  systemNavigationBarDividerColor: Colors.transparent,
  systemNavigationBarIconBrightness: Brightness.light,
);

SystemUiOverlayStyle customOverlay = const SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark,
);
