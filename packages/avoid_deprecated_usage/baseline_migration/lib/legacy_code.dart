// Legacy code with existing deprecated usages
// These would be captured in the baseline
import 'deprecated_apis.dart';

class LegacyUserManager {
  // ❌ Uses deprecated class - would be in baseline
  final OldUserService _service = OldUserService();

  // ❌ Uses deprecated function - would be in baseline
  User fetchUser() => getUser();

  // ❌ Uses deprecated login - would be in baseline
  Future<bool> authenticate(String email, String password) {
    return login(email, password);
  }
}
