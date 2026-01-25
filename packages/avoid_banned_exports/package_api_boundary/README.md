# Package API Boundary Example

Demonstrates how
[`avoid-banned-exports`](https://dcm.dev/docs/rules/common/avoid-banned-exports/)
enforces clean package APIs by blocking internal implementations, test
utilities, and generated files from being exported through public barrel files.

## What This Example Shows

This package demonstrates two violation patterns from the configuration:

**Entry 1 (barrel file only):**

- Internal folder exports (`src/internal/*`)
- Implementation files (`*_impl.dart`)

**Entry 2 (all lib files):**

- Test utilities (`*_test.dart`, `*/test/*`)
- Test packages (`package:mockito/*`, `package:mocktail/*`)
- Generated files (`*.g.dart`, `*.freezed.dart`)

## Configuration

See [`analysis_options.yaml`](./analysis_options.yaml):

```yaml
dcm:
  rules:
    - avoid-banned-exports:
        entries:
          # Barrel file should not re-export internal implementations
          - paths: ['lib/my_package\.dart']
            deny:
              - '.*/internal/.*'
              - '.*_impl\.dart'
            message:
              'Do not export internal implementations from the public API.'
            severity: error

          # Test utilities and generated files (apply to all lib files)
          - paths: ['lib/.*\.dart']
            deny:
              - '.*_test\.dart'
              - '.*/test/.*'
              - 'package:mockito/.*'
              - 'package:mocktail/.*'
              - '.*\.g\.dart'
              - '.*\.freezed\.dart'
            message: 'Do not export test utilities or generated files.'
            severity: error
```

## Expected Violations

[`lib/my_package.dart`](./lib/my_package.dart) contains five intentional
violations:

```dart
// ❌ Entry 1: Internal implementations (paths: lib/my_package.dart)
export 'src/internal/helpers.dart';      // internal folder
export 'src/internal/utils_impl.dart';   // _impl file

// ❌ Entry 2: Test utilities and generated files (paths: lib/*.dart)
export 'src/testing/mock_api_test.dart'; // test utility
export 'src/models/user.g.dart';         // generated file
export 'src/models/product.freezed.dart';// freezed generated file
```

## Run the Example

```bash
dcm analyze lib
```

Expected output: 5 error issues

## Learn More

Read the full rule documentation at
[DCM: avoid-banned-exports](https://dcm.dev/docs/rules/common/avoid-banned-exports/)

[← Back to examples](../README.md)
