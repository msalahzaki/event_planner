import 'package:event_planner/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTheme {
  static ThemeData lighttheme = ThemeData(
      //Primary Color
      primaryColor: AppColor.primaryLight,
      //Secondary Color
      colorScheme: const ColorScheme.light(secondary: AppColor.black),
      // Scaffold Theme
      scaffoldBackgroundColor: AppColor.semiblue,
      // AppBar Theme
      appBarTheme: const AppBarTheme(color: AppColor.primaryLight),
      // bottomAppBar Theme
      bottomAppBarTheme: const BottomAppBarTheme(
        color: AppColor.primaryLight,
      ),
      // ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.all(10),
        backgroundColor: AppColor.primaryLight,
      )),

      // Floating Button Theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColor.primaryLight,
          foregroundColor: AppColor.white,
          shape:
              CircleBorder(side: BorderSide(color: AppColor.white, width: 4))),
      // Text Field Theme
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColor.gray, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColor.gray, width: 1)),
          iconColor: AppColor.gray,
          hintStyle: AppStyles.normal16gray,
          prefixIconColor: AppColor.gray,
          suffixIconColor: AppColor.gray));

  static ThemeData darktheme = ThemeData(
      //Primary Color
      primaryColor: AppColor.primaryDark,
      //Secondary Color
      colorScheme: const ColorScheme.light(secondary: AppColor.white),
      // Scaffold Theme
      scaffoldBackgroundColor: AppColor.primaryDark,
      // bottomAppBarTheme Theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColor.primaryDark),
      // AppBar Theme
      appBarTheme: const AppBarTheme(backgroundColor: AppColor.primaryDark),
      // ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        textStyle: AppStyles.bold20white,
        padding: const EdgeInsets.all(10),
        backgroundColor: AppColor.primaryLight,
      )),
      // Floating Button Theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: AppColor.white,
          backgroundColor: AppColor.primaryDark,
          shape:
              CircleBorder(side: BorderSide(color: AppColor.white, width: 4))),
      // Text Field Theme

      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColor.white, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColor.white, width: 1)),
          hintStyle: AppStyles.normal16white,
          prefixIconColor: AppColor.white,
          suffixIconColor: AppColor.white));
}
