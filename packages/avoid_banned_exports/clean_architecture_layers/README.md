# Clean Architecture Layers Example

Demonstrates how
[`avoid-banned-exports`](https://dcm.dev/docs/rules/common/avoid-banned-exports/)
enforces Clean Architecture's dependency rules: Presentation → Data → Domain,
with the domain layer remaining pure.

## What This Example Shows

This package demonstrates layered architecture enforcement:

1. **Domain layer purity** - Domain cannot export data, presentation, or Flutter
   code
2. **Data layer isolation** - Data layer cannot export presentation code
3. **Dependency direction** - Only outer layers depend on inner layers, never
   the reverse

## Configuration

See [`analysis_options.yaml`](./analysis_options.yaml):

```yaml
dcm:
  rules:
    - avoid-banned-exports:
        entries:
          # Domain barrel must not re-export data or presentation code
          - paths: ['lib/domain/domain\.dart']
            deny:
              - '.*/data/.*'
              - '.*/presentation/.*'
              - 'package:flutter/.*'
            message:
              'Domain layer cannot export data, presentation, or Flutter code.'
            severity: error

          # Data barrel should not export presentation code
          - paths: ['lib/data/data\.dart']
            deny: ['.*/presentation/.*']
            message: 'Data layer cannot export presentation code.'
            severity: error
```

## Expected Violations

[`lib/domain/domain.dart`](./lib/domain/domain.dart) violates domain purity:

```dart
export '../data/dtos/user_dto.dart';           // ❌ data leak
export '../presentation/pages/user_page.dart'; // ❌ presentation leak
export 'package:flutter/widgets.dart';         // ❌ Flutter dependency
```

[`lib/data/data.dart`](./lib/data/data.dart) leaks presentation:

```dart
export '../presentation/pages/user_page.dart'; // ❌ presentation leak
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
