import 'package:flutter_riverpod/flutter_riverpod.dart';

/// --- avoid-nullable-async-value-pattern ---
///
/// When using pattern matching on AsyncValue with nullable types,
/// the `value?` pattern can fail unexpectedly. If the actual value
/// is `null`, the pattern won't match even when data is loaded.
/// Use `hasValue: true` for nullable types instead.

// Example provider that can return null
final nullableDataProvider = FutureProvider<int?>((ref) async {
  await Future<void>.delayed(const Duration(seconds: 1));
  return null; // This is a valid loaded value!
});

final nonNullableDataProvider = FutureProvider<int>((ref) async {
  await Future<void>.delayed(const Duration(seconds: 1));
  return 42;
});

// BAD: Unsafe pattern on nullable AsyncValue
void badPatternMatching(AsyncValue<int?> asyncValue) {
  switch (asyncValue) {
    // 💥 If the actual value is null, this won't match even when data is loaded!
    case AsyncValue<int?>(:final value?):
      print('Value: $value');
    case AsyncValue<int?>(hasError: true, :final error):
      print('Error: $error');
    default:
      print('Loading...'); // This will incorrectly show when value is null!
  }
}

// GOOD: Use hasValue for nullable types
void goodPatternMatching(AsyncValue<int?> asyncValue) {
  switch (asyncValue) {
    // ✅ Explicitly check hasValue for nullable types
    case AsyncValue<int?>(:final value, hasValue: true):
      print('Value: $value'); // value can be null here, and that's OK
    case AsyncValue<int?>(hasError: true, :final error):
      print('Error: $error');
    default:
      print('Loading...');
  }
}

// For non-nullable types, value? pattern is fine
void nonNullablePatternMatching(AsyncValue<int> asyncValue) {
  switch (asyncValue) {
    // ✅ For non-nullable types, this pattern is safe
    case AsyncValue<int>(:final value?):
      print('Value: $value');
    case AsyncValue<int>(hasError: true, :final error):
      print('Error: $error');
    default:
      print('Loading...');
  }
}

// GOOD: Using when() method is also safe
void usingWhenMethod(AsyncValue<int?> asyncValue) {
  // ✅ The when() method handles nullability correctly
  asyncValue.when(
    data: (value) => print('Value: $value'), // value can be null
    loading: () => print('Loading...'),
    error: (error, stack) => print('Error: $error'),
  );
}

// GOOD: Using maybeWhen() for partial handling
void usingMaybeWhen(AsyncValue<int?> asyncValue) {
  // ✅ maybeWhen is also safe
  asyncValue.maybeWhen(
    data: (value) => print('Value: $value'),
    orElse: () => print('Loading or error'),
  );
}
