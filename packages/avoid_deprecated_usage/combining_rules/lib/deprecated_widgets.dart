// Code demonstrating layered rule coverage
import 'deprecated_apis.dart';

class BadWidgetUsage {
  // ❌ Caught by avoid-deprecated-usage
  final LegacyButton _button = LegacyButton();

  // ❌ Caught by avoid-deprecated-usage
  final OldTheme _theme = OldTheme();

  void build() {
    _button.onTap();
    print(_theme.primaryColor);
  }
}
