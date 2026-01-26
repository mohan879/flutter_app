import 'storage_types.dart';

// ❌ Bad: Scattered storage access with inconsistent keys

class UserPreferences {
  Future<void> saveTheme(String theme) async {
    // LINT: Use LocalStorage service from DI instead of direct SharedPreferences access.
    final prefs = await SharedPreferences.getInstance();

    // Using raw setString (key typos possible)
    await prefs.setString('user_theme', theme);
  }

  Future<String?> loadTheme() async {
    // LINT: Use LocalStorage service from DI instead of direct SharedPreferences access.
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_theme');
  }
}

class AuthStorage {
  Future<void> saveToken(String token) async {
    // LINT: Use SecureStorage service from DI for consistent secure storage access.
    final secure = FlutterSecureStorage();
    await secure.write(key: 'auth_token', value: token);
  }

  Future<void> saveInsecurely(String token) async {
    // LINT: Use LocalStorage service from DI instead of direct SharedPreferences access.
    final prefs = await SharedPreferences.getInstance();

    // ⚠️ Storing sensitive data in unencrypted storage!
    await prefs.setString('auth_token', token);
  }
}

class SettingsService {
  Future<void> saveLocale(String locale) async {
    // LINT: Use LocalStorage service from DI instead of direct SharedPreferences access.
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', locale);
  }
}
