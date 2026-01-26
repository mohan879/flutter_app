import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// --- use-ref-and-state-synchronously ---
///
/// Warns when a notifier's `ref` or `state` are called past an await point
/// (also known as asynchronous gap).
///
/// Using `ref` or `state` after an async gap will lead to `UnmountedRefException`
/// if the notifier is already unmounted.
///
/// Try checking for `ref.mounted` before using `ref` or `state`.

// -------------------------------------------------------------------------
// BAD: Using state after async gap without checking ref.mounted
// -------------------------------------------------------------------------
class CountNotifierBad extends Notifier<int> {
  @override
  int build() => 0;

  Future<void> incrementDelayed() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    // 💥 LINT: Avoid accessing 'ref' or 'state' past an await point
    //          without checking if the ref is mounted.
    state += 1;
  }
}

final countNotifierBadProvider = NotifierProvider<CountNotifierBad, int>(
  CountNotifierBad.new,
);

// -------------------------------------------------------------------------
// GOOD: Check disposal state before using state after async gap
// -------------------------------------------------------------------------
class CountNotifierGood extends Notifier<int> {
  @override
  int build() => 0;

  Future<void> incrementDelayed() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    // ✅ Check mounted before using state
    if (!ref.mounted) return;
    state += 1;
  }
}

final countNotifierGoodProvider = NotifierProvider<CountNotifierGood, int>(
  CountNotifierGood.new,
);

// Example widget showing the problem
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
    child: const Text('show dialog'),
    onTap: () => showDialog(
      context: context,
      builder: (context) => Consumer(
        builder: (context, ref, _) => AlertDialog(
          actions: [
            GestureDetector(
              child: const Text('increment and close'),
              onTap: () {
                // User taps, triggers async operation, then closes dialog
                // The notifier may be unmounted before incrementDelayed completes!
              },
            ),
          ],
        ),
      ),
    ),
  );
}
