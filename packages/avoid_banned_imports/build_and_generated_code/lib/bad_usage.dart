// ❌ VIOLATION: Importing generated file directly
import 'user.g.dart';

/// Code that incorrectly imports generated file
class BadUsage {
  void useGeneratedCode() {
    // Should use User class from user.dart instead
    print('Using generated code directly');
  }
}
