import 'package:event_planner/auth/field_validation.dart';
import 'package:event_planner/auth/forget_password_page.dart';
import 'package:event_planner/auth/login_page_navigator.dart';
import 'package:event_planner/auth/login_page_viewmodel.dart';
import 'package:event_planner/auth/register_page.dart';
import 'package:event_planner/core/utils/app_assets.dart';
import 'package:event_planner/core/utils/app_color.dart';
import 'package:event_planner/core/utils/app_styles.dart';
import 'package:event_planner/core/utils/custom_dailog.dart';
import 'package:event_planner/firebase/firebase_authuntace.dart';
import 'package:event_planner/firebase/firestore_user.dart';
import 'package:event_planner/model/user.dart';
import 'package:event_planner/tabs/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../frist_run/widget/language_widget.dart';
import '../providers/event_provider.dart';
import '../providers/user_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginPageNavigator {
  bool passObsecure = true;
  LoginPageViewmodel viewmodel = LoginPageViewmodel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewmodel.navigator = this;

  }

  @override
  Widget build(BuildContext context) {
    viewmodel.userProvider = Provider.of<UserProvider>(context);
    viewmodel.eventProvider = Provider.of<EventProvider>(context);

    Size size = MediaQuery.of(context).size;
    var local = AppLocalizations.of(context)!;

    return ChangeNotifierProvider(
      create: (context) => viewmodel,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: viewmodel.formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Image.asset(AppAssets.Logo2),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  //Email  Field
                  TextFormField(
                    controller: viewmodel.emailController,
                    validator: FieldValidation.emailValidation,
                    style: AppStyles.normal20white.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                    decoration: InputDecoration(
                        hintText: local.email,
                        prefixIcon: const Icon(Icons.email)),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),

                  // Password Field
                  TextFormField(
                    controller: viewmodel.passwordController,
                    obscureText: passObsecure,
                    validator: FieldValidation.passwordValidation,
                    style: AppStyles.normal20white.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                    decoration: InputDecoration(
                        hintText: local.password,
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(passObsecure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            passObsecure = !passObsecure;
                            setState(() {});
                          },
                        )),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ForgetPasswordPage(),
                              ));
                        },
                        child: Text(
                          local.forget_password,
                          style: AppStyles.bold16blue,
                        )),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  SizedBox(
                    width: double.infinity,
                    //Login Button
                    child: ElevatedButton(
                        onPressed: viewmodel.login,
                        child: Text(
                          local.login,
                          style: AppStyles.normal20white,
                        )),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Text(
                        local.dont_have_account,
                        style: AppStyles.normal16black.copyWith(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterPage(),
                            )),
                        child: Text(
                          local.create_account,
                          style: AppStyles.normal16blue,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Divider with a defined width
                      SizedBox(
                        width: size.width *
                            0.3, // Set a fixed width for the divider
                        child: Divider(
                          indent: size.width * 0.02,
                          endIndent: size.width * 0.02,
                          thickness: 1,
                          color: AppColor.primaryLight,
                        ),
                      ),
                      Text(
                        " or ",
                        style: AppStyles.normal16blue,
                      ),
                      // Another Divider with width defined, endIndent also optional
                      SizedBox(
                        width:
                            size.width * 0.3, // Set the width for this divider
                        child: Divider(
                          endIndent: size.width * 0.02,
                          thickness: 1,
                          color: AppColor.primaryLight,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  //Login With Google
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppColor.transpernt,
                        side: const BorderSide(color: AppColor.primaryLight)),
                    onPressed: () {
                      viewmodel.loginWithGmail();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            backgroundColor: AppColor.transpernt,
                            child: Image.asset(
                              AppAssets.Google_icon,
                              height: size.height * .04,
                            )),
                        Text(
                          local.login_with_google,
                          style: AppStyles.normal20blue,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  const LanguageWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  @override
  goHome() {
    hideLoading();
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => Home(),
    ));
  }

  @override
  hideLoading() {
    CustomDailog.hideLoading(context);
  }

  @override
  showDailog(String massage) {
    CustomDailog.showMessageDailog(context,
        message: massage, firstButtonLabel: "OK");
  }

  @override
  showLoading() {
    CustomDailog.showLoading(context);
  }
}
