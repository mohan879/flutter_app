// ❌ Bad: Using dangerous APIs that can throw exceptions

void dangerousTimeUsage() {
  // LINT: Use Clock.now() for testable time handling.
  final now = DateTime.now();
  print('Current time: $now');

  // LINT: Use Clock.now() for testable time handling.
  final timestamp = DateTime.now().millisecondsSinceEpoch;
  print('Timestamp: $timestamp');
}

void dangerousListUsage() {
  final List<int> numbers = [];
  final List<String> names = ['Alice', 'Bob'];
  final List<double> values = [3.14];

  // LINT: Use firstOrNull to avoid StateError on empty lists.
  // This will throw StateError if numbers is empty!
  // final firstNumber = numbers.first;

  // LINT: Use lastOrNull to avoid StateError on empty lists.
  final lastName = names.last;
  print('Last name: $lastName');

  // LINT: Use singleOrNull to avoid StateError on 0 or 2+ elements.
  // This will throw if list has 0 or more than 1 element!
  final singleValue = values.single;
  print('Single value: $singleValue');
}

// ❌ More dangerous patterns in real code
class UserService {
  final List<String> _activeUsers = [];

  String getCurrentUser() {
    // LINT: Use firstOrNull to avoid StateError on empty lists.
    // Crashes if no active users!
    return _activeUsers.first;
  }

  String getLastActiveUser() {
    // LINT: Use lastOrNull to avoid StateError on empty lists.
    return _activeUsers.last;
  }

  DateTime getSessionStart() {
    // LINT: Use Clock.now() for testable time handling.
    return DateTime.now();
  }
}
