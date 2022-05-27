import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  SharedPreferences? _prefs;
  get prefs => _prefs;
  set prefs(instance) => _prefs = instance;

  Future loadInstance() async => _prefs = await SharedPreferences.getInstance();

  String getSavedThemeKey() {
    return prefs!.getString('dynamic_tako_theme_key') ?? "";
  }

  Future<void> saveThemeKey(String themeKey) async {
    await _prefs!.setString('dynamic_tako_theme_key', themeKey);
  }

  Future<void> deleteThemeKey() async {
    await _prefs!.remove('dynamic_tako_theme_key');
  }
}
