import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


//provider
class SettingsProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  SharedPreferences? prefs;
  Locale currentLocale = Locale('en');

  String changeLanguageTheme(){
    String newLangTheme;
    if(currentLocale == Locale('en')){
      newLangTheme = 'forQuran';
      return newLangTheme;
    }else{
      newLangTheme = 'Quran';
      return newLangTheme;
    }

  }

  void changeTheme(ThemeMode newTheme) {
    if (newTheme == currentTheme) return;
    currentTheme = newTheme;
    notifyListeners();
    saveTheme(newTheme);
  }

  String getBackgroundImage() {
    return currentTheme == ThemeMode.dark ?
    'assets/images/dark_background.png' :
    'assets/images/main_background.jpg';
  }

  bool isDarkEnabled() {
    return currentTheme == ThemeMode.dark;
  }

  void changeLanguage(Locale newLocale) {
    if (newLocale == currentLocale) return;
    currentLocale = newLocale;
    notifyListeners();
    saveLocale(newLocale);
  }

  bool isEnglishEnabled() {
    return currentLocale == Locale('en');
  }

  String getSebhaBodyImage() {
    return currentTheme == ThemeMode.dark ?
    'assets/images/sebha_body_dark.png' :
    'assets/images/sebha_body.png';
  }

  String getSebhaHeadImage() {
    return currentTheme == ThemeMode.dark ?
    'assets/images/sebha_head_dark.png' :
    'assets/images/sebha_head.png';
  }

  Future<void> saveTheme(ThemeMode themeMode) async {
    String newTheme = themeMode == ThemeMode.dark ? 'dark' : 'light';
    await prefs!.setString('theme', newTheme);
  }

  String? getTheme() {
    return prefs!.getString('theme');
  }

  Future<void> loadThemeData() async {
    prefs = await SharedPreferences.getInstance();
    String? oldTheme = getTheme();
    if (oldTheme != null) {
      currentTheme = oldTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;
    }
  }

  Future <void> saveLocale(Locale locale) async {
    String newlocale = locale == Locale('en') ? 'english' : 'arabic';
    await prefs!.setString('language', newlocale);
  }
  String? getLocale() {
    return prefs!.getString('language');
  }
  Future<void> loadLocale()async{
    prefs = await SharedPreferences.getInstance();
    String? oldLocale = getLocale();
    if (oldLocale != null){
      currentLocale = oldLocale == 'english'?  Locale('en') : Locale('ar');
    }
  }
}