// ✅ CORRECT: Centralized logging service can use dart:developer
import 'dart:developer';

/// Centralized logging service
class LoggingService {
  static void log(String message, {String? tag}) {
    developer.log(message, name: tag ?? 'App');
  }

  static void error(String message, {Object? error, StackTrace? stackTrace}) {
    developer.log(message, name: 'ERROR', error: error, stackTrace: stackTrace);
  }
}
