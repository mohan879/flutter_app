// Test utilities - should only be in test/ folder

class MockUserRepository {
  String? lastFetchedId;

  Future<Map<String, dynamic>> fetchUser(String id) async {
    lastFetchedId = id;
    return {'id': id, 'name': 'Mock User'};
  }
}

class MockApiClient {
  Future<dynamic> get(String path) async => {};
}

class FakeAuthService {
  bool isAuthenticated = true;

  Future<bool> login(String email, String password) async {
    return isAuthenticated;
  }
}

class FakeStorage {
  final Map<String, String> _data = {};

  Future<void> write(String key, String value) async {
    _data[key] = value;
  }

  String? read(String key) => _data[key];
}

// Simulated Mockito when
void when(dynamic invocation) {}
