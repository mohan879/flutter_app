/// Structured logging service

class Logger {
  /// Debug level - stripped in release builds
  static void d(String message, {Map<String, dynamic>? data}) {
    // Only logs in debug mode
  }

  /// Info level - general information
  static void i(String message, {Map<String, dynamic>? data}) {
    // Logs in all builds
  }

  /// Warning level - potential issues
  static void w(String message, {Map<String, dynamic>? data}) {
    // Logs in all builds, may report to crash service
  }

  /// Error level - errors and exceptions
  static void e(String message, {Object? error, StackTrace? stackTrace}) {
    // Logs in all builds, reports to crash service
  }
}
