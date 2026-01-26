// Simulated types
import 'dart:async';

class Timer {
  Timer(Duration duration, void Function() callback);

  static Timer periodic(Duration duration, void Function(Timer) callback) {
    return Timer(duration, () {});
  }

  void cancel() {}
}
