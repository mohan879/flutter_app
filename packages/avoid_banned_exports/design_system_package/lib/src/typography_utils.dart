/// Typography utility helpers.
/// This should NOT be exported from the design system barrel.
double scaleFont(double baseSize, double scale) {
  return baseSize * scale;
}

double calculateLineHeight(double fontSize) {
  return fontSize * 1.5;
}
