# Test File Import Control Example

Demonstrates controlling what test files can import and keeping test utilities
out of production code.

## Rule Configuration

- Unit tests should not import Flutter (use plain Dart test)
- Production code should never import test utilities

## Violations

- `lib/bad_service.dart` - imports mockito ❌
- `test/unit/user_test.dart` - imports flutter_test ❌

## Run

```bash
dcm analyze lib test
```
