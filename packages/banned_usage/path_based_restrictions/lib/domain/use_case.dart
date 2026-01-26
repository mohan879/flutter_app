import '../types.dart';

// ❌ Bad: Domain layer using Flutter BuildContext

class GetUserUseCase {
  // LINT: Domain layer should not use Flutter BuildContext.
  String execute(BuildContext context, String userId) {
    // Domain should be pure Dart, no Flutter dependencies
    return 'user_$userId';
  }
}

class AuthUseCase {
  // LINT: Domain layer should not use Flutter BuildContext.
  void logout(BuildContext context) {
    // Should not depend on BuildContext
  }
}
