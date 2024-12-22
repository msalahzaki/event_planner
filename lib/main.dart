import 'package:event_planner/auth/login_page.dart';
import 'package:event_planner/frist_run/intial_screen.dart';
import 'package:event_planner/providers/language_provider.dart';
import 'package:event_planner/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'core/utils/app_theme.dart';


void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LanguageProvider(),),
      ChangeNotifierProvider(create: (context) => ThemeProvider(),),

    ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      darkTheme: AppTheme.darktheme,
      theme: AppTheme.lighttheme,
      themeMode: themeProvider.theme,
      locale:  Locale(languageProvider.language),
      home: const IntialScreen(),
    );
  }
}
