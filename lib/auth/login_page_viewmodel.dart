import 'package:event_planner/auth/login_page_navigator.dart';
import 'package:flutter/material.dart';

import '../firebase/firebase_authuntace.dart';
import '../firebase/firestore_user.dart';
import '../model/user.dart';
import '../providers/event_provider.dart';
import '../providers/user_provider.dart';

class LoginPageViewmodel extends ChangeNotifier {
  late EventProvider eventProvider;
  late UserProvider userProvider;
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController(text: "msalah@gmail.com");
  var passwordController = TextEditingController(text: "123456");
  late LoginPageNavigator navigator;

  login() async {
    if (formKey.currentState!.validate()) {
      navigator.showLoading();

      String? message = await FirebaseAuthuntace.signInWithEmail(
          emailController.text, passwordController.text);

      navigator.hideLoading();

      if (message != null) {
        navigator.showDailog(message);
      } else {
        navigator.showDailog("Login Successfully");
        MyUser? user = await FirestoreUser.getUserByID(
            FirebaseAuthuntace.credential.user!.uid);
        userProvider.changeUser(user!);
        eventProvider.changeSelectedcategory(-1, user.uID);
        navigator.goHome();
      }
    }
  }
}
