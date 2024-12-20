import 'package:event_planner/core/utils/app_assets.dart';
import 'package:event_planner/core/utils/app_color.dart';
import 'package:event_planner/core/utils/app_styles.dart';
import 'package:event_planner/frist_run/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';
import '../providers/theme_provider.dart';

class IntialScreen extends StatefulWidget {
  const IntialScreen({super.key});

  @override
  State<IntialScreen> createState() => _IntialScreenState();
}

class _IntialScreenState extends State<IntialScreen> {
  late var languageProvider;
  late var themeProvider;
  late Size size;

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context);
    themeProvider = Provider.of<ThemeProvider>(context);
    size = MediaQuery.of(context).size;
    var local = AppLocalizations.of(context)!;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image.asset(AppAssets.Logo)),
          Center(
            child: Image.asset(
              AppAssets.Intro_1,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            local.intro1_title,
            style: AppStyles.normal20blue,
          ),
          Text(
            local.intro1_content,
            style: AppStyles.normal16white
                .copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                local.language,
                style: AppStyles.normal20blue,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: AppColor.primaryLight, width: 2)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(onTap: () {
                      languageProvider.changeLanguage(language:"en");
                      setState(() {

                      });
                    },
                        child: languageOption(AppAssets.USA_icon, "en")),
                    const SizedBox(
                      width: 6,
                    ),
                    InkWell(onTap: () {
                      languageProvider.changeLanguage(language:"ar");
                      setState(() {

                      });
                    },

                        child: languageOption(AppAssets.Egypt_icon, "ar")),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                local.theme,
                style: AppStyles.normal20blue,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: AppColor.primaryLight, width: 2)),
                child: Row(
                  children: [
                    InkWell(onTap: () {
                      themeProvider.changeTheme(ThemeMode.light);
                      setState(() {

                      });
                    },
                        child: themeOption(Icons.sunny, ThemeMode.light)),
                    const SizedBox(
                      width: 6,
                    ),
      InkWell(onTap: () {
        themeProvider.changeTheme(ThemeMode.dark);
        setState(() {

        });
      },
        child: themeOption(Icons.nightlight_round, ThemeMode.dark),)
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => IntroScreen(),));
              },
              style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all(AppColor.primaryLight)),
              child: Text(
                local.lets_start,
                style: AppStyles.bold20white,
              ),
            ),
          )
        ],
      ),
    ));
  }

  Widget languageOption(String url, String value) {
    return CircleAvatar(
      backgroundColor: languageProvider.language == value
          ? AppColor.primaryLight
          : AppColor.transpernt,
      maxRadius: 16,
      child: Image.asset(
        url,
        height: size.height * 0.04,
      ),
    );
  }

  Widget themeOption(IconData icon, ThemeMode themeMode) {
    return CircleAvatar(
        backgroundColor: themeProvider.theme == themeMode
            ? AppColor.primaryLight
            : AppColor.transpernt,
        child: Icon(
          icon,
          color: themeProvider.theme == themeMode
              ? AppColor.white
              : AppColor.primaryLight,
        ));
  }
}
