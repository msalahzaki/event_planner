import 'package:event_planner/auth/register_page_navigator.dart';
import 'package:flutter/material.dart';

import '../firebase/firebase_authuntace.dart';
import '../firebase/firestore_user.dart';
import '../model/user.dart';
import '../providers/user_provider.dart';

class RegisterPageViewmodel extends ChangeNotifier {
  var formKey = GlobalKey<FormState>();
  late UserProvider userProvider;
  var accountNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();

  late RegisterPageNavigator navigator;

  createAccount() async {
    if (formKey.currentState!.validate()) {
      navigator.showLoading();
      String? message = await FirebaseAuthuntace.createAccountByEmail(
          emailAddress: emailController.text,
          password: passwordController.text,
          name: accountNameController.text);
      navigator.hideLoading();
      if (message == null) {
        navigator.showDailog("Register Successfully");
        MyUser? user = await FirestoreUser.getUserByID(
            FirebaseAuthuntace.credential.user!.uid);
         userProvider.changeUser(user!);

        navigator.goLoginPage();
      } else {
        navigator.showDailog(message);
      }
    }
  }
}
