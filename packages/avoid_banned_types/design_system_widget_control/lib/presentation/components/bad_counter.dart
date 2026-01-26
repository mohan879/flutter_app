// ❌ BAD: Using StatefulWidget in components folder
import 'package:flutter/material.dart';

// ❌ Violation: StatefulWidget in reusable component
class BadCounter extends StatefulWidget {
  @override
  _BadCounterState createState() => _BadCounterState();
}

class _BadCounterState extends State<BadCounter> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count: $_count'),
        ElevatedButton(
          onPressed: () => setState(() => _count++),
          child: const Text('Increment'),
        ),
      ],
    );
  }
}
