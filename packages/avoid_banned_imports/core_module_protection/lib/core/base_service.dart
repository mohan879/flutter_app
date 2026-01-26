// ❌ VIOLATION: Core importing from features
import '../features/auth/auth_service.dart';

/// Base service that incorrectly depends on a specific feature
abstract class BaseService {
  final AuthService _authService;

  BaseService(this._authService);

  Future<bool> checkAuth() async {
    return _authService.isAuthenticated();
  }
}
