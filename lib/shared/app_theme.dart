import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    primaryColor: AppColors.mainColor,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: AppTextStyles.black18Semibold.copyWith(fontSize: 16.sp),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: AppColors.mainColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        // maximumSize: Size(345, 50),
        padding: const EdgeInsets.symmetric(
          horizontal: 140,
          vertical: 15,
        ),
        elevation: 0,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: false,
      fillColor: AppColors.white,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.mainColor),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.mainColor),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.mainColor),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      // ),
      contentPadding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
    ),
    textTheme: TextTheme(
      headline1: AppTextStyles.black20Bold,
      headline2:
          AppTextStyles.black20Bold.copyWith(fontWeight: FontWeight.w600),
      headline6: AppTextStyles.black16Medium,
    ),
  );
}
