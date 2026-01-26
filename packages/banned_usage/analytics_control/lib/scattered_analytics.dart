import 'firebase_types.dart';

// ❌ Bad: Scattered analytics calls without centralized handling

class ProductPage {
  void onProductViewed(String productId) {
    // LINT: Use AnalyticsService.logEvent() for consistent analytics tracking.
    FirebaseAnalytics.instance.logEvent(
      name: 'product_view',
      parameters: {'product_id': productId},
    );
  }

  void onAddToCart(String productId, double price) {
    // LINT: Use AnalyticsService.logEvent() for consistent analytics tracking.
    FirebaseAnalytics.instance.logEvent(
      name: 'add_to_cart',
      parameters: {'product_id': productId, 'price': price},
    );
  }
}

class CheckoutPage {
  void onPurchaseComplete(String orderId, double total) {
    // LINT: Use AnalyticsService.logEvent() for consistent analytics tracking.
    FirebaseAnalytics.instance.logEvent(
      name: 'purchase',
      parameters: {'order_id': orderId, 'value': total},
    );
  }
}

class ErrorHandler {
  void handleError(Object error, StackTrace stackTrace) {
    // LINT: Use CrashReporter service for error reporting.
    FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: false);
  }

  void handleFatalError(Object error, StackTrace stackTrace) {
    // LINT: Use CrashReporter service for error reporting.
    FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: true);
  }
}
