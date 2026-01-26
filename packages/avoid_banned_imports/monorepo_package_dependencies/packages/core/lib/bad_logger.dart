// ❌ VIOLATION: Core importing from feature package
import 'package:feature_auth/feature_auth.dart';

/// Logger that incorrectly depends on a feature
class BadLogger {
  final AuthService _authService;

  BadLogger(this._authService);

  void log(String message) {
    print('[$_authService] $message');
  }
}
