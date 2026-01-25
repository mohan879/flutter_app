/// Internal spacing calculation utilities.
/// This should NOT be exported from the design system barrel.
double calculatePadding(double basePadding, double multiplier) {
  return basePadding * multiplier;
}

double calculateMargin(double baseMargin, double scale) {
  return baseMargin * scale;
}
