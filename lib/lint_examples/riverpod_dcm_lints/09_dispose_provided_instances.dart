import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// --- dispose-provided-instances ---
///
/// When creating disposable instances in providers, you must register
/// cleanup via `ref.onDispose`. Failing to do so causes memory leaks.
/// The Riverpod source recommends registering onDispose immediately
/// after creating each disposable object.

class DisposableService {
  bool _disposed = false;

  void doWork() {
    if (_disposed) {
      throw StateError('Service has been disposed!');
    }
    // Do some work
  }

  void dispose() {
    _disposed = true;
    // Clean up resources
  }
}

class AnotherDisposable {
  void dispose() {
    // Clean up
  }
}

// BAD: dispose() is never called — Memory leak!
final badServiceProvider = Provider.autoDispose<DisposableService>((ref) {
  // 💥 Memory leak! dispose() is never called
  final instance = DisposableService();
  return instance;
});

// GOOD: dispose() is called via onDispose
final goodServiceProvider = Provider.autoDispose<DisposableService>((ref) {
  final instance = DisposableService();

  ref.onDispose(instance.dispose); // ✅ Cleanup happens

  return instance;
});

// GOOD: Multiple disposables — register each one immediately
final multipleDisposablesProvider = Provider.autoDispose<DisposableService>((
  ref,
) {
  // ✅ Register dispose immediately after creation
  final service1 = DisposableService();
  ref.onDispose(service1.dispose);

  // ✅ Same for the second disposable
  final service2 = AnotherDisposable();
  ref.onDispose(service2.dispose);

  return service1;
});

// BAD: Single onDispose with multiple disposables
final badMultipleProvider = Provider.autoDispose<DisposableService>((ref) {
  final service1 = DisposableService();
  final service2 = AnotherDisposable();

  // 💥 If service1.dispose() throws, service2 won't be disposed!
  ref.onDispose(() {
    service1.dispose();
    service2.dispose();
  });

  return service1;
});

// GOOD: Using keepAlive with proper disposal
final keepAliveProvider = Provider.autoDispose<DisposableService>((ref) {
  final instance = DisposableService();

  // Keep the provider alive until explicitly invalidated
  final link = ref.keepAlive();

  ref.onDispose(() {
    instance.dispose();
    link.close(); // ✅ explicitly close keepAlive link
  });

  return instance;
});

// GOOD: StreamController example
final streamProvider = Provider.autoDispose<Stream<int>>((ref) {
  final controller = StreamController<int>();

  // ✅ Close the controller when disposed
  ref.onDispose(controller.close);

  // Emit some values
  controller.add(1);
  controller.add(2);

  return controller.stream;
});
