# reduction_strategies

Demonstrates strategies for reducing import counts: barrel files and facade
patterns.

## Configuration

```yaml
dcm:
  rules:
    - max-imports:
        max-number: 5
```

## What This Example Shows

- **Barrel files**: Consolidate multiple entity imports into one
- **Facade pattern**: Hide multiple repository imports behind a single facade
- **Before/After**: Compare verbose imports vs. reduced imports

## Structure

```
lib/
├── before/
│   └── verbose_imports.dart    # ❌ Many individual imports (violates)
├── after/
│   └── reduced_imports.dart    # ✅ Uses barrel file (passes)
├── entities/
│   ├── user.dart
│   ├── session.dart
│   ├── credentials.dart
│   ├── token.dart
│   └── entities.dart           # Barrel file exporting all entities
└── facade/
    └── profile_facade.dart     # Facade hiding multiple dependencies
```

## Expected Violations

- `lib/before/verbose_imports.dart` - Has 8 imports, exceeds threshold of 5

## Run

```bash
dcm analyze lib
```
