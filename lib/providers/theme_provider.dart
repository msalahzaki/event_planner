

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier{
   ThemeMode theme = ThemeMode.light;



   ThemeProvider(){
    setLanguagePrefrences();
  }


   void changeTheme(ThemeMode newtheme){
     if(theme != newtheme){
       theme= newtheme;
      setLanguagePrefrences();
      notifyListeners();
     }

   }

   void setLanguagePrefrences() async{
     final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('theme', (theme == ThemeMode.light)? "light" : "dark");
  }

   void getLanguagePrefrences () async{
     final SharedPreferences prefs = await SharedPreferences.getInstance();
     theme =  prefs.getString('theme') == "dark" ? ThemeMode.dark : ThemeMode.light ;
     notifyListeners();
   }

}