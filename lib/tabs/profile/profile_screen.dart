import 'package:event_planner/core/utils/app_assets.dart';
import 'package:event_planner/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_color.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    String selectedTheme = "Light";
    String selectedLanguage = "en";
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40)),)
        ,toolbarHeight: size.height * .2,
        title: Row(
          children: [
            Image.asset(AppAssets.Route),
            SizedBox(width: 20,),
            Column(crossAxisAlignment: CrossAxisAlignment.start,
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
            const Text(
              "Language",
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
                    "English",
                    style: AppStyles.bold20blue,
                  ),
                ),
                DropdownMenuItem(
                  value: "ar",
                  child: Text(
                    "Arabic",
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
              "Theme",
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
                    "Light",
                    style: AppStyles.bold20blue,
                  ),
                ),
                DropdownMenuItem(
                  value: "Dark",
                  child: Text(
                    "Dark",
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
              style: ButtonStyle(padding:MaterialStateProperty.all(const EdgeInsets.all(15)) ,
                  backgroundColor: WidgetStateProperty.all(AppColor.red),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.logout_outlined,
                    color: AppColor.white,
                  ),const SizedBox(width: 20,),
                  Text(
                    "LogOut",
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
