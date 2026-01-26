// ❌ VIOLATION: Shared code importing web-specific library
import 'dart:html';

/// Shared code that incorrectly uses dart:html
class BadSharedCode {
  void showAlert(String message) {
    window.alert(message);
  }
}
