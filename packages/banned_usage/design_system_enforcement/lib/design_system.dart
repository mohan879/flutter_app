// Design system components with consistent styling

import 'flutter_widgets.dart';

class DSButton {
  static Widget primary({
    required String label,
    required dynamic onPressed,
    bool isLoading = false,
  }) {
    // Brand colors, loading state, analytics
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      child: Text(label),
    );
  }

  static Widget text({required String label, required dynamic onPressed}) {
    // Consistent text button styling
    return TextButton(onPressed: onPressed, child: Text(label));
  }
}

class DSTextField extends Widget {
  DSTextField({this.label, this.hint, this.validator, this.controller});
  final String? label;
  final String? hint;
  final dynamic validator;
  final dynamic controller;
  // Includes consistent styling, validation, error states
}

class DSText extends Widget {
  DSText.headline(this.text);
  DSText.body(this.text);
  DSText.caption(this.text);
  final String text;
  // Uses typography scale from design system
}

class DSImage extends Widget {
  static Widget network(
    String url, {
    dynamic placeholder,
    dynamic errorWidget,
  }) {
    // Includes caching, placeholder, error handling
    return Image.network(
      url,
      errorBuilder: (_, __, ___) => errorWidget ?? Text('Error'),
    );
  }
}
