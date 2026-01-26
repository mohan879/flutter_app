// ✅ GOOD: StatelessWidget with external state management
import 'package:flutter/material.dart';

class GoodCounter extends StatelessWidget {
  final int count;
  final VoidCallback onIncrement;

  const GoodCounter({
    super.key,
    required this.count,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count: $count'),
        ElevatedButton(onPressed: onIncrement, child: const Text('Increment')),
      ],
    );
  }
}
