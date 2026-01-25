// ✅ Valid exports - public design system components
export 'src/widgets/ds_button.dart';
export 'src/theme/ds_theme.dart';

// ❌ Violations: Design system barrel should not expose internals

// Pattern: .*/internal/.*
export 'src/internal/color_utils.dart'; // expect lint: internal utility
export 'src/internal/spacing_calc.dart'; // expect lint: internal calculation

// Pattern: .*_impl\.dart
export 'src/theme/theme_impl.dart'; // expect lint: implementation detail

// Pattern: .*_utils\.dart
export 'src/typography_utils.dart'; // expect lint: utility file

// Pattern: .*_calc\.dart (already covered by spacing_calc.dart in internal)
