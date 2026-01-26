// Simulated storage types

class SharedPreferences {
  static Future<SharedPreferences> getInstance() async {
    return SharedPreferences();
  }

  Future<bool> setString(String key, String value) async => true;
  String? getString(String key) => null;
}

class FlutterSecureStorage {
  FlutterSecureStorage();

  Future<void> write({required String key, required String? value}) async {}
  Future<String?> read({required String key}) async => null;
}
