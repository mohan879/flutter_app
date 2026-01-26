import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// --- avoid-unnecessary-consumer-widgets ---
///
/// Extending ConsumerWidget or ConsumerStatefulWidget when you don't
/// actually use `ref` adds unnecessary overhead. If you don't need
/// to read/watch providers, use regular StatelessWidget or StatefulWidget.

final helloWorldProvider = Provider<String>((ref) => 'Hello, World!');
final counterProvider = StateProvider<int>((ref) => 0);

// BAD: ConsumerWidget without using ref
class HomeConsumerWidgetBad extends ConsumerWidget {
  const HomeConsumerWidgetBad({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 💥 ref is never used! This widget doesn't need to be a ConsumerWidget
    return const Text('Hello');
  }
}

// GOOD: Regular StatelessWidget when ref isn't needed
class HomeWidgetGood extends StatelessWidget {
  const HomeWidgetGood({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ No unnecessary ConsumerWidget overhead
    return const Text('Hello');
  }
}

// BAD: ConsumerStatefulWidget without using ref
class StatefulBad extends ConsumerStatefulWidget {
  const StatefulBad({super.key});

  @override
  ConsumerState<StatefulBad> createState() => _StatefulBadState();
}

class _StatefulBadState extends ConsumerState<StatefulBad> {
  int _localCounter = 0;

  @override
  Widget build(BuildContext context) {
    // 💥 ref is never used in this widget!
    return Text('Local: $_localCounter');
  }
}

// GOOD: Regular StatefulWidget when ref isn't needed
class StatefulGood extends StatefulWidget {
  const StatefulGood({super.key});

  @override
  State<StatefulGood> createState() => _StatefulGoodState();
}

class _StatefulGoodState extends State<StatefulGood> {
  int _localCounter = 0;

  @override
  Widget build(BuildContext context) {
    // ✅ No unnecessary ConsumerStatefulWidget overhead
    return Text('Local: $_localCounter');
  }
}

// GOOD: If you need ref only in a specific part, use Consumer widget
class PartialConsumerGood extends StatelessWidget {
  const PartialConsumerGood({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Static header'), // No provider access needed
        const Divider(),
        // ✅ Only wrap the part that needs ref
        Consumer(
          builder: (context, ref, child) {
            final value = ref.watch(helloWorldProvider);
            return Text(value);
          },
        ),
      ],
    );
  }
}

// GOOD: ConsumerWidget when ref is actually used
class ProperConsumerWidget extends ConsumerWidget {
  const ProperConsumerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ✅ ref is used, so ConsumerWidget is appropriate
    final message = ref.watch(helloWorldProvider);
    final counter = ref.watch(counterProvider);

    return Column(
      children: [
        Text(message),
        Text('Counter: $counter'),
        ElevatedButton(
          onPressed: () => ref.read(counterProvider.notifier).state++,
          child: const Text('Increment'),
        ),
      ],
    );
  }
}

// GOOD: Using hooks_riverpod for even more flexibility
// With hooks_riverpod, you can use useRef() only when needed:
// class HooksExample extends HookConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final value = ref.watch(helloWorldProvider);
//     return Text(value);
//   }
// }

// Example App
class RiverpodUnnecessaryConsumerApp extends StatelessWidget {
  const RiverpodUnnecessaryConsumerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              HomeConsumerWidgetBad(), // Has overhead but no benefit
              HomeWidgetGood(), // Correct!
              Divider(),
              PartialConsumerGood(),
              Divider(),
              ProperConsumerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
