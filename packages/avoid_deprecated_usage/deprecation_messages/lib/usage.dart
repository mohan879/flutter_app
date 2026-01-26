// Code using deprecated APIs - shows different message quality
import 'good_deprecations.dart';
import 'bad_deprecations.dart';

class DeprecatedUsage {
  // ❌ Good deprecation message - clear what to do
  void useGoodDeprecation() {
    getUser(); // Message: Use UserService.getCurrentUser() instead...
  }

  // ❌ Good deprecation message with migration example
  Future<void> useDetailedDeprecation() async {
    await loginUser('email', 'pass'); // Detailed migration guide shown
  }

  // ❌ Bad deprecation message - unclear what to do
  void useBadDeprecation() {
    oldFunction(); // Message: just "deprecated"
    anotherOldFunction(); // Message: "Do not use" - but use what?
  }

  // ❌ Bad deprecation - no guidance
  void useOldClass() {
    final old = OldClass();
    old.doWork();
  }
}
