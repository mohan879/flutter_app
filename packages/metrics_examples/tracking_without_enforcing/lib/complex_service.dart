/// Complex service demonstrating enforced metrics (cyclomatic-complexity: 20)
/// This file shows that enforced metrics will trigger violations when exceeded

class ComplexService {
  String processData(
    int level,
    bool active,
    bool premium,
    String? region,
    int status,
  ) {
    // Cyclomatic complexity: 8 (under threshold of 20, so passes)
    if (level > 10) {
      if (active) {
        if (premium) {
          return region ?? 'premium-active';
        }
        return 'active';
      }
      if (status > 5) {
        return 'high-status';
      }
      return 'inactive';
    }
    return 'low-level';
  }
}
