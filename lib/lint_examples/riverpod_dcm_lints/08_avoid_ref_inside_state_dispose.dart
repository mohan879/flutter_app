import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// --- avoid-ref-inside-state-dispose ---
///
/// Using `ref` inside the `dispose` method of a ConsumerState is dangerous
/// because providers might already be disposed. The error message from
/// Riverpod is clear: "You tried to use Ref inside `onDispose` or other
/// life-cycles. This is not supported, as the provider is already being disposed."

class SomeService {
  void doSomething() {}
  void cleanup() {}
}

final serviceProvider = Provider<SomeService>((ref) => SomeService());

// BAD: Using ref in dispose
class SomeWidgetBad extends ConsumerStatefulWidget {
  const SomeWidgetBad({super.key});

  @override
  ConsumerState<SomeWidgetBad> createState() => _SomeStateBad();
}

class _SomeStateBad extends ConsumerState<SomeWidgetBad> {
  @override
  void dispose() {
    // 💥 Providers might already be disposed!
    ref.read(serviceProvider).doSomething();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final service = ref.watch(serviceProvider);
    return Text('Service: $service');
  }
}

// GOOD: Don't use ref in dispose
class SomeWidgetGood extends ConsumerStatefulWidget {
  const SomeWidgetGood({super.key});

  @override
  ConsumerState<SomeWidgetGood> createState() => _SomeStateGood();
}

class _SomeStateGood extends ConsumerState<SomeWidgetGood> {
  @override
  void dispose() {
    // ✅ Clean up without using ref
    // If you need to clean up, do it in other lifecycle methods
    // or use ref.onDispose in the provider itself
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final service = ref.watch(serviceProvider);
    return Text('Service: $service');
  }
}

// GOOD: If you need local resources, manage them separately
class SomeWidgetWithLocalResource extends ConsumerStatefulWidget {
  const SomeWidgetWithLocalResource({super.key});

  @override
  ConsumerState<SomeWidgetWithLocalResource> createState() =>
      _SomeStateWithLocalResource();
}

class _SomeStateWithLocalResource
    extends ConsumerState<SomeWidgetWithLocalResource> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    // ✅ Clean up local resources that you own
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(controller: _controller);
  }
}

// GOOD: Use ref.onDispose in providers for cleanup
final serviceWithCleanupProvider = Provider<SomeService>((ref) {
  final service = SomeService();

  // ✅ Register cleanup in the provider itself
  ref.onDispose(() {
    service.cleanup();
  });

  return service;
});

// Example App
class RiverpodRefInDisposeApp extends StatelessWidget {
  const RiverpodRefInDisposeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: Scaffold(
          body: Column(
            children: const [
              SomeWidgetBad(),
              SomeWidgetGood(),
              SomeWidgetWithLocalResource(),
            ],
          ),
        ),
      ),
    );
  }
}
