import 'package:shared_preferences/shared_preferences.dart';

class AppShared {
  static late final SharedPreferences _sharedPreferences;

  static Future<SharedPreferences> init() async =>
      _sharedPreferences = await SharedPreferences.getInstance();

  static Future<bool> setString(
      {required String key, required String value}) async {
    return await _sharedPreferences.setString(key, value);
  }

  static Future<bool> setInt({required String key, required int value}) async {
    return await _sharedPreferences.setInt(key, value);
  }

  static String? getString({required String key}) {
    return _sharedPreferences.getString(key);
  }

  static int? getInt({required String key}) {
    return _sharedPreferences.getInt(key);
  }

  static Future<bool> clear({required String key}) async {
    return await _sharedPreferences.remove(key);
  }

  static Future<bool> clearAll() async {
    return await _sharedPreferences.clear();
  }
}
