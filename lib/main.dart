
import 'package:event_planner/tabs/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'core/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      darkTheme: AppTheme.darktheme,
      theme: AppTheme.lighttheme,
      themeMode: ThemeMode.light,
      locale: Locale("en"),
      home: const ProfileScreen(),
    );
  }
}
