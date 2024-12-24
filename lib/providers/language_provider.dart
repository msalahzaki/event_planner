
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier{
  String language =  "en";

  LanguageProvider(){
    getLanguagePrefrences();
  }

  void changeLanguage({required String language}){
    if(this.language != language){
      this.language = language;
      setLanguagePrefrences();
      notifyListeners();
    }

  }

  void setLanguagePrefrences() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', language);

  }

  void getLanguagePrefrences () async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    language =  prefs.getString('language') ?? "en";
    notifyListeners();
  }



}