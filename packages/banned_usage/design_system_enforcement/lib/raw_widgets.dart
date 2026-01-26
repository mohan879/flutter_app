import 'flutter_widgets.dart';

// ❌ Bad: Using raw Flutter widgets instead of design system

class RawWidgetsPage extends Widget {
  Widget build() {
    return Column([
      // LINT: Use DSButton.primary() from the design system.
      ElevatedButton(onPressed: () {}, child: Text('Submit')),

      // LINT: Use DSButton.text() from the design system.
      TextButton(onPressed: () {}, child: Text('Cancel')),

      // LINT: Use DSTextField for consistent styling and validation.
      TextField(decoration: null, controller: null),

      // LINT: Use DSText widget with predefined text styles.
      Text('Hello World'),

      // LINT: Use DSText widget with predefined text styles.
      Text('Another text', style: null),

      // LINT: Use CachedNetworkImage or DSImage.network() for caching and error handling.
      Image.network('https://example.com/image.png'),
    ]);
  }
}

// Simulated Column widget
class Column extends Widget {
  Column(this.children);
  final List<Widget> children;
}
