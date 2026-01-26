# Test Types in Production Code Control

Demonstrates preventing mock/fake types from leaking into production code.

## Rule Configuration

- Types starting with `Mock` or `Fake` banned in `lib/`

## Violations

- `lib/bad_usage.dart` - References MockUserRepository in production

## Run Analysis

```bash
dcm analyze lib
```
