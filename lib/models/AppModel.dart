import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AppModel extends ChangeNotifier {
  ThemeMode? themeMode;

  bool get darkTheme => themeMode == ThemeMode.dark;
  set darkTheme(bool value) =>
      themeMode = value ? ThemeMode.dark : ThemeMode.light;
  Future<void> updateTheme(bool theme) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      darkTheme = theme;
      await prefs.setBool('darkTheme', theme);
      notifyListeners();
    } catch (error) {}
  }

  Future<bool> getThemeConfig() async {
    try {
      var prefs = await SharedPreferences.getInstance();

      darkTheme = prefs.getBool('darkTheme') ?? false;

      await updateTheme(darkTheme);
      notifyListeners();
      return true;
    } catch (err) {
      return false;
    }
  }
}
