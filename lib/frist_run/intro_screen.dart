import 'package:event_planner/auth/login_page.dart';
import 'package:event_planner/core/utils/app_assets.dart';
import 'package:event_planner/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/utils/app_color.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final _introKey = GlobalKey<IntroductionScreenState>();
  late var local;
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    local = AppLocalizations.of(context)!;
    return IntroductionScreen(
      dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: AppColor.primaryLight,
          color: Theme.of(context).colorScheme.secondary,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0))),
      // 2. Pass that key to the `IntroductionScreen` `key` param
      key: _introKey,
      pages: [
        intropage(AppAssets.Intro_2, local.intro2_title, local.intro2_content),
        intropage(AppAssets.Intro_3, local.intro3_title, local.intro3_content),
        intropage(AppAssets.Intro_4, local.intro4_title, local.intro4_content),
      ],
      next: Icon(
        Directionality.of(context) == TextDirection.ltr
            ? Icons.arrow_circle_right_outlined
            : Icons.arrow_circle_left_outlined,
        color: AppColor.primaryLight,
        size: 35,
      ),
      done: Icon(
        Directionality.of(context) == TextDirection.ltr
            ? Icons.arrow_circle_right_outlined
            : Icons.arrow_circle_left_outlined,
        color: AppColor.primaryLight,
        size: 30,
      ),
      back: Icon(
        Directionality.of(context) != TextDirection.ltr
            ? Icons.arrow_circle_right_outlined
            : Icons.arrow_circle_left_outlined,
        color: AppColor.primaryLight,
        size: 30,
      ),
      showBackButton: true,
      showNextButton: true,
      showDoneButton: true,

      onDone: () {
        setFirstRunPrefrences();
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginPage()));
      },
    );
  }

  PageViewModel intropage(String imageurl, String title, String subTitle) {
    return PageViewModel(
      title: "",
      bodyWidget: Column(
        children: [
          const SizedBox(height: 5),
          Image.asset(AppAssets.Logo),
          const SizedBox(height: 8),
          SizedBox(height: size.height * .4, child: Image.asset(imageurl)),
          const SizedBox(height: 5),
          Text(
            title,
            style: AppStyles.bold20blue,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            subTitle,
            style: AppStyles.normal16black
                .copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
        ],
      ),
    );
  }

  void setFirstRunPrefrences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('firstRun', false);
  }
}
