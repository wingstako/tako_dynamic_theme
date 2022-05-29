import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  SharedPreferences? _prefs;
  get prefs => _prefs;
  set prefs(instance) => _prefs = instance;

  /// get shared prefernce instance
  Future loadInstance() async => _prefs = await SharedPreferences.getInstance();

  /// get saved theme key from shared preferences
  String getSavedThemeKey() {
    return prefs!.getString('dynamic_tako_theme_key') ?? "";
  }

  /// save theme key to shared preferences
  Future<void> saveThemeKey(String themeKey) async {
    await _prefs!.setString('dynamic_tako_theme_key', themeKey);
  }

  /// clear saved theme in shared preferences
  Future<void> deleteThemeKey() async {
    await _prefs!.remove('dynamic_tako_theme_key');
  }
}
