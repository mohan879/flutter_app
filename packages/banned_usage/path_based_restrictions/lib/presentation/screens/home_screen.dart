import '../../types.dart';

// ❌ Bad: Using setState in screens instead of state management

class HomeScreen {
  int _counter = 0;

  void _incrementCounter() {
    // LINT: Use BLoC or other state management instead of setState in screens.
    setState(() {
      _counter++;
    });
  }

  void _resetCounter() {
    // LINT: Use BLoC or other state management instead of setState in screens.
    setState(() {
      _counter = 0;
    });
  }
}
