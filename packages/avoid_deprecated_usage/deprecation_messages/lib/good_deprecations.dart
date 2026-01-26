// ✅ GOOD: Well-documented deprecations with clear guidance

class User {
  final String name;
  final String email;
  User(this.name, this.email);
}

class UserService {
  static User getCurrentUser() => User('John', 'john@example.com');
}

// ✅ Good: Clear replacement
@Deprecated('Use UserService.getCurrentUser() instead. Will be removed in v3.0')
User getUser() => UserService.getCurrentUser();

class SignInRequest {
  final String email;
  final String password;
  SignInRequest({required this.email, required this.password});
}

class SignInResult {
  final User user;
  SignInResult(this.user);
}

class AuthRepository {
  Future<SignInResult> signIn(SignInRequest request) async {
    return SignInResult(User('John', request.email));
  }
}

// ✅ Better: Include migration example
@Deprecated('''
Use AuthRepository.signIn() instead.

Before:
  final user = await loginUser(email, password);

After:
  final result = await authRepository.signIn(
    SignInRequest(email: email, password: password),
  );

Will be removed in version 4.0.0.
''')
Future<User> loginUser(String email, String password) async {
  return User('John', email);
}

// ✅ Good: Specific version information
@Deprecated('Removed in v2.0. Use ConfigService.getValue() instead.')
String getConfig(String key) => 'value';
