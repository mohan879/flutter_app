# Platform-Specific Code Example

Demonstrates how
[`avoid-banned-exports`](https://dcm.dev/docs/rules/common/avoid-banned-exports/)
enforces conditional exports for platform-specific implementations instead of
direct platform file exports.

## What This Example Shows

This package demonstrates platform code isolation:

1. **Block direct platform exports** - Prevents direct exports of
   `_android.dart`, `_ios.dart`, `_web.dart` files
2. **Block implementation files** - Stops `_mobile.dart` and `_stub.dart` from
   barrel exports
3. **Encourage conditional exports** - Forces use of conditional exports in
   dedicated files

## Configuration

See [`analysis_options.yaml`](./analysis_options.yaml):

```yaml
dcm:
  rules:
    - avoid-banned-exports:
        entries:
          - paths: ['lib/my_package\.dart']
            deny:
              - '.*_android\.dart'
              - '.*_ios\.dart'
              - '.*_web\.dart'
              - '.*_mobile\.dart'
              - '.*_stub\.dart'
            message:
              'Use conditional exports instead of exporting platform files
              directly.'
            severity: error
```

## Expected Violations

[`lib/my_package.dart`](./lib/my_package.dart) directly exports platform files:

```dart
export 'file_picker_android.dart'; // ❌ direct platform export
export 'file_picker_ios.dart';     // ❌ direct platform export
export 'file_picker_mobile.dart';  // ❌ direct platform export
export 'file_picker_web.dart';     // ❌ direct platform export
export 'file_picker_stub.dart';    // ❌ direct platform export
```

The correct approach in [`lib/file_picker.dart`](./lib/file_picker.dart):

```dart
export 'file_picker_stub.dart'
    if (dart.library.io) 'file_picker_mobile.dart'
    if (dart.library.html) 'file_picker_web.dart';
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
