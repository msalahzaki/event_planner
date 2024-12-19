import 'package:flutter/material.dart';

import 'app_color.dart';


class AppTheme {

  static ThemeData lighttheme = ThemeData(
    primaryColor: AppColor.primaryLight,
    scaffoldBackgroundColor: AppColor.semiblue,
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.primaryLight
    )
);
  static  ThemeData darktheme = ThemeData(
      primaryColor: AppColor.primaryDark,

      appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.primaryLight
      ),





  );


}
