/// Domain logic with strict threshold (10 for cyclomatic, 3 for nesting)
class OrderCalculator {
  double calculateTotal(
    List<double> prices,
    double taxRate,
    double discount,
    bool isMember,
    String couponCode,
    int quantity,
    bool isHoliday,
    String region,
    bool hasShipping,
    double shippingCost,
    bool isExpress,
    double expressFee,
  ) {
    // Intentionally complex - will trigger violation with threshold 10
    double total = 0;

    for (final price in prices) {
      if (price > 100) {
        if (isMember) {
          if (couponCode == 'VIP') {
            if (isHoliday) {
              // Deep nesting - violates threshold 3
              if (region == 'US') {
                total += price * 0.7;
              } else {
                total += price * 0.75;
              }
            } else {
              total += price * 0.8;
            }
          } else {
            total += price * 0.85;
          }
        } else {
          total += price * 0.9;
        }
      } else {
        total += price * 0.95;
      }
    }

    if (hasShipping) {
      if (isExpress) {
        total += expressFee;
      } else {
        total += shippingCost;
      }
    }

    return total * (1 + taxRate) - discount;
  }
}
