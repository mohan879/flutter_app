/// Abstract logging service interface.
abstract class LoggingService {
  void debug(String message);
  void info(String message);
  void warning(String message);
  void error(String message, [Object? error, StackTrace? stackTrace]);
}

/// Logging service implementation.
class LoggingServiceImpl implements LoggingService {
  @override
  void debug(String message) {
    print('[DEBUG] $message');
  }

  @override
  void info(String message) {
    print('[INFO] $message');
  }

  @override
  void warning(String message) {
    print('[WARNING] $message');
  }

  @override
  void error(String message, [Object? error, StackTrace? stackTrace]) {
    print('[ERROR] $message');
    if (error != null) print('  Error: $error');
    if (stackTrace != null) print('  Stack: $stackTrace');
  }
}
