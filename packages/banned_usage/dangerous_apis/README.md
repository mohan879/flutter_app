# Dangerous APIs Example

Demonstrates banning APIs that throw exceptions on edge cases common in
production.

## What This Example Shows

- Banning `DateTime.now` to enforce `Clock.now()` for testable time
- Banning `list.first` to enforce `firstOrNull` (avoids StateError on empty
  list)
- Banning `list.last` to enforce `lastOrNull` (avoids StateError on empty list)
- Banning `list.single` to enforce `singleOrNull` (avoids StateError on 0 or 2+
  elements)

## Run Analysis

```bash
dcm analyze lib
```

## Expected Violations

The `dangerous_usage.dart` file contains violations for using dangerous APIs
that can throw exceptions.
