import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:math';
import 'dart:typed_data';

/// DI setup code - tracking only with threshold: unset in entries
/// High coupling is expected here - we're wiring everything together

class InjectionContainer {
  final Map<Type, Object> _services = {};
  final List<Object> _singletons = [];
  final Queue<Future<void>> _initQueue = Queue();
  final StreamController<Object> _eventController = StreamController();

  // DI containers naturally have high coupling
  // With threshold: unset in entries, this is tracked but doesn't trigger violations

  late final Duration timeout;
  late final Random random;
  late final JsonCodec codec;
  late final Uint8List buffer;
  late final File configFile;
  late final Isolate? workerIsolate;

  void register<T extends Object>(T service) {
    _services[T] = service;
    _singletons.add(service);
  }

  T get<T extends Object>() {
    final service = _services[T];
    if (service == null) {
      throw Exception('Service not registered: \$T');
    }
    return service as T;
  }

  Future<void> initialize() async {
    timeout = const Duration(seconds: 30);
    random = Random();
    codec = const JsonCodec();
    buffer = Uint8List(1024);
    configFile = File('config.json');

    for (final init in _initQueue) {
      await init;
    }
  }

  void dispose() {
    _eventController.close();
    workerIsolate?.kill();
  }
}
