/// Utility functions - strict threshold (30 SLOC)
extension StringUtils on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String truncate(int maxLength) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}...';
  }

  bool isValidEmail() {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  }

  bool isValidPhone() {
    return RegExp(r'^\+?[\d\s-]{10,}$').hasMatch(this);
  }

  String toSlug() {
    return toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9]+'), '-')
        .replaceAll(RegExp(r'^-|-$'), '');
  }

  // Adding more methods to exceed 30 SLOC threshold
  String reverse() {
    return split('').reversed.join();
  }

  String removeWhitespace() {
    return replaceAll(RegExp(r'\s+'), '');
  }

  List<String> toWords() {
    return split(RegExp(r'\s+'));
  }

  int wordCount() {
    return toWords().length;
  }

  String mask([int visibleChars = 4]) {
    if (length <= visibleChars) return this;
    return '${'*' * (length - visibleChars)}${substring(length - visibleChars)}';
  }
}
