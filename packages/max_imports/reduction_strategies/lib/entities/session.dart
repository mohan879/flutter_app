/// Session entity representing an active user session.
class Session {
  final String sessionId;
  final DateTime createdAt;
  final DateTime expiresAt;
  final bool isActive;

  const Session({
    required this.sessionId,
    required this.createdAt,
    required this.expiresAt,
    this.isActive = true,
  });

  bool get isExpired => DateTime.now().isAfter(expiresAt);
}
