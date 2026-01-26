// ✅ GOOD: Using exhaustive pattern matching with switch
import 'states.dart';

class GoodStateHandler {
  String handleState(AppState state) {
    // ✅ Exhaustive pattern matching - compiler enforces all cases
    return switch (state) {
      LoadingState() => 'Loading...',
      ErrorState(:final message) => 'Error: $message',
      SuccessState(:final data) => 'Success: $data',
    };
  }

  // ✅ Using the type itself is fine, only is checks are banned
  void processLoading(LoadingState state) {
    // Direct type usage is allowed
  }

  // ✅ Pattern matching in if-case is also fine
  String? getError(AppState state) {
    if (state case ErrorState(:final message)) {
      return message;
    }
    return null;
  }
}
