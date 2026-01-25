# Exclude Paths Exceptions Example

Demonstrates how
[`avoid-banned-exports`](https://dcm.dev/docs/rules/common/avoid-banned-exports/)
uses `exclude-paths` to create targeted exceptions, allowing specific folders to
bypass restrictions.

## What This Example Shows

This package demonstrates selective rule application:

1. **Global restriction** - Ban Material exports across all `lib/` files
2. **Targeted exceptions** - Allow Material in `lib/theme/` and
   `lib/design_system/`
3. **Enforcement elsewhere** - Block Material exports in other folders like
   `lib/components/`

## Configuration

See [`analysis_options.yaml`](./analysis_options.yaml):

```yaml
dcm:
  rules:
    - avoid-banned-exports:
        entries:
          - paths: ['lib/.*\.dart']
            exclude-paths: ['lib/theme/.*', 'lib/design_system/.*']
            deny: ['package:flutter/material.dart']
            message: 'Import Material through the design system, not directly.'
            severity: warning
```

## Expected Violations and Exceptions

**Violation** -
[`lib/components/bad_export.dart`](./lib/components/bad_export.dart):

```dart
export 'package:flutter/material.dart'; // ❌ blocked
```

**Exception** -
[`lib/theme/theme_exports.dart`](./lib/theme/theme_exports.dart):

```dart
export 'package:flutter/material.dart'; // ✅ allowed (theme folder)
```

**Exception** -
[`lib/design_system/design_system_exports.dart`](./lib/design_system/design_system_exports.dart):

```dart
export 'package:flutter/material.dart'; // ✅ allowed (design_system folder)
```

## Run the Example

```bash
dcm analyze lib
```

Expected output: 1 warning issue (only in `components/`)

## Learn More

Read the full rule documentation at
[DCM: avoid-banned-exports](https://dcm.dev/docs/rules/common/avoid-banned-exports/)

[← Back to examples](../README.md)
