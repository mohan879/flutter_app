# Test Code Isolation Example

Demonstrates banning test utilities in production code.

## What This Example Shows

- Banning `Mock*` classes in `lib/` folder
- Banning `Fake*` classes in `lib/` folder
- Banning Mockito `when()` in `lib/` folder

## Run Analysis

```bash
dcm analyze lib
```

## Why Test Code Isolation Matters

| Location            | Allowed              | Banned                         |
| ------------------- | -------------------- | ------------------------------ |
| `lib/` (production) | Real implementations | `Mock*`, `Fake*`, test imports |
| `test/` (tests)     | Everything           | Real network calls (use mocks) |

Test utilities leaking into production:

- Increases bundle size
- Exposes test-only behaviors
- Security risk (fake auth, etc.)

## Expected Violations

The `bad_service.dart` file contains test utilities that shouldn't be in
production.
