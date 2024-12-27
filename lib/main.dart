import 'package:event_planner/auth/login_page.dart';
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
  runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => LanguageProvider(),),
      ChangeNotifierProvider(create: (context) => ThemeProvider(),),
    ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool FirstRun = true;

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
      home: FirstRun ? IntialScreen() : LoginPage(),
    );
  }

  void isFirstRun() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    FirstRun = prefs.getBool('firstRun') ?? true;
  }
}
