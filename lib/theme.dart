import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    primaryColor: AppColors.mainColor,
    scaffoldBackgroundColor: AppColors.bgColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.mainColor,
      secondary: AppColors.secondaryColor,
      onPrimary: AppColors.white,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.white,
      unselectedLabelColor: AppColors.grey,
      labelStyle: AppTextStyles.black18Semibold
          .copyWith(fontSize: 16.sp, color: AppColors.white),
      unselectedLabelStyle: AppTextStyles.black18Semibold
          .copyWith(fontSize: 16.sp, color: AppColors.grey),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: false,
      elevation: 2,
      titleTextStyle: AppTextStyles.black18Semibold.copyWith(
        fontSize: 18,
        color: AppColors.black,
        fontWeight: FontWeight.w600,
      ),
      titleSpacing: 0,
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(
        color: AppColors.black,
        size: 26,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.mainColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        elevation: 0,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      border: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.mainColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.mainColor, width: 1),
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
    fontSize: 16,
    height: 1.5,
    color: AppColors.mainBlack,
  );

  static TextStyle black12Medium = TextStyle(
    fontSize: 12,
    height: 1.18,
    fontWeight: FontWeight.w500,
    color: AppColors.secondBlack,
  );

  static TextStyle black14Medium = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.mainBlack,
  );

  static TextStyle black18Semibold = TextStyle(
    fontSize: 18,
    height: 1.19,
    fontWeight: FontWeight.w600,
    color: AppColors.mainBlack,
  );

  static TextStyle orange14Semibold = TextStyle(
    fontSize: 14,
    height: 1.19,
    fontWeight: FontWeight.w600,
    color: AppColors.mainColor,
  );

  static TextStyle grey12Semibold = TextStyle(
    fontSize: 12,
    height: 1.19,
    fontWeight: FontWeight.w600,
    color: AppColors.dateColor,
  );

  static TextStyle white16Bold = TextStyle(
    fontSize: 16,
    height: 1.2,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static TextStyle black20Bold = TextStyle(
    fontSize: 20,
    height: 1.2,
    fontWeight: FontWeight.w700,
    color: AppColors.mainBlack,
  );

  static TextStyle black16Medium = TextStyle(
    fontSize: 16,
    height: 1.2,
    fontWeight: FontWeight.w500,
    color: AppColors.mainBlack,
  );

  static TextStyle black18Medium = TextStyle(
    fontSize: 18,
    height: 1.2,
    fontWeight: FontWeight.w500,
    color: AppColors.mainBlack,
  );

  static TextStyle black14Extrabold = TextStyle(
    fontSize: 14,
    height: 1.14,
    fontWeight: FontWeight.w800,
    color: AppColors.mainBlack,
  );
}

class AppColors {
  static const Color main = Color(0xFF006ECD); //Color(0xFF3456FB);
  static const Color customButton = main; // Color(0xffFFB951);
  static const Color mainColor = main; // Color(0xFFFFB951);
  static const Color secondaryColor = Color(0xFFFFCAA4);
  static const Color customText = Color(0xff444444);
  static const Color filColor = Color(0xffEDEDEF);
  static const Color white = Colors.white;
  static const Color blue = Color(0xFF3D8BFF);
  static const Color black = Colors.black;
  static const Color pink = Colors.pink;
  static const Color bgColor = Color(0xFFFFFFFF);
  static const Color mainBlack = Color(0xFF444444);
  static const Color secondBlack = Color(0xFF1C1C1C);
  static const Color mainRed = Color(0xFFFF0000);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color secondBlue = Color(0xFF6DA8FF);
  static const Color dateColor = Color(0xFF989898);
  static const Color historyGrey = Color(0xFFC7C7C7);
  static const Color divider = Color(0xFFDDDDDD);
  static const Color menuNoSelected = Color(0xFFEFEFEF);
  static const Color menuDivider = Color(0xFF808080);
  static const Color tarifDivider = Color(0xFFDADADA);
  static const Color greySoftContainer = Color(0xFFF4F4F4);
  static const Color backgroundColor = Color(0xFFFFA564);
  static const Color orangeButtonBackground = Color(0xFFF8DFCC);
  static const Color pinkBorder = Color(0xFfFF8B8B);
}
