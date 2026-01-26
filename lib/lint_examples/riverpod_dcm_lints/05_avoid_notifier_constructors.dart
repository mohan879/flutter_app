import 'package:flutter_riverpod/flutter_riverpod.dart';

/// --- avoid-notifier-constructors ---
///
/// Logic in notifier constructors runs before Riverpod initializes
/// the notifier. Using ref/state in constructors will cause errors.
/// Always put initialization logic in the `build` method instead.

// BAD: Logic in constructor
class CounterBad extends Notifier<int> {
  int _initialValue = 0;

  // 💥 Constructor logic runs before Riverpod initializes the notifier!
  CounterBad() {
    _initialValue = 1; // This can cause initialization issues
    // state = 1; // This would throw an error!
    // ref.read(...); // This would also throw!
  }

  @override
  int build() {
    return _initialValue;
  }

  void increment() {
    state++;
  }
}

final counterBadProvider = NotifierProvider<CounterBad, int>(CounterBad.new);

// GOOD: Logic in build method
class CounterGood extends Notifier<int> {
  @override
  int build() {
    // ✅ All initialization happens in build method
    // ref and state are safely available here
    return 0;
  }

  void increment() {
    state++;
  }
}

final counterGoodProvider = NotifierProvider<CounterGood, int>(CounterGood.new);

// GOOD: If you need constructor parameters, use family providers
class CounterWithParam extends FamilyNotifier<int, int> {
  @override
  int build(int initialValue) {
    // ✅ Parameters are passed through the family mechanism
    return initialValue;
  }

  void increment() {
    state++;
  }
}

final counterWithParamProvider =
    NotifierProvider.family<CounterWithParam, int, int>(CounterWithParam.new);

// Usage example:
// ref.watch(counterWithParamProvider(10)); // Starts at 10
