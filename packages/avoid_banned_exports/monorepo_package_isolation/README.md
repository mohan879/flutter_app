# Monorepo Package Isolation Example

Demonstrates how
[`avoid-banned-exports`](https://dcm.dev/docs/rules/common/avoid-banned-exports/)
enforces package boundaries in a monorepo, preventing accidental cross-package
leakage.

## What This Example Shows

This multi-package example demonstrates monorepo boundary enforcement with a
single root-level configuration:

1. **Core isolation** - Core utilities cannot export feature or app packages
2. **Feature independence** - Features cannot re-export other features
3. **Shared UI purity** - Shared UI cannot depend on feature packages

## Package Structure

```
monorepo_package_isolation/
├── analysis_options.yaml        # Root config for all packages
└── packages/
    ├── core/                    # Shared utilities (lowest level)
    ├── shared_ui/               # Shared widgets (no feature dependencies)
    ├── feature_auth/            # Auth feature (independent)
    └── feature_home/            # Home feature (independent)
```

## Configuration

See [`analysis_options.yaml`](./analysis_options.yaml) (single root-level
config):

```yaml
dcm:
  rules:
    - avoid-banned-exports:
        entries:
          # Core cannot depend on features or app
          - paths: ['packages/core/lib/.*\.dart']
            deny:
              - 'package:feature_.*'
              - 'package:app/.*'
            message: 'Core must not export feature or app packages.'
            severity: error

          # Features cannot export other features
          - paths: ['packages/feature_.*/lib/.*\.dart']
            deny: ['package:feature_.*']
            message: 'Features should not re-export other feature packages.'
            severity: error

          # Shared UI cannot depend on features
          - paths: ['packages/shared_ui/lib/.*\.dart']
            deny: ['package:feature_.*']
            message: 'Shared UI must not depend on feature packages.'
            severity: error
```

## Expected Violations

**Core Package** -
[`packages/core/lib/core.dart`](./packages/core/lib/core.dart):

```dart
export 'package:feature_home/feature_home.dart'; // ❌ feature leak
export 'package:app/main.dart';                  // ❌ app leak
```

**Feature Auth Package** -
[`packages/feature_auth/lib/feature_auth.dart`](./packages/feature_auth/lib/feature_auth.dart):

```dart
export 'package:feature_home/feature_home.dart'; // ❌ cross-feature leak
```

**Shared UI Package** -
[`packages/shared_ui/lib/shared_ui.dart`](./packages/shared_ui/lib/shared_ui.dart):

```dart
export 'package:feature_auth/feature_auth.dart'; // ❌ feature dependency
```

## Run the Example

Analyze from the monorepo root:

```bash
dcm analyze packages
```

Expected output: 4 error issues

## Learn More

Read the full rule documentation at
[DCM: avoid-banned-exports](https://dcm.dev/docs/rules/common/avoid-banned-exports/)

[← Back to examples](../README.md) cd ../feature_auth dcm analyze lib

cd ../shared_ui dcm analyze lib

```

Expected output: 1 error per package

## Learn More

Read the full rule documentation at
[DCM: avoid-banned-exports](https://dcm.dev/docs/rules/common/avoid-banned-exports/)

[← Back to examples](../README.md)
```
