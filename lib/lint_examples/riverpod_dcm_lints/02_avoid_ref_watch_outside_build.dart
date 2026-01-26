import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// --- avoid-ref-watch-outside-build ---
///
/// Using `ref.watch` outside of `build` creates wasteful subscriptions.
/// The subscription won't trigger meaningful rebuilds since the callback
/// has already finished executing.

final counterProvider = StateProvider<int>((ref) => 0);

// BAD: Using watch outside build — wasteful subscription!
class HomeConsumerWidgetBad extends ConsumerWidget {
  const HomeConsumerWidgetBad({super.key});

  void callback(WidgetRef ref) {
    // 💥 Using watch outside build — wasteful subscription!
    final value = ref.watch(counterProvider);
    debugPrint('Value: $value');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Column(
      children: [
        Text('$counter'),
        ElevatedButton(
          onPressed: () => callback(ref),
          child: const Text('Bad Callback'),
        ),
      ],
    );
  }
}

// GOOD: Using read in callbacks — no unnecessary subscription
class HomeConsumerWidgetGood extends ConsumerWidget {
  const HomeConsumerWidgetGood({super.key});

  void callback(WidgetRef ref) {
    // ✅ Using read in callback — no unnecessary subscription
    final value = ref.read(counterProvider);
    debugPrint('Value: $value');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Column(
      children: [
        Text('$counter'),
        ElevatedButton(
          onPressed: () => callback(ref),
          child: const Text('Good Callback'),
        ),
      ],
    );
  }
}

// Example App
class RiverpodWatchOutsideBuildApp extends StatelessWidget {
  const RiverpodWatchOutsideBuildApp({super.key});

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
