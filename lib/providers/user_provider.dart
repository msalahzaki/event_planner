import 'package:event_planner/model/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  MyUser? user;

  void changeUser(MyUser user) {
    this.user = user;
    notifyListeners();
  }
}
