# Constructor and Factory Bans Example

Demonstrates banning constructors to enforce dependency injection patterns.

## What This Example Shows

- Banning `ApiClient()` constructor to enforce GetIt usage
- Banning `Singleton.instance` to enforce DI patterns
- Banning `DateTime.now` to enforce Clock service

## Run Analysis

```bash
dcm analyze lib
```

## Why Constructor Bans Matter

Direct instantiation bypasses DI configuration:

- Can't mock in tests
- No lifecycle management
- Configuration scattered across codebase
- Hard to switch implementations

DI provides:

- Centralized configuration
- Easy mocking for tests
- Lifecycle management (singleton, factory, lazy)
- Implementation swapping

## Expected Violations

The `direct_instantiation.dart` file contains violations for bypassing DI.
