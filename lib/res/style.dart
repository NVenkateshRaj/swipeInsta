import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learnanimation/color.dart';

class AppStyle {

  static final ThemeData appTheme = ThemeData(
    primaryColor: AppColor.primary,
    primaryColorDark: AppColor.primaryDark,
    accentColor: AppColor.accent,
    dividerColor: AppColor.divider,
    brightness: Brightness.light,
    indicatorColor: AppColor.primaryDark,
    textTheme: TextTheme(
        button: TextStyle(color: AppColor.primary)
    ),
    primaryIconTheme: const IconThemeData.fallback().copyWith(
        color: AppColor.black
    ),
    appBarTheme: AppBarTheme().copyWith(
      color: AppColor.white,
      brightness: Brightness.dark,
    ),
    backgroundColor: AppColor.background,
    fontFamily: "Satoshi",
    scaffoldBackgroundColor: AppColor.background,
  );

  static final List<BoxShadow> cardShadow = [
    BoxShadow(color: Colors.black12, spreadRadius: 0.3, blurRadius: 5),
  ];

  static final Widget customDivider = Divider(color: AppColor.divider, thickness: 0.3,);

  static final List<BoxShadow> mildCardShadow = [
    BoxShadow(color: Colors.black12, spreadRadius: 0.1, blurRadius: 1),
  ];

  static List<Shadow> textShadow = <Shadow>[
    Shadow(
      offset: Offset(2.0, 2.0),
      blurRadius: 3.0,
      color: Colors.black12,
    ),
    Shadow(
      offset: Offset(2.0, 2.0),
      blurRadius: 8.0,
      color: Colors.black12,
    ),
  ];

  static setSystemUIOverlayStyle(){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppColor.labelText,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColor.black,
        systemNavigationBarIconBrightness: Brightness.light));
  }

}