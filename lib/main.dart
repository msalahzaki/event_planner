import 'package:event_planner/tabs/home.dart';
import 'package:event_planner/tabs/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import 'core/utils/app_theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: AppTheme.darktheme,
      theme: AppTheme.lighttheme,
      themeMode: ThemeMode.light,
      home: const ProfileScreen(),
    );
  }
}
