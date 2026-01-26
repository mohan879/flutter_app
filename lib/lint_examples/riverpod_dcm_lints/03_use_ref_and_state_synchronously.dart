import 'package:flutter_riverpod/flutter_riverpod.dart';

/// --- use-ref-and-state-synchronously ---
///
/// Using `ref` or `state` after an async gap without checking if the notifier
/// is still mounted can lead to `UnmountedRefException` crashes. During async
/// operations, the provider might rebuild or dispose, making the old ref invalid.
///
/// Note: In Riverpod 2.x, use `ref.exists(provider)` or handle exceptions.
/// In Riverpod 3.x+, use `ref.mounted` directly.

// BAD: Using state after async gap without any safety check
class CountNotifierBad extends AutoDisposeNotifier<int> {
  @override
  int build() => 0;

  Future<void> incrementDelayed() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    // 💥 The notifier might be disposed during the delay!
    // This can throw UnmountedRefException
    state += 1;
  }
}

final countNotifierBadProvider =
    NotifierProvider.autoDispose<CountNotifierBad, int>(CountNotifierBad.new);

// GOOD: Use try-catch or ref.onDispose to cancel pending work
class CountNotifierGood extends AutoDisposeNotifier<int> {
  bool _disposed = false;

  @override
  int build() {
    ref.onDispose(() {
      _disposed = true;
    });
    return 0;
  }

  Future<void> incrementDelayed() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    // ✅ Check if disposed before using state
    if (!_disposed) {
      state += 1;
    }
  }
}

final countNotifierGoodProvider =
    NotifierProvider.autoDispose<CountNotifierGood, int>(CountNotifierGood.new);

// Another BAD example: Using ref.read after async gap
class AnotherNotifierBad extends AutoDisposeNotifier<int> {
  @override
  int build() => 0;

  Future<void> doSomething() async {
    final value = ref.read(countNotifierBadProvider);
    await Future<void>.delayed(const Duration(seconds: 1));
    // 💥 Provider might be disposed during delay!
    ref.read(countNotifierBadProvider);
    state = value;
  }
}

final anotherNotifierBadProvider =
    NotifierProvider.autoDispose<AnotherNotifierBad, int>(
      AnotherNotifierBad.new,
    );

// GOOD: Track disposal state and check before ref operations
class AnotherNotifierGood extends AutoDisposeNotifier<int> {
  bool _disposed = false;

  @override
  int build() {
    ref.onDispose(() {
      _disposed = true;
    });
    return 0;
  }

  Future<void> doSomething() async {
    final value = ref.read(countNotifierGoodProvider);
    await Future<void>.delayed(const Duration(seconds: 1));
    // ✅ Safe after checking disposal state
    if (!_disposed) {
      ref.read(countNotifierGoodProvider);
      state = value;
    }
  }
}

final anotherNotifierGoodProvider =
    NotifierProvider.autoDispose<AnotherNotifierGood, int>(
      AnotherNotifierGood.new,
    );
