/// Abstract auth service interface.
abstract class AuthService {
  Future<bool> login(String email, String password);
  Future<void> logout();
  bool get isAuthenticated;
}

/// Auth service implementation.
class AuthServiceImpl implements AuthService {
  bool _isAuthenticated = false;

  @override
  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _isAuthenticated = email.isNotEmpty && password.length >= 8;
    return _isAuthenticated;
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _isAuthenticated = false;
  }

  @override
  bool get isAuthenticated => _isAuthenticated;
}
