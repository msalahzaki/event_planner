import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/utils/app_assets.dart';
import '../../core/utils/app_color.dart';
import '../../providers/language_provider.dart';

class LanguageWidget extends StatefulWidget {
  const LanguageWidget({super.key});

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  late LanguageProvider languageProvider;
  late Size size;

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context);

    size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColor.primaryLight, width: 2)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
              onTap: () {
                languageProvider.changeLanguage(language: "en");
                setState(() {});
              },
              child: languageOption(AppAssets.USA_icon, "en")),
          const SizedBox(
            width: 6,
          ),
          InkWell(
              onTap: () {
                languageProvider.changeLanguage(language: "ar");
                setState(() {});
              },
              child: languageOption(AppAssets.Egypt_icon, "ar")),
        ],
      ),
    );
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
}
