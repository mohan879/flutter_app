// ❌ BAD: Domain entity using Flutter types
import 'package:flutter/material.dart';

/// Domain entity should be pure Dart - no Flutter dependencies
class UserEntity {
  final String name;
  final int age;

  UserEntity({required this.name, required this.age});

  // ❌ Violation: Widget type in domain layer
  Widget toWidget() {
    return Text(name);
  }

  // ❌ Violation: BuildContext in domain layer
  void showInContext(BuildContext context) {
    // Domain shouldn't know about UI context
  }

  // ❌ Violation: Color type in domain layer
  Color getStatusColor() {
    return age > 18 ? Colors.green : Colors.red;
  }
}
