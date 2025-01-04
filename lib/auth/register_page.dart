import 'package:event_planner/auth/field_validation.dart';
import 'package:event_planner/auth/login_page.dart';
import 'package:event_planner/core/utils/app_assets.dart';
import 'package:event_planner/core/utils/app_styles.dart';
import 'package:event_planner/core/utils/custom_dailog.dart';
import 'package:event_planner/firebase/firebase_authuntace.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../firebase/firestore_user.dart';
import '../frist_run/widget/language_widget.dart';
import '../model/user.dart';
import '../providers/user_provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late UserProvider userProvider;
  var formKey = GlobalKey<FormState>();
  bool passObsecure = true;
  var accountNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    var local = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(local.register, style: AppStyles.normal20white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Image.asset(AppAssets.Logo2),
              TextFormField(
                controller: accountNameController,
                style: AppStyles.normal20white
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person), hintText: local.name),
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
              TextFormField(
                controller: emailController,
                validator: FieldValidation.emailValidation,
                style: AppStyles.normal20white
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
                decoration: InputDecoration(
                    hintText: local.email, prefixIcon: const Icon(Icons.email)),
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
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
              SizedBox(
                height: size.height * 0.015,
              ),
              TextFormField(
                controller: rePasswordController,
                obscureText: passObsecure,
                validator: (repassword) {
                  if (repassword != passwordController.text) {
                    return ("Password Don't Match ");
                  }
                  FieldValidation.emailValidation(repassword);
                  return null;
                },
                style: AppStyles.normal20white
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
                decoration: InputDecoration(
                    hintText: local.re_password,
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
              SizedBox(
                height: size.height * 0.02,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: createAccount,
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
                    style: AppStyles.normal16black.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
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
              const LanguageWidget(),
            ],
          ),
        ),
      ),
    );
  }

  createAccount() async {
    if (formKey.currentState!.validate()) {
      CustomDailog.showLoading(context);
      String? message = await FirebaseAuthuntace.createAccountByEmail(
          emailAddress: emailController.text,
          password: passwordController.text,
          name: accountNameController.text);
      CustomDailog.hideLoading(context);
      if (message == null) {
        MyUser? user = await FirestoreUser.getUserByID(
            FirebaseAuthuntace.credential.user!.uid);
        userProvider.changeUser(user!);

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ));
      } else {
        CustomDailog.showMessageDailog(context,
            message: message, firstButtonLabel: "OK");
      }
    }
  }
}
