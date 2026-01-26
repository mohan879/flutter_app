// ✅ Specific name - clearly indicates purpose
extension StringExtensions on String {
  String capitalize() =>
      isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';
}
