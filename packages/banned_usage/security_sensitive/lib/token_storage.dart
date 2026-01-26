import 'storage_types.dart';

// ❌ Bad: Insecure token storage

class TokenManager {
  Future<void> saveAccessToken(String token) async {
    // LINT: Do not store sensitive data in SharedPreferences. Use SecureStorage.
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', token);
  }

  Future<void> saveRefreshToken(String token) async {
    // LINT: Do not store sensitive data in SharedPreferences. Use SecureStorage.
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('refresh_token', token);
  }
}
