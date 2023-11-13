import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petition_ha/shared/app_theme.dart';
import 'package:petition_ha/view/splash_screen.dart';

import 'amansCreate/second_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    Widget nextWidget;
    if (mediaQueryData.accessibleNavigation) {
      nextWidget = SecondSplashPage();
    } else {
      nextWidget = SplashPage();
    }
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: AppTheme.themeData,
          home: child,
        );
      },
      child: nextWidget,
    );
  }
}
