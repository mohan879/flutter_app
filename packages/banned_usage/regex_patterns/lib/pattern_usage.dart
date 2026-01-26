import 'banned_methods.dart';

// ❌ Bad: Using methods that match banned patterns

void developmentCode() {
  // LINT: Remove debug methods before production release.
  debugPrint('Debug message');

  // LINT: Remove debug methods before production release.
  debugLog('Debug log entry');

  // LINT: Remove debug methods before production release.
  debugDump({'key': 'value'});
}

void securityRisks() {
  // LINT: Unsafe methods should not be used in production code.
  runUnsafe(() => print('Risky'));

  // LINT: Unsafe methods should not be used in production code.
  unsafeOperation();

  // LINT: Unsafe methods should not be used in production code.
  executeUnsafeCode();
}

void deprecatedCalls() {
  // LINT: This deprecated method should be replaced with the new implementation.
  loginDeprecated('user@example.com', 'password');

  // LINT: This deprecated method should be replaced with the new implementation.
  fetchUserDeprecated('123');

  // LINT: This deprecated method should be replaced with the new implementation.
  saveDataDeprecated({'name': 'John'});
}

void listMutations() {
  final items = [1, 2, 3];

  // LINT: Mutating list methods are banned. Use immutable operations.
  items.clear();

  // LINT: Mutating list methods are banned. Use immutable operations.
  items.remove(1);

  // LINT: Mutating list methods are banned. Use immutable operations.
  items.removeAt(0);

  // LINT: Mutating list methods are banned. Use immutable operations.
  items.removeLast();

  // LINT: Mutating list methods are banned. Use immutable operations.
  items.removeWhere((e) => e > 2);
}
