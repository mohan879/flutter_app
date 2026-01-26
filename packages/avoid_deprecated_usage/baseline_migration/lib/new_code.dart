// New code written after baseline - deprecations should be flagged
import 'deprecated_apis.dart';

class NewUserManager {
  // ❌ NEW deprecated usage - NOT in baseline, should fail CI
  User getNewUser() => getUser();

  // ❌ NEW deprecated usage - should be caught
  final OldUserService _oldService = OldUserService();
}
