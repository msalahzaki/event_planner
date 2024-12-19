import 'package:event_planner/core/utils/app_assets.dart';
import 'package:event_planner/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../core/utils/app_color.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    var local =AppLocalizations.of(context)! ;
    String selectedTheme = "Light";
    String selectedLanguage = "en";
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40)),)
        ,toolbarHeight: size.height * .15,
        title: Row(
          children: [
            SizedBox(width: 100,
                child: Image.asset(AppAssets.Route)),
            const SizedBox(width: 20,),
            const Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("John Safwat"),
                Text("John Safwat@gamil.com"),
              ],
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Text(
              local.language,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            DropdownButtonFormField<String>(
              decoration: dropdownboxdecorion(),
              iconSize: 30,
              iconEnabledColor: AppColor.primaryLight,
              value: selectedLanguage,
              items: [
                DropdownMenuItem(
                  value: "en",
                  child: Text(
                    local.english,
                    style: AppStyles.bold20blue,
                  ),
                ),
                DropdownMenuItem(
                  value: "ar",
                  child: Text(
                    local.arabic,
                    style: AppStyles.bold20blue,
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
              style: AppStyles.bold20black,
            ),
            DropdownButtonFormField<String>(
              iconSize: 30,
              iconEnabledColor: AppColor.primaryLight,
              decoration: dropdownboxdecorion(),
              value: selectedTheme,
              items: [
                DropdownMenuItem(
                  value: "Light",
                  child: Text(
                    local.light,
                    style: AppStyles.bold20blue,
                  ),
                ),
                DropdownMenuItem(
                  value: "Dark",
                  child: Text(
                    local.dark,
                    style: AppStyles.bold20blue,
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
              style: ButtonStyle(padding:WidgetStateProperty.all(const EdgeInsets.all(15)) ,
                  backgroundColor: WidgetStateProperty.all(AppColor.red),
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
