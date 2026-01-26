// ✅ CORRECT: Core with no upward dependencies
/// Good logger with no feature dependencies
class GoodLogger {
  void log(String message) {
    print('[Logger] $message');
  }
}
