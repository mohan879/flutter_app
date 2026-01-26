// ❌ BAD: Using is checks instead of exhaustive pattern matching
import 'states.dart';

class BadStateHandler {
  String handleState(AppState state) {
    // ❌ Violation: Using is check
    if (state is LoadingState) {
      return 'Loading...';
    }

    // ❌ Violation: Using is check
    if (state is ErrorState) {
      return 'Error: ${state.message}';
    }

    // ❌ Violation: Using is check
    if (state is SuccessState) {
      return 'Success: ${state.data}';
    }

    return 'Unknown';
  }

  // Also bad in ternary expressions
  bool isLoading(AppState state) => state is LoadingState;
}
