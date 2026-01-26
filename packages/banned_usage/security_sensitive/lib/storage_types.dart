// Simulated types

class SharedPreferences {
  static Future<SharedPreferences> getInstance() async => SharedPreferences();
  Future<bool> setString(String key, String value) async => true;
  String? getString(String key) => null;
}
