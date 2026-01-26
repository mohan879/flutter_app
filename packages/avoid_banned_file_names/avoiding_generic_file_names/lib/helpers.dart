// ❌ Generic name - should be validation_helpers.dart or format_helpers.dart
bool isValidEmail(String email) => email.contains('@');

String formatDate(DateTime date) => '${date.year}-${date.month}-${date.day}';
