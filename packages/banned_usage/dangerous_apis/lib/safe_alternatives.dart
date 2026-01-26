/// Safe alternatives for dangerous APIs

class Clock {
  static DateTime now() {
    // In production: returns DateTime.now()
    // In tests: returns mocked time
    return DateTime.now();
  }
}

extension SafeListExtension<T> on List<T> {
  T? get firstOrNull => isEmpty ? null : first;
  T? get lastOrNull => isEmpty ? null : last;
  T? get singleOrNull => length == 1 ? single : null;
}
