# Design System Package Example

Demonstrates how
[`avoid-banned-exports`](https://dcm.dev/docs/rules/common/avoid-banned-exports/)
keeps design system APIs clean by hiding internal utilities, implementation
details, and calculation helpers.

## What This Example Shows

This package demonstrates design system API hygiene with four deny patterns:

1. **Internal folder** (`.*/internal/.*`) - Blocks exports from `src/internal/`
2. **Implementation files** (`.*_impl\.dart`) - Blocks implementation details
3. **Utility files** (`.*_utils\.dart`) - Blocks utility helpers
4. **Calculation files** (`.*_calc\.dart`) - Blocks calculation helpers

## Configuration

See [`analysis_options.yaml`](./analysis_options.yaml):

```yaml
dcm:
  rules:
    - avoid-banned-exports:
        entries:
          # Design system barrel should not expose internals
          - paths: ['lib/design_system\.dart']
            deny:
              - '.*/internal/.*'
              - '.*_impl\.dart'
              - '.*_utils\.dart'
              - '.*_calc\.dart'
            message:
              'Only export public design system components, not internal
              utilities.'
            severity: error
```

## Expected Violations

[`lib/design_system.dart`](./lib/design_system.dart) leaks internals:

```dart
// Pattern: .*/internal/.*
export 'src/internal/color_utils.dart';  // ❌ internal utility
export 'src/internal/spacing_calc.dart'; // ❌ internal calculation

// Pattern: .*_impl\.dart
export 'src/theme/theme_impl.dart';      // ❌ implementation detail

// Pattern: .*_utils\.dart
export 'src/typography_utils.dart';      // ❌ utility file
```

Correct public API exports:

```dart
export 'src/widgets/ds_button.dart';  // ✅ public component
export 'src/theme/ds_theme.dart';     // ✅ public theme
```

## Run the Example

```bash
dcm analyze lib
```

Expected output: 4 error issues

## Learn More

Read the full rule documentation at
[DCM: avoid-banned-exports](https://dcm.dev/docs/rules/common/avoid-banned-exports/)

[← Back to examples](../README.md)
