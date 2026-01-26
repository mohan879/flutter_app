// ❌ BAD: Using mock/fake types in production code
import 'repository.dart';

class BadService {
  // ❌ Violation: MockUserRepository used in production
  final MockUserRepository _mockRepo = MockUserRepository();

  // ❌ Violation: FakeApiClient used in production
  final FakeApiClient _fakeClient = FakeApiClient();

  Future<String> getUser() async {
    return _mockRepo.getUser();
  }

  String fetchData() {
    return _fakeClient.fetch();
  }
}
