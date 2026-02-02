/// Domain logic - strict threshold (8 for cyclomatic, 40 for SLOC)
class OrderUseCase {
  String execute(
    int amount,
    bool isPremium,
    bool hasDiscount,
    String region,
    bool isHoliday,
    int points,
    bool isMember,
    String tier,
    bool hasInsurance,
  ) {
    // Intentionally complex to show violation at threshold 8
    if (amount > 1000) {
      if (isPremium) {
        if (hasDiscount) {
          if (region == 'US') {
            if (isHoliday) {
              return 'premium-holiday-us';
            }
            return 'premium-us';
          }
          return 'premium-intl';
        }
        return 'premium-no-discount';
      }
      return 'standard-high';
    }
    return 'standard';
  }
}
