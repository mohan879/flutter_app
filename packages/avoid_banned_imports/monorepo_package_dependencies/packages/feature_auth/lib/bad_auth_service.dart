// ❌ VIOLATION: Feature importing another feature
import 'package:feature_profile/feature_profile.dart';

/// Auth service that incorrectly depends on another feature
class BadAuthService {
  final ProfileService _profileService;

  BadAuthService(this._profileService);

  Future<bool> login(String email, String password) async {
    // Cross-feature dependency - should use shared abstractions
    await _profileService.loadProfile();
    return true;
  }
}
