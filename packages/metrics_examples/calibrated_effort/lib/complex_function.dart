/// Complex function demonstrating calibrated effort (30 min per violation)
/// Your team averages 30 min to refactor complex functions

class ComplexFunction {
  String process(
    int level,
    bool active,
    bool premium,
    String? region,
    int status,
  ) {
    // Cyclomatic complexity that would show 30 min effort when violated
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
