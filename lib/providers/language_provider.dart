
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier{
  String language = "en";

  void changeLanguage({required String language}){
    if(this.language != language){
      this.language = language;
      notifyListeners();
    }

  }


}