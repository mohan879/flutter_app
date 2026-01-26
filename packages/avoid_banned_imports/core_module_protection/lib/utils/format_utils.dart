// ❌ VIOLATION: Utils importing Flutter
import 'package:flutter/material.dart';

/// Format utilities that incorrectly depend on Flutter
class FormatUtils {
  static String formatCurrency(double amount) {
    return '\$${amount.toStringAsFixed(2)}';
  }

  // This method uses Flutter types - should not be in utils
  static Color getColorFromHex(String hex) {
    return Color(int.parse(hex.replaceFirst('#', '0xFF')));
  }
}
