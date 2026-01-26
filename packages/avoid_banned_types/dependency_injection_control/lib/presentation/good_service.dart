// ✅ GOOD: Constructor injection - explicit dependencies
abstract class UserRepository {
  Future<String> getUser();
}

class GoodUserService {
  // ✅ Explicit dependency via constructor
  final UserRepository _userRepository;

  GoodUserService(this._userRepository);

  Future<String> getUser() async {
    return _userRepository.getUser();
  }
}
