import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static const themeKey = 'theme_key';

  Future<void> setTheme(bool value) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(themeKey, value);
  }

  Future<bool> getTheme() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(themeKey) ?? false;
  }
}
