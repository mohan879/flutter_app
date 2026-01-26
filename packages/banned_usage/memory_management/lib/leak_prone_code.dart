import 'dart:async';
import 'timer_types.dart' as types;

// ❌ Bad: Common memory leak patterns

class CounterWidget {
  int _counter = 0;

  void initState() {
    // LINT: Store Timer reference and cancel in dispose().
    types.Timer.periodic(Duration(seconds: 1), (timer) {
      _counter++;
      print('Counter: $_counter');
    });

    // Timer not stored, can't be canceled!
  }

  void dispose() {
    // Timer still running! Memory leak.
  }
}

class DataWidget {
  final _controller = StreamController<int>.broadcast();

  void initState() {
    // LINT: Store StreamSubscription and cancel in dispose().
    _controller.stream.listen((data) {
      print('Received: $data');
    });

    // Another listener without storing subscription
    // LINT: Store StreamSubscription and cancel in dispose().
    _controller.stream.listen((data) {
      print('Also received: $data');
    });
  }

  void dispose() {
    _controller.close();
    // Subscriptions still active! Memory leak.
  }
}

class PollingService {
  void startPolling() {
    // LINT: Store Timer reference and cancel in dispose().
    types.Timer.periodic(Duration(minutes: 5), (_) {
      _fetchData();
    });
  }

  void _fetchData() {
    print('Fetching data...');
  }

  void stopPolling() {
    // Can't stop - timer reference not stored!
  }
}
