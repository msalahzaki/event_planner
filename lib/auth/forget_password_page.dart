import 'package:event_planner/core/utils/app_assets.dart';
import 'package:event_planner/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<ForgetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            local.forget_password,
            style: AppStyles.normal20white
                .copyWith(color: Theme.of(context).colorScheme.secondary),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(AppAssets.Reset_Pass),
            SizedBox(
              height: size.height * 0.015,
            ),
            TextFormField(
              style: AppStyles.normal20white
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
              decoration: InputDecoration(
                  hintText: local.email, prefixIcon: const Icon(Icons.email)),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    local.reset_password,
                    style: AppStyles.normal20white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
