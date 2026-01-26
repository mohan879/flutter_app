import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// --- use-ref-read-synchronously ---
///
/// Using `ref.read` after an async gap in a ConsumerState without
/// checking `mounted` can lead to crashes if the widget was unmounted
/// during the async operation.

final someProvider = StateProvider<int>((ref) => 0);

Future<void> fetch() async {
  await Future<void>.delayed(const Duration(seconds: 1));
}

// BAD: ref.read after async gap without mounted check
class HomeConsumerStatefulWidgetBad extends ConsumerStatefulWidget {
  const HomeConsumerStatefulWidgetBad({super.key});

  @override
  ConsumerState<HomeConsumerStatefulWidgetBad> createState() =>
      _HomeConsumerStateBad();
}

class _HomeConsumerStateBad
    extends ConsumerState<HomeConsumerStatefulWidgetBad> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        ref.read(someProvider);
        await fetch();
        // 💥 Widget might be unmounted!
        ref.read(someProvider);
      },
      child: const Text('Bad: No mounted check'),
    );
  }
}

// GOOD: Check mounted before ref.read after async gap
class HomeConsumerStatefulWidgetGood extends ConsumerStatefulWidget {
  const HomeConsumerStatefulWidgetGood({super.key});

  @override
  ConsumerState<HomeConsumerStatefulWidgetGood> createState() =>
      _HomeConsumerStateGood();
}

class _HomeConsumerStateGood
    extends ConsumerState<HomeConsumerStatefulWidgetGood> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        ref.read(someProvider);
        await fetch();
        if (mounted) {
          ref.read(someProvider); // ✅ Safe after mounted check
        }
      },
      child: const Text('Good: With mounted check'),
    );
  }
}

// Example App
class RiverpodRefReadSyncApp extends StatelessWidget {
  const RiverpodRefReadSyncApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              HomeConsumerStatefulWidgetBad(),
              SizedBox(height: 20),
              HomeConsumerStatefulWidgetGood(),
            ],
          ),
        ),
      ),
    );
  }
}
