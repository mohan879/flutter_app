import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// --- avoid-assigning-notifiers ---
///
/// Assigning notifiers to variables can lead to stale references.
/// After an async gap, the notifier might be unmounted, but you're
/// still holding a reference to the old instance. Always get a fresh
/// reference after async operations.

class CounterNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void increment() => state++;
}

final counterProvider = NotifierProvider<CounterNotifier, int>(
  CounterNotifier.new,
);

// BAD: Stale notifier reference after async gap
class HomeConsumerStateBad extends ConsumerStatefulWidget {
  const HomeConsumerStateBad({super.key});

  @override
  ConsumerState<HomeConsumerStateBad> createState() => _HomeConsumerStateBad();
}

class _HomeConsumerStateBad extends ConsumerState<HomeConsumerStateBad> {
  Future<void> someAsyncOperation() async {
    await Future<void>.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // 💥 This reference can become stale!
        final notifier = ref.read(counterProvider.notifier);

        await someAsyncOperation();

        notifier.increment(); // 💥 Notifier might be unmounted!
      },
      child: const Text('Bad: Stale notifier'),
    );
  }
}

// GOOD: Always get fresh reference after async gap
class HomeConsumerStateGood extends ConsumerStatefulWidget {
  const HomeConsumerStateGood({super.key});

  @override
  ConsumerState<HomeConsumerStateGood> createState() =>
      _HomeConsumerStateGood();
}

class _HomeConsumerStateGood extends ConsumerState<HomeConsumerStateGood> {
  Future<void> someAsyncOperation() async {
    await Future<void>.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // Call method directly without storing reference
        ref.read(counterProvider.notifier).increment();

        await someAsyncOperation();

        // ✅ Get fresh reference after async gap
        if (mounted) {
          ref.read(counterProvider.notifier).increment();
        }
      },
      child: const Text('Good: Fresh reference'),
    );
  }
}

// GOOD: Always call methods inline without storing reference
class SyncExampleGood extends ConsumerWidget {
  const SyncExampleGood({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        // ✅ Call methods inline — no stored reference
        ref.read(counterProvider.notifier).increment();
        ref.read(counterProvider.notifier).increment();
      },
      child: const Text('Good: Inline calls'),
    );
  }
}

// Example App
class RiverpodAssigningNotifiersApp extends StatelessWidget {
  const RiverpodAssigningNotifiersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              HomeConsumerStateBad(),
              SizedBox(height: 20),
              HomeConsumerStateGood(),
              SizedBox(height: 20),
              SyncExampleGood(),
            ],
          ),
        ),
      ),
    );
  }
}
