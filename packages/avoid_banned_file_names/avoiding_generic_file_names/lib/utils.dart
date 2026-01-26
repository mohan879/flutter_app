// ❌ Generic name - should be string_extensions.dart or date_utils.dart
String capitalize(String s) =>
    s.isEmpty ? s : '${s[0].toUpperCase()}${s.substring(1)}';

int max(int a, int b) => a > b ? a : b;
