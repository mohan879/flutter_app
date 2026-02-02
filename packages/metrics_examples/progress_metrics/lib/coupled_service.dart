/// Coupled service for tracking coupling-between-object-classes
/// With threshold: unset, all values are collected but no violations triggered

import 'dart:async';
import 'dart:collection';

class CoupledService {
  final StreamController<String> _controller = StreamController();
  final Queue<String> _queue = Queue();
  final List<String> _items = [];

  Stream<String> get stream => _controller.stream;

  void addItem(String item) {
    _items.add(item);
    _queue.add(item);
    _controller.add(item);
  }

  void dispose() {
    _controller.close();
  }
}
