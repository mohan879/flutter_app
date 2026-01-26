import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// --- avoid-calling-notifier-members-inside-build ---
///
/// The `build` method can be invoked frequently, and calling notifier
/// methods inside it can lead to unwanted side effects. Side effects
/// should be triggered by user interactions (callbacks), not by builds.

class Counter extends Notifier<int> {
  @override
  int build() => 0;

  void increment() {
    state++;
    debugPrint('Incremented! New value: $state');
  }

  void reset() {
    state = 0;
  }
}

final counterProvider = NotifierProvider<Counter, int>(Counter.new);

// BAD: Side effect in build — called on every rebuild!
class HomeConsumerStateBad extends ConsumerStatefulWidget {
  const HomeConsumerStateBad({super.key});

  @override
  ConsumerState<HomeConsumerStateBad> createState() => _HomeConsumerStateBad();
}

class _HomeConsumerStateBad extends ConsumerState<HomeConsumerStateBad> {
  @override
  Widget build(BuildContext context) {
    final counter = ref.watch(counterProvider.notifier);

    // 💥 Calling notifier member inside build causes side effects
    counter.increment();

    return Text('Count: ${ref.watch(counterProvider)}');
  }
}

// GOOD: Side effects in callbacks
class HomeConsumerStateGood extends ConsumerStatefulWidget {
  const HomeConsumerStateGood({super.key});

  @override
  ConsumerState<HomeConsumerStateGood> createState() =>
      _HomeConsumerStateGood();
}

class _HomeConsumerStateGood extends ConsumerState<HomeConsumerStateGood> {
  @override
  Widget build(BuildContext context) {
    final count = ref.watch(counterProvider);

    return Column(
      children: [
        Text('Count: $count'),
        ElevatedButton(
          // ✅ Called only on user interaction
          onPressed: () => ref.read(counterProvider.notifier).increment(),
          child: const Text('Increment'),
        ),
      ],
    );
  }
}

// GOOD: Using ref.listen for side effects based on state changes
class ListenExample extends ConsumerStatefulWidget {
  const ListenExample({super.key});

  @override
  ConsumerState<ListenExample> createState() => _ListenExampleState();
}

class _ListenExampleState extends ConsumerState<ListenExample> {
  @override
  Widget build(BuildContext context) {
    // ✅ Use listen for side effects based on state changes
    ref.listen<int>(counterProvider, (previous, next) {
      if (next == 10) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Reached 10!')));
      }
    });

    final count = ref.watch(counterProvider);
    return Text('Count: $count');
  }
}

// Example App
class RiverpodNotifierMembersApp extends StatelessWidget {
  const RiverpodNotifierMembersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              // HomeConsumerStateBad(), // Don't run this - it causes infinite loop!
              HomeConsumerStateGood(),
            ],
          ),
        ),
      ),
    );
  }
}
