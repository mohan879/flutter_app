# combined_rules

Demonstrates combining `max-imports` with other architecture rules for
comprehensive enforcement.

## Configuration

```yaml
dcm:
  rules:
    - max-imports:
        max-number: 10
    - avoid-banned-imports:
        entries:
          - paths: ['lib/domain/.*\.dart']
            deny: ['package:flutter/.*']
            message: 'Domain layer should not import Flutter'
```

## What This Example Shows

- Enforcing import count limits with `max-imports`
- Enforcing architecture boundaries with `avoid-banned-imports`
- Multiple rules working together for layered architecture

## Structure

```
lib/
├── domain/
│   └── use_case.dart         # ❌ Violates avoid-banned-imports (Flutter import)
└── presentation/
    └── too_many_deps.dart    # ❌ Violates max-imports (>10 imports)
```

## Expected Violations

- `lib/domain/use_case.dart` - Imports Flutter in domain layer
- `lib/presentation/too_many_deps.dart` - Has 12 imports, exceeds threshold

## Run

```bash
dcm analyze lib
```
