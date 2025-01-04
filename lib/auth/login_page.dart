import 'package:event_planner/auth/field_validation.dart';
import 'package:event_planner/auth/forget_password_page.dart';
import 'package:event_planner/auth/register_page.dart';
import 'package:event_planner/core/utils/app_assets.dart';
import 'package:event_planner/core/utils/app_color.dart';
import 'package:event_planner/core/utils/app_styles.dart';
import 'package:event_planner/core/utils/custom_dailog.dart';
import 'package:event_planner/firebase/firebase_authuntace.dart';
import 'package:event_planner/tabs/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:toast/toast.dart';

import '../frist_run/widget/language_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var formKey = GlobalKey<FormState>();
  bool passObsecure = true;
  var emailController = TextEditingController(text: "msalah@gmail.com");
  var passwordController = TextEditingController(text: "123456");

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    Size size = MediaQuery.of(context).size;
    var local = AppLocalizations.of(context)!;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
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
                  controller: emailController,
                  validator: FieldValidation.emailValidation,
                  style: AppStyles.normal20white
                      .copyWith(color: Theme.of(context).colorScheme.secondary),
                  decoration: InputDecoration(
                      hintText: local.email,
                      prefixIcon: const Icon(Icons.email)),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),

                // Password Field
                TextFormField(
                  controller: passwordController,
                  obscureText: passObsecure,
                  validator: FieldValidation.passwordValidation,
                  style: AppStyles.normal20white
                      .copyWith(color: Theme.of(context).colorScheme.secondary),
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
                              builder: (context) => const ForgetPasswordPage(),
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
                      onPressed: login,
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
                      width:
                          size.width * 0.3, // Set a fixed width for the divider
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
                      width: size.width * 0.3, // Set the width for this divider
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
                  onPressed: () {},
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
    );
  }

  login() async {
    if (formKey.currentState!.validate()) {
      CustomDailog.showLoading(context);
      String? message = await FirebaseAuthuntace.signInWithEmail(
          emailController.text, passwordController.text);
      CustomDailog.hideLoading(context);
      if (message != null)
        CustomDailog.showMessageDailog(context,
            message: message, firstButtonLabel: "Ok");
      else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Home()));
      }

      //Toast.show("Login Successfuly",backgroundColor:Colors.greenAccent,duration: Toast.lengthLong);
    }
  }
}
