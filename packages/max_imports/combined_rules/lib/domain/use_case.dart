// Domain layer file that VIOLATES avoid-banned-imports rule
// LINT: Domain layer should not import Flutter

import 'dart:async';

// ❌ This import violates the architecture rule
// Domain layer should be pure Dart with no Flutter dependencies
import 'package:flutter/material.dart';

/// A use case that incorrectly depends on Flutter.
/// Domain layer should only contain business logic with no UI dependencies.
class GetUserProfileUseCase {
  // ❌ Using BuildContext in domain - architecture violation
  Future<String> execute(BuildContext context) async {
    // Business logic shouldn't know about BuildContext
    await Future.delayed(const Duration(milliseconds: 100));
    return 'User Profile';
  }
}

/// Another use case with Flutter dependency
class ShowNotificationUseCase {
  // ❌ Using SnackBar in domain - architecture violation
  void execute(ScaffoldMessengerState messenger, String message) {
    messenger.showSnackBar(SnackBar(content: Text(message)));
  }
}
