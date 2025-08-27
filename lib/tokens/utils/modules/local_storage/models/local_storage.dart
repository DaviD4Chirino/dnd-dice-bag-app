import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences? pref;

  static Future<void> init() async {
    pref = await SharedPreferences.getInstance();
  }

  static void hasBeenInitialized() {
    assert(
      pref != null,
      "You need to initialize shared preferences",
    );
  }

  static Future<bool> setString(String key, String value) async {
    hasBeenInitialized();
    return pref!.setString(key, value);
  }

  static String? getString(String key) {
    hasBeenInitialized();
    return pref!.getString(key);
  }

  static Future<bool> setBool(String key, bool value) async {
    hasBeenInitialized();
    return pref!.setBool(key, value);
  }

  static bool? getBool(String key) {
    hasBeenInitialized();
    return pref!.getBool(key);
  }

  static Future<bool> setInt(String key, int value) async {
    hasBeenInitialized();
    return pref!.setInt(key, value);
  }

  static int? getInt(String key) {
    hasBeenInitialized();
    return pref!.getInt(key);
  }

  static Future<bool> setDouble(String key, double value) async {
    hasBeenInitialized();
    return pref!.setDouble(key, value);
  }

  static double? getDouble(String key) {
    hasBeenInitialized();
    return pref!.getDouble(key);
  }

  static Future<bool> setStringList(
    String key,
    List<String> value,
  ) async {
    hasBeenInitialized();
    return pref!.setStringList(key, value);
  }

  static List<String>? getStringList(String key) {
    hasBeenInitialized();
    return pref!.getStringList(key);
  }

  static Future<bool> remove(String key) async {
    hasBeenInitialized();
    return pref!.remove(key);
  }

  static Future<bool> clear() async {
    hasBeenInitialized();
    return pref!.clear();
  }

  static bool containsKey(String key) {
    hasBeenInitialized();
    return pref!.containsKey(key);
  }

  static Future<void> containsKeyInAll(List<String> keys) async {
    hasBeenInitialized();
    return pref!.reload();
  }

  static Future<Object?> get(String key) async {
    hasBeenInitialized();
    return pref!.get(key);
  }
}
