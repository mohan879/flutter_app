abstract class UserRepository {
  Future<String> getUser();
}

// This mock type is fine to define in lib, but problematic to USE in lib
class MockUserRepository implements UserRepository {
  @override
  Future<String> getUser() async => 'Mock User';
}

class FakeApiClient {
  String fetch() => 'fake data';
}
