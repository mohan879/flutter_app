import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta/meta.dart';

/// --- avoid-public-notifier-properties ---
///
/// Public properties on notifiers bypass Riverpod's state management.
/// The `state` setter properly notifies listeners, but public properties
/// don't go through this mechanism, leading to missed updates.

// BAD: Public property bypasses state management
class MyNotifierBad extends Notifier<int> {
  int _privateGetter = 0;

  // 💥 LINT: Avoid creating public properties for notifiers.
  //    Try moving them to the 'state' property.
  int get publicGetter => _privateGetter;

  @override
  int build() => 0;
}

final myNotifierBadProvider = NotifierProvider<MyNotifierBad, int>(
  MyNotifierBad.new,
);

// GOOD: Everything goes through state
@immutable
final class MyState {
  final int left;
  final int right;

  const MyState(this.left, this.right);

  MyState copyWith({int? left, int? right}) {
    return MyState(left ?? this.left, right ?? this.right);
  }
}

class MyNotifierGood extends Notifier<MyState> {
  @override
  MyState build() => const MyState(0, 1);

  // ✅ All changes go through state, listeners are notified
  void updateLeft(int value) {
    state = state.copyWith(left: value);
  }

  void updateRight(int value) {
    state = state.copyWith(right: value);
  }
}

final myNotifierGoodProvider = NotifierProvider<MyNotifierGood, MyState>(
  MyNotifierGood.new,
);

// GOOD: If you need computed values, expose them through the state
@immutable
final class ComputedState {
  final int count;

  const ComputedState(this.count);

  // ✅ Computed properties on the state object are fine
  int get doubled => count * 2;
  bool get isEven => count % 2 == 0;
}

class ComputedNotifier extends Notifier<ComputedState> {
  @override
  ComputedState build() => const ComputedState(0);

  void increment() {
    state = ComputedState(state.count + 1);
  }
}

final computedNotifierProvider =
    NotifierProvider<ComputedNotifier, ComputedState>(ComputedNotifier.new);
