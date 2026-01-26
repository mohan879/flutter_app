# Dependency Injection Type Control

Demonstrates restricting DI container access to setup files only.

## Rule Configuration

- `GetIt` type only allowed in `lib/di/` folder and `lib/injection.dart`
- All other code must use constructor injection

## Violations

- `lib/presentation/bad_service.dart` - Uses GetIt.I directly outside DI files

## Run Analysis

```bash
dcm analyze lib
```
