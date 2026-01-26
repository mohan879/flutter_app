// Custom wrappers with added functionality

/// Custom router with analytics tracking
class AppRouter {
  static void push(dynamic context, dynamic route) {
    // Analytics tracking
    // Navigation guards
    // Deep link handling
  }

  static void pushNamed(dynamic context, String name) {
    // Analytics tracking with route name
  }

  static void pop(dynamic context) {
    // Analytics tracking for back navigation
  }
}

/// Custom dialog service with consistent styling
class AppDialogs {
  static Future<T?> show<T>(dynamic context, dynamic dialog) async {
    // Consistent styling
    // Analytics tracking
    // Theme compliance
    return null;
  }
}

/// Custom bottom sheet with consistent styling
class AppBottomSheet {
  static Future<T?> show<T>(dynamic context, dynamic builder) async {
    // Consistent styling
    // Theme compliance
    return null;
  }
}

/// Custom snackbar with consistent styling
class AppSnackbar {
  static void show(dynamic context, String message) {
    // Consistent styling
    // Analytics tracking
  }
}
