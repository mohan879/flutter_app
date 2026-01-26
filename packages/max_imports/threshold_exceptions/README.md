# threshold_exceptions

Demonstrates using file-level ignores for valid exceptions like DI setup files.

## Configuration

```yaml
dcm:
  rules:
    - max-imports:
        max-number: 5
```

## What This Example Shows

- Using `// ignore_for_file: max-imports` for valid exceptions
- DI setup files legitimately need many imports
- Barrel files also typically need many imports

## Structure

```
lib/
├── di/
│   └── injection.dart        # ✅ Has ignore comment, no violation
├── feature/
│   └── feature.dart          # ❌ Exceeds threshold, no ignore
└── barrel.dart               # ✅ Has ignore comment, no violation
```

## Expected Violations

- `lib/feature/feature.dart` - Has 8 imports without ignore, exceeds threshold

## Run

```bash
dcm analyze lib
```
