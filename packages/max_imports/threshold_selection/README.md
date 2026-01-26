# threshold_selection

Demonstrates basic `max-imports` threshold configuration.

## Configuration

```yaml
dcm:
  rules:
    - max-imports:
        max-number: 10
```

## What This Example Shows

- Setting a maximum import limit (default is 10)
- Files exceeding the threshold trigger violations
- Files at or below the threshold pass

## Expected Violations

- `lib/too_many_imports.dart` - Has 12 imports, exceeds threshold of 10
- `lib/just_right.dart` - Has exactly 10 imports, passes
- `lib/minimal_imports.dart` - Has 5 imports, passes

## Run

```bash
dcm analyze lib
```
