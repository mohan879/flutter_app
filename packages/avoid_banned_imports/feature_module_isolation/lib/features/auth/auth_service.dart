// ❌ VIOLATION: Auth feature importing from home feature
import '../home/home_model.dart';

/// Auth service that incorrectly depends on home feature
class AuthService {
  HomeModel? _lastVisitedHome;

  Future<bool> login(String email, String password) async {
    // Simulated login
    return true;
  }

  void setLastHome(HomeModel home) {
    _lastVisitedHome = home;
  }
}
