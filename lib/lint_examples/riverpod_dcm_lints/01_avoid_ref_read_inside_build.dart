import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// --- avoid-ref-read-inside-build ---
///
/// Using `ref.read` inside `build` doesn't subscribe to changes.
/// The widget won't rebuild when the provider's value changes.

final counterProvider = StateProvider<int>((ref) => 0);

// BAD: Widget won't update when counter changes!
class HomeConsumerWidgetBad extends ConsumerWidget {
  const HomeConsumerWidgetBad({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 💥 Using read inside build — no subscription!
    final counter = ref.read(counterProvider);

    return Text('$counter');
  }
}

// GOOD: Widget updates when counter changes
class HomeConsumerWidgetGood extends ConsumerWidget {
  const HomeConsumerWidgetGood({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ✅ Using watch inside build — subscribed to changes!
    final counter = ref.watch(counterProvider);

    return Text('$counter');
  }
}

// Example App
class RiverpodReadInsideBuildApp extends StatelessWidget {
  const RiverpodReadInsideBuildApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              const HomeConsumerWidgetBad(),
              const HomeConsumerWidgetGood(),
              Consumer(
                builder: (context, ref, _) {
                  return ElevatedButton(
                    onPressed: () => ref.read(counterProvider.notifier).state++,
                    child: const Text('Increment'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
