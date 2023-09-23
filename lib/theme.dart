import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppTheme {
  static ThemeData themeData = ThemeData(
    primaryColor: AppColors.mainColor,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      // elevation: 2,
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
        // splashFactory: InteractiveInkFeature()
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      // constraints: BoxConstraints(
      //   maxHeight: 50,
      //   minHeight: 49,
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


class AppTextStyles {
  static const TextStyle whiteBold =
  TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
  static const TextStyle blackText = TextStyle(
      color: AppColors.customText, fontWeight: FontWeight.w600, fontSize: 18);
  static const TextStyle black12 = TextStyle(
      color: AppColors.customText, fontWeight: FontWeight.w500, fontSize: 12);
  static const TextStyle black16 = TextStyle(
      color: AppColors.customText, fontWeight: FontWeight.w500, fontSize: 16);
  static const TextStyle custom20 = TextStyle(
      color: AppColors.customText, fontWeight: FontWeight.w500, fontSize: 20);
  static const TextStyle custom18 = TextStyle(
      color: AppColors.customText, fontWeight: FontWeight.w500, fontSize: 18);
  static const TextStyle custom14 = TextStyle(
      color: AppColors.customText, fontWeight: FontWeight.w500, fontSize: 14);
  static const TextStyle black14 = TextStyle(fontSize: 14, color: Colors.black);
  static const TextStyle custom15 = TextStyle(
      fontWeight: FontWeight.w600, fontSize: 15, color: AppColors.customButton);
  static const TextStyle black15 = TextStyle(
      fontWeight: FontWeight.w600, fontSize: 15, color: AppColors.customText);

  static const TextStyle black26 = TextStyle(fontSize: 26);
  static const TextStyle black20 = TextStyle(fontSize: 20);

  static TextStyle black16Regular = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'Gilroy',
    height: 1.5,
    color: AppColors.mainBlack,
  );

  static TextStyle black14Medium = TextStyle(
    fontSize: 14.sp,
    fontFamily: 'Gilroy',
    height: 1.18,
    fontWeight: FontWeight.w500,
    color: AppColors.mainBlack,
  );

  static TextStyle black18Semibold = TextStyle(
    fontSize: 18.sp,
    fontFamily: 'Gilroy',
    height: 1.19,
    fontWeight: FontWeight.w600,
    color: AppColors.mainBlack,
  );

  static TextStyle orange14Semibold = TextStyle(
    fontSize: 14.sp,
    fontFamily: 'Gilroy',
    height: 1.19,
    fontWeight: FontWeight.w600,
    color: AppColors.mainColor,
  );

  static TextStyle white16Bold = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'Gilroy',
    height: 1.2,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static TextStyle black20Bold = TextStyle(
    fontSize: 20.sp,
    fontFamily: 'Gilroy',
    height: 1.2,
    fontWeight: FontWeight.w700,
    color: AppColors.mainBlack,
  );

  static TextStyle black16Medium = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'Gilroy',
    height: 1.2,
    fontWeight: FontWeight.w500,
    color: AppColors.mainBlack,
  );
}

class AppColors {
  static const Color customButton = Color(0xffFFB951);
  static const Color customText = Color(0xff444444);
  static const Color filColor = Color(0xffEDEDEF);
  static const Color white = Colors.white;
  static const Color blue = Color(0xFF3D8BFF);
  static const Color black = Colors.black;
  static const Color pink = Colors.pink;

  static const Color mainBlack = Color(0xFF444444);
  static const Color secondBlack = Color(0xFF1C1C1C);
  static const Color mainBlue = Color(0xFF3D8BFF);
  static const Color mainColor = Color(0xFFFFB951);
  static const Color mainRed = Color(0xFFFF0000);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color blue1  = Color(0xFF225196);
  static const Color green =  Color(0xFF27AE60);
  static const Color red1 =  Color(0xFFFF6B00);
}
