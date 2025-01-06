import 'package:event_planner/firebase/firestore_user.dart';
import 'package:event_planner/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthuntace {
  static late UserCredential credential;
  Future<void> currentUserState() async {
  FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {
  if (user == null) {
  print('User is currently signed out!');
  } else {
  print('User is signed in!');
  }
  });
}

  static Future<String?> createAccountByEmail(
      {required String emailAddress,
      required String password,
      required String name}) async {
    try {
      credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
      password: password,
    );

      MyUser user =
          MyUser(uID: credential.user!.uid, name: name, email: emailAddress);
      FirestoreUser.addUser(user);
    } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return e.code;
      }
  } catch (e) {
      return e.toString();
    }

    return null;
  }

  static Future<String?> signInWithEmail(
      String emailAddress, String password) async {
    String message = "yyyyyyyy";
    try {
      credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress,
        password: password
    );
      return null;
    }
    //  on FirebaseAuthException catch (e) {
    //   if (e.code == 'user-not-found') {
    //     message='No user found for that email.';
    //   } else if (e.code == 'wrong-password') {
    //     message='Wrong password provided for that user.';
    //   }
    // }
    catch (e) {
      message = e.toString();
    }
    return message;
  }

  static Future<UserCredential?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Check if the user canceled the sign-in
    if (googleUser == null) {
      print("Sign-in canceled by user.");
      return null; // Exit the function
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Sign in with Firebase
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  static void logout() async {
    await FirebaseAuth.instance.signOut();
}

}

