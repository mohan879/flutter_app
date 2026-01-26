// ❌ VIOLATION: Home feature importing from auth feature
import '../auth/auth_service.dart';

import 'home_model.dart';

/// Home page that incorrectly depends on auth feature directly
class HomePage {
  final AuthService _authService;

  HomePage(this._authService);

  Future<HomeModel> loadHome() async {
    // Should use shared abstractions, not direct auth imports
    return HomeModel(id: '1', title: 'Home', items: []);
  }
}
