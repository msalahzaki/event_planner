import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTheme {
  static ThemeData lighttheme = ThemeData(
      primaryColor: AppColor.primaryLight,
colorScheme: ColorScheme.light(secondary:AppColor.black ),
      scaffoldBackgroundColor: AppColor.semiblue,
      appBarTheme: AppBarTheme(color: AppColor.primaryLight),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: AppColor.primaryLight,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColor.primaryLight,
          foregroundColor: AppColor.white,
          shape:
              CircleBorder(side: BorderSide(color: AppColor.white, width: 4))));

  static ThemeData darktheme = ThemeData(
      primaryColor: AppColor.primaryDark,
      colorScheme: ColorScheme.light(secondary:AppColor.white ),
      scaffoldBackgroundColor: AppColor.primaryDark,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColor.primaryDark),
      appBarTheme: const AppBarTheme(backgroundColor: AppColor.primaryDark),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: AppColor.white,
          backgroundColor: AppColor.primaryDark,
          shape:
              CircleBorder(side: BorderSide(color: AppColor.white, width: 4))));
}
