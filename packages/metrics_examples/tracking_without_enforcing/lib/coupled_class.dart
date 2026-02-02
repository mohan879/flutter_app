/// Coupled class demonstrating tracked metrics (coupling-between-object-classes: unset)
/// This file shows that tracked metrics appear in reports but don't trigger violations

import 'dart:async';

class CoupledClass {
  final StreamController<String> _controller = StreamController();
  final Duration timeout;
  final List<String> items;

  CoupledClass({required this.timeout, required this.items});

  Stream<String> get stream => _controller.stream;

  void addItem(String item) {
    items.add(item);
    _controller.add(item);
  }

  void dispose() {
    _controller.close();
  }
}
