import 'package:event_planner/core/utils/app_assets.dart';
import 'package:event_planner/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../frist_run/widget/language_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            local.register,
            style: AppStyles.normal20white
                .copyWith(color: Theme.of(context).colorScheme.secondary),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(AppAssets.Logo2),
            TextFormField(
              style: AppStyles.normal20white
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person), hintText: local.name),
            ),
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
              height: size.height * 0.015,
            ),
            TextFormField(
              style: AppStyles.normal20white
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
              decoration: InputDecoration(
                  hintText: local.password,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: const Icon(Icons.visibility_off)),
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            TextFormField(
              style: AppStyles.normal20white
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
              decoration: InputDecoration(
                  hintText: local.re_password,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: const Icon(Icons.visibility_off)),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    local.create_account,
                    style: AppStyles.normal20white,
                  )),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              children: [
                Text(
                  local.already_have_account,
                  style: AppStyles.normal16black
                      .copyWith(color: Theme.of(context).colorScheme.secondary),
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Text(
                    local.login,
                    style: AppStyles.normal16blue,
                  ),
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            LanguageWidget(),
          ],
        ),
      ),
    );
  }
}
