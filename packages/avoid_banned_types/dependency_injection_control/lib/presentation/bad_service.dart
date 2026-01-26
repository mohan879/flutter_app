// ❌ BAD: Using GetIt directly outside DI configuration files
import 'package:get_it/get_it.dart';

abstract class UserRepository {
  Future<String> getUser();
}

class BadUserService {
  // ❌ Violation: Service locator pattern - hidden dependency
  final GetIt _getIt = GetIt.instance;

  Future<String> getUser() async {
    final repo = _getIt<UserRepository>();
    return repo.getUser();
  }
}

class AnotherBadService {
  // ❌ Violation: Direct GetIt usage
  void doSomething() {
    final getIt = GetIt.I;
    final repo = getIt<UserRepository>();
    // ...
  }
}
