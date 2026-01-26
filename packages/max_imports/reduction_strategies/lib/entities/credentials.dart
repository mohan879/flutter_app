/// Credentials entity for authentication.
class Credentials {
  final String username;
  final String password;

  const Credentials({required this.username, required this.password});

  bool get isValid => username.isNotEmpty && password.length >= 8;
}
