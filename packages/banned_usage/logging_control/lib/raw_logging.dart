// Simulated debugPrint and debugger
void debugPrint(String message) {}
void debugger({bool when = true}) {}

// ❌ Bad: Using raw print statements instead of structured logging

class UserService {
  void login(String email) {
    // LINT: Use Logger.d/i/w/e() for structured logging.
    print('User logging in: $email');

    // LINT: Use Logger service for consistent logging across the app.
    debugPrint('Debug: login attempt for $email');
  }

  void logout() {
    // LINT: Use Logger.d/i/w/e() for structured logging.
    print('User logged out');
  }
}

void handleError(Object error, StackTrace stackTrace) {
  // LINT: Use Logger.d/i/w/e() for structured logging.
  print('Error occurred: $error');

  // LINT: Use Logger.d/i/w/e() for structured logging.
  print(stackTrace);
}

void debugSession() {
  // LINT: Remove debugger() calls before committing code.
  debugger();

  // LINT: Use Logger.d/i/w/e() for structured logging.
  print('Debugging session started');
}

void processData(List<int> items) {
  for (final item in items) {
    // LINT: Use Logger.d/i/w/e() for structured logging.
    print('Processing item: $item');
  }
}
