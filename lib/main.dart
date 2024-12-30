import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planner/auth/login_page.dart';
import 'package:event_planner/providers/event_provider.dart';
import 'package:event_planner/providers/language_provider.dart';
import 'package:event_planner/providers/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/utils/app_theme.dart';
import 'firebase_options.dart';
import 'frist_run/intial_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseFirestore.instance.disableNetwork();
  runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => LanguageProvider(),),
      ChangeNotifierProvider(create: (context) => ThemeProvider(),),
    ChangeNotifierProvider(
      create: (context) => EventProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool firstRun = true;

  @override
  void initState() {
    // TODO: implement initState
    isFirstRun();
    super.initState();
  }

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
      locale: Locale(languageProvider.language),
      home: firstRun ? const IntialScreen() : const LoginPage(),
    );
  }

  void isFirstRun() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    firstRun = prefs.getBool('firstRun') ?? true;
  }
}
