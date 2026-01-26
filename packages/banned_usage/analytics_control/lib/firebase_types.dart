// Simulated Firebase types

class FirebaseAnalytics {
  static final instance = FirebaseAnalytics._();
  FirebaseAnalytics._();

  Future<void> logEvent({
    required String name,
    Map<String, dynamic>? parameters,
  }) async {}
}

class FirebaseCrashlytics {
  static final instance = FirebaseCrashlytics._();
  FirebaseCrashlytics._();

  Future<void> recordError(
    dynamic exception,
    StackTrace? stack, {
    bool fatal = false,
  }) async {}
}
