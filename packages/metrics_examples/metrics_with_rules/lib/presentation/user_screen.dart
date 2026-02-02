/// Presentation layer - VIOLATES architecture rule by importing data directly
/// Also has high coupling which correlates with the boundary violation

import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:math';
import 'dart:typed_data';

// This import violates avoid-banned-imports rule!
import '../data/user_repository.dart';

class UserScreen {
  // High coupling - correlates with boundary violation (>8 types = violation)
  final UserRepository repository; // Direct dependency on data layer!
  final Map<String, dynamic> config;
  final List<String> filters;
  final Queue<String> queue;
  final JsonCodec codec;
  final File? cacheFile;
  final StreamController<String> controller;
  final Completer<void> completer;
  final Timer? refreshTimer;
  final Random random;
  final Uint8List? buffer;
  final Isolate? isolate;

  UserScreen({
    required this.repository, // Should use domain layer instead
    required this.config,
    required this.filters,
    required this.queue,
    required this.codec,
    this.cacheFile,
    required this.controller,
    required this.completer,
    this.refreshTimer,
    required this.random,
    this.buffer,
    this.isolate,
  });

  Future<void> loadUser(String id) async {
    // Direct call to data layer - architectural violation
    final user = await repository.fetchUser(id);
    controller.add(codec.encode(user));
  }
}
