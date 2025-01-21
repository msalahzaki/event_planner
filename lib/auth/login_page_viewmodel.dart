import 'package:event_planner/auth/login_page_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  void loginWithGmail() async {
    try {
      UserCredential? userCredential =
      await FirebaseAuthuntace.signInWithGoogle();

      // Retrieve user details
      User? user1 = userCredential!.user;

      if (user1 != null) {
        String? username = user1.displayName;
        String? email = user1.email;
        MyUser user =
        MyUser(uID: user1.uid, name: username ?? "", email: email ?? "");
        FirestoreUser.addUser(user);
        //  userProvider.changeUser(user);
        //eventProvider.changeSelectedcategory(-1, user.uID);
        navigator.goHome();
      } else {
        print("No user details available.");
      }
    } catch (e) {
      navigator.showDailog("Error during Google sign-in: $e");
    }
  }
}
