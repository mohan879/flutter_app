/// Token entity for API authentication.
class Token {
  final String accessToken;
  final String refreshToken;
  final DateTime expiresAt;

  const Token({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
  });

  bool get isExpired => DateTime.now().isAfter(expiresAt);

  bool get needsRefresh {
    final buffer = const Duration(minutes: 5);
    return DateTime.now().isAfter(expiresAt.subtract(buffer));
  }
}
