import 'test_utilities.dart';

// ❌ Bad: Using test utilities in production code

class UserService {
  // LINT: Mock classes should only be used in tests.
  final repo = MockUserRepository();

  Future<Map<String, dynamic>> getUser(String id) async {
    return await repo.fetchUser(id);
  }
}

class AuthController {
  // LINT: Fake classes should only be used in tests.
  final auth = FakeAuthService();

  Future<bool> login(String email, String password) async {
    return await auth.login(email, password);
  }
}

class SettingsManager {
  // LINT: Fake classes should only be used in tests.
  final storage = FakeStorage();

  Future<void> saveSetting(String key, String value) async {
    await storage.write(key, value);
  }
}

void setupMocks() {
  final mock = MockApiClient();

  // LINT: Mockito when() should only be used in tests.
  when(mock.get('/users'));
}
