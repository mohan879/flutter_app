# Memory and Resource Management Example

Demonstrates warning about APIs that commonly cause memory leaks.

## What This Example Shows

- Warning on `Timer.periodic` (must be canceled in dispose)
- Warning on `Stream.listen` (subscription must be canceled)

## Run Analysis

```bash
dcm analyze lib
```

## Common Memory Leak Sources

| API                     | Leak Risk                            | Prevention                     |
| ----------------------- | ------------------------------------ | ------------------------------ |
| `Stream.listen()`       | Subscription continues after dispose | Store & cancel in `dispose()`  |
| `Timer.periodic()`      | Timer continues firing               | Store & cancel in `dispose()`  |
| `AnimationController()` | Controller holds references          | Call `dispose()` on controller |

## Expected Violations

The `leak_prone_code.dart` file contains patterns that commonly cause memory
leaks.
