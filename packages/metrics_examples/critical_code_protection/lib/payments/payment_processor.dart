/// Payment processing - critical code with non-ignorable metrics
/// Cannot use // ignore: comments here!

class PaymentProcessor {
  // ignore: high-cyclomatic-complexity  <-- This won't work with ignorable: false
  String processPayment(
    double amount,
    String currency,
    String cardNumber,
    String cardType,
    bool isInternational,
    bool requiresVerification,
    String merchantId,
    bool isRecurring,
    int retryCount,
    bool hasInsurance,
    String billingCountry,
    bool isBusinessAccount,
  ) {
    // Intentionally complex - WILL violate threshold 10
    // Cannot be suppressed with // ignore: comment
    if (amount > 10000) {
      if (isInternational) {
        if (requiresVerification) {
          if (isBusinessAccount) {
            // Deep nesting - violates threshold 3
            if (billingCountry == 'US') {
              if (hasInsurance) {
                return 'approved-insured';
              } else {
                return 'approved-uninsured';
              }
            } else {
              return 'international-verification-required';
            }
          } else {
            return 'business-verification-required';
          }
        } else {
          return 'verification-pending';
        }
      } else if (cardType == 'AMEX') {
        return 'amex-high-value';
      } else {
        return 'domestic-high-value';
      }
    } else if (amount > 1000) {
      if (isRecurring) {
        return 'recurring-medium';
      } else {
        return 'standard-medium';
      }
    } else {
      return 'standard-low';
    }
  }
}
