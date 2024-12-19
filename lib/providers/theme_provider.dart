

import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
   ThemeMode theme = ThemeMode.light;

   void changeTheme(ThemeMode newtheme){
     if(theme != newtheme){
       theme= newtheme;
       notifyListeners();

     }

   }

}