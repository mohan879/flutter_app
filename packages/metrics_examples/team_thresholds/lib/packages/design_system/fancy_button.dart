/// Design system package - strictest threshold (6 CBO)
/// These components are used everywhere - must be minimal

import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:math';
import 'dart:typed_data';

class Button {
  final Duration animationDuration;
  final Map<String, dynamic> theme;
  final List<String> variants;
  final Queue<void Function()> callbacks;
  final Random random;
  final JsonCodec codec;
  final Isolate? isolate;
  final Uint8List? iconData;

  Button({
    required this.animationDuration,
    required this.theme,
    required this.variants,
    required this.callbacks,
    required this.random,
    required this.codec,
    this.isolate,
    this.iconData,
  });

  void press() {
    // Simple button logic
    for (final callback in callbacks) {
      callback();
    }
  }
}
