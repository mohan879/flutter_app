/// Nested widget for tracking widgets-nesting-level
/// With threshold: unset, all values are collected but no violations triggered

import 'package:flutter/material.dart';

class NestedWidget extends StatelessWidget {
  const NestedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: const Text('Nested Content'),
                subtitle: Container(child: const Text('Deep nesting')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
