import 'storage_types.dart';

// ❌ Bad: Insecure storage and logging in auth files

class AuthService {
  Future<void> saveToken(String token) async {
    // LINT: Do not store sensitive data in SharedPreferences. Use SecureStorage.
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);

    // LINT: Never print sensitive data.
    print('Token saved: $token');
  }

  Future<void> login(String email, String password) async {
    // LINT: Never print sensitive data.
    print('Login attempt: $email / $password');

    // ... authentication logic
  }

  void refreshToken(String refreshToken) {
    // LINT: Never print sensitive data.
    print('Refreshing with token: $refreshToken');
  }
}
