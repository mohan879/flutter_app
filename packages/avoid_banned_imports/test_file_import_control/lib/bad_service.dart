// ❌ VIOLATION: Production code importing test utilities
import 'package:mockito/mockito.dart';

/// Service that incorrectly depends on test utilities
class BadService {
  // This is a mock in production code - very bad!
  final Mock _mockDependency = Mock();

  void doSomething() {
    print('Using mock in production: $_mockDependency');
  }
}
