# Preventing Anti-Pattern Types

Demonstrates banning anti-pattern types that reduce type safety.

## Rule Configuration

- Ban `Object` type (use specific types or sealed classes)
- Ban `FutureOr` type (use `Future` or sync return types)

## Violations

- `lib/bad_types.dart` - Uses Object and FutureOr

## Run Analysis

```bash
dcm analyze lib
```
