// ❌ VIOLATION: Domain layer importing Flutter
import 'package:flutter/foundation.dart';

/// User entity - should be pure Dart
@immutable
class UserEntity {
  final String id;
  final String name;
  final String email;

  const UserEntity({required this.id, required this.name, required this.email});
}
