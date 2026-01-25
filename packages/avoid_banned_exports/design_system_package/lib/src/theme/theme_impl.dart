/// Internal theme implementation details.
/// This should NOT be exported from the design system barrel.
class ThemeImpl {
  final String primaryColorHex;
  final String secondaryColorHex;

  const ThemeImpl({
    required this.primaryColorHex,
    required this.secondaryColorHex,
  });

  // ignore: unused_element
  int _parseHex(String hex) {
    return int.parse(hex.replaceFirst('#', ''), radix: 16);
  }
}
