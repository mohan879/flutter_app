/// Complex logic file for tracking cyclomatic-complexity
/// With threshold: unset, all values are collected but no violations triggered

class ComplexLogic {
  String processData(int level, bool active, bool premium) {
    // Some cyclomatic complexity
    if (level > 10) {
      if (active) {
        if (premium) {
          return 'premium';
        }
        return 'active';
      }
      return 'inactive';
    }
    return 'basic';
  }
}
