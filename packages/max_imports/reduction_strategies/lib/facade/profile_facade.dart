import '../entities/entities.dart';

/// Facade that hides multiple repository dependencies behind a single interface.
///
/// Instead of injecting UserRepository, SessionRepository, TokenRepository
/// separately, consumers only need ProfileFacade.
class ProfileFacade {
  // In a real app, these would be injected repositories
  User? _currentUser;
  Session? _currentSession;
  Token? _currentToken;

  Future<User?> getCurrentUser() async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 100));
    return _currentUser;
  }

  Future<void> login(Credentials credentials) async {
    if (!credentials.isValid) {
      throw ArgumentError('Invalid credentials');
    }

    // Simulate authentication
    await Future.delayed(const Duration(milliseconds: 500));

    _currentUser = User(
      id: 'user_123',
      name: credentials.username,
      email: '${credentials.username}@example.com',
    );

    _currentSession = Session(
      sessionId: 'session_${DateTime.now().millisecondsSinceEpoch}',
      createdAt: DateTime.now(),
      expiresAt: DateTime.now().add(const Duration(hours: 24)),
    );

    _currentToken = Token(
      accessToken: 'access_token_xyz',
      refreshToken: 'refresh_token_xyz',
      expiresAt: DateTime.now().add(const Duration(hours: 1)),
    );
  }

  Future<void> logout() async {
    _currentUser = null;
    _currentSession = null;
    _currentToken = null;
  }

  bool get isAuthenticated => _currentUser != null && _currentSession != null;

  bool get needsTokenRefresh => _currentToken?.needsRefresh ?? false;
}
