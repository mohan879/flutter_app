// ❌ VIOLATION: Using dart:developer directly
import 'dart:developer';

/// Code using direct dart:developer instead of logging service
class BadLogger {
  void logMessage(String message) {
    log(message, name: 'BadLogger');
  }
}
