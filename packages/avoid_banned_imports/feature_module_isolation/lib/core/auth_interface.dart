// ✅ CORRECT: Core module that features can share
/// Shared authentication interface
abstract class AuthInterface {
  Future<bool> isAuthenticated();
  Future<String?> getCurrentUserId();
}
