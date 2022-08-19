import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class model extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  String currentLang='ar';
  bool isDark() {
    return currentTheme == ThemeMode.dark; //cuurentTheme = true
  }

  void changTheme(ThemeMode newTheme) async{
    final pref=await SharedPreferences.getInstance();
    if(newTheme== currentTheme){
      return;
    }
    else{
      currentTheme=newTheme;
    }
    pref.setString("Theme",
    currentTheme==ThemeMode.light?"Light":"Dark"
    );
    notifyListeners();
  }
  void changLang(String newLang) async{
    final pref=await SharedPreferences.getInstance();
    if(newLang==currentLang){
      return;
    }
    else{
      currentLang=newLang;
    }
    notifyListeners();
    pref.setString("Lang", currentLang);
  }
}
