// ✅ CORRECT: Importing the source file, not the generated one
import 'user.dart';

/// Good usage - imports source file which has the part directive
class GoodUsage {
  User createUser() {
    return User(id: '1', name: 'John', email: 'john@example.com');
  }
}
