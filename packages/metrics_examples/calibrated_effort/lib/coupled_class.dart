/// Coupled class demonstrating calibrated effort (90 min per violation)
/// Decoupling is architectural work that takes longer

import 'dart:async';
import 'dart:collection';

class CoupledClass {
  final Duration timeout;
  final Queue<String> queue;
  final StreamController<String> controller;

  CoupledClass({
    required this.timeout,
    required this.queue,
    required this.controller,
  });

  void process(String item) {
    queue.add(item);
    controller.add(item);
  }

  void dispose() {
    controller.close();
  }
}
