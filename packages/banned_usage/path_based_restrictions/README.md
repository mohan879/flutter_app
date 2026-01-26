# Path-Based Restrictions Example

Demonstrates banning APIs in specific folders while allowing them elsewhere.

## What This Example Shows

- Banning `BuildContext` in domain layer only
- Banning `rawQuery` except in database layer
- Banning `setState` in screen files (warning severity)

## Run Analysis

```bash
dcm analyze lib
```

## Common Path Patterns

| Pattern                               | Matches                      |
| ------------------------------------- | ---------------------------- |
| `lib/domain/.*\.dart`                 | All domain layer files       |
| `lib/(?!.*_bloc\.dart).*\.dart`       | All files EXCEPT \_bloc.dart |
| `lib/presentation/screens/.*`         | Only screen files            |
| `lib/(?!data/local/database).*\.dart` | All except database folder   |

## Expected Violations

The files in `lib/domain/` and `lib/presentation/screens/` contain
context-specific violations.
