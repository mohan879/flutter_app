// Deprecated API definitions
@deprecated
class OldUserService {
  String getUser() => 'old user';
}

@Deprecated(
  'Use UserRepository.getCurrentUser() instead. Will be removed in v3.0',
)
User getUser() => User('John');

@Deprecated('Use AuthService.signIn() instead')
Future<bool> login(String email, String password) async => true;

class User {
  final String name;
  User(this.name);
}
