# Using exclude-paths for Exceptions

Demonstrates using `exclude-paths` to create targeted exceptions for specific
folders.

## Rule Configuration

- Ban `Dio`, `Response`, `DioException` everywhere
- Exception: `lib/core/network/` and `lib/data/remote/` can use these types

## Violations

- `lib/bad_usage.dart` - Uses Dio types outside allowed paths

## Run Analysis

```bash
dcm analyze lib
```
