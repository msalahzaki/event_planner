import 'package:event_planner/core/utils/app_assets.dart';
import 'package:event_planner/core/utils/app_styles.dart';
import 'package:event_planner/providers/language_provider.dart';
import 'package:event_planner/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../core/utils/app_color.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfilePage> {
  late String selectedLanguage ;
 late String selectedTheme ;
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    var local =AppLocalizations.of(context)! ;
    String selectedTheme = themeProvider.theme == ThemeMode.light ? "Light" : "Dark" ;
     selectedLanguage = languageProvider.language;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40)),)
        ,toolbarHeight: size.height * .15,
        title: Row(
          children: [
            SizedBox(width: 100,
                child: Image.asset(AppAssets.Route)),
            const SizedBox(width: 20,),
             Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("John Safwat",style: AppStyles.bold24white,),
                Text("John Safwat@gamil.com",style: AppStyles.normal16white),
              ],
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Text(
              local.language,
              style:  AppStyles.bold20black.copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
            DropdownButtonFormField<String>(
              decoration: dropdownboxdecorion(),
              iconSize: 30,
              iconEnabledColor: AppColor.primaryLight,
              value: selectedLanguage,
              items: [
                DropdownMenuItem(onTap: () {
                  languageProvider.changeLanguage(language: "en");

                },
                  value: "en",
                  child: Text(
                    local.english,
                    style: selectedLanguage == "en" ? AppStyles.bold20blue : AppStyles.bold20black,
                  ),
                ),
                DropdownMenuItem(onTap: () {
                  languageProvider.changeLanguage(language: "ar");

                },
                  value: "ar",
                  child: Text(
                    local.arabic,
                    style: selectedLanguage == "ar" ? AppStyles.bold20blue : AppStyles.bold20black
                  ),
                ),
              ],
              onChanged: (String? value) {
                setState(() {
                  selectedLanguage = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              local.theme,
              style: AppStyles.bold20black.copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
            DropdownButtonFormField<String>(
              iconSize: 30,
              iconEnabledColor: AppColor.primaryLight,
              decoration: dropdownboxdecorion(),
              value: selectedTheme,
              items: [
                DropdownMenuItem(onTap: () => themeProvider.changeTheme(ThemeMode.light),
                  value: "Light",
                  child: Text(
                    local.light,
                    style:  selectedTheme == "Light" ? AppStyles.bold20blue : AppStyles.bold20black,
                  ),
                ),
                DropdownMenuItem(onTap: () => themeProvider.changeTheme(ThemeMode.dark),
                  value: "Dark",
                  child: Text(
                    local.dark,
                    style: selectedTheme == "Dark" ? AppStyles.bold20blue : AppStyles.bold20black,
                  ),
                ),
              ],
              onChanged: (String? value) {
                setState(() {
                  selectedTheme = value!;
                });
              },
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.red,
                padding: const EdgeInsets.all(15),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.logout_outlined,
                    color: AppColor.white,
                  ),const SizedBox(width: 20,),
                  Text(
                    local.logout,
                    style: AppStyles.normal20white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  InputDecoration dropdownboxdecorion() {
    return InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColor.primaryLight)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColor.primaryLight)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColor.primaryLight)));
  }
}
