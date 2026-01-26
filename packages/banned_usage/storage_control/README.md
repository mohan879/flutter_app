# Storage and Persistence Control Example

Demonstrates centralizing storage access through a StorageService.

## What This Example Shows

- Banning `SharedPreferences.getInstance` to enforce DI
- Banning `SharedPreferences.setString/getString` to enforce StorageService
- Banning `FlutterSecureStorage()` constructor to enforce DI

## Run Analysis

```bash
dcm analyze lib
```

## Why Centralized Storage Matters

Direct SharedPreferences access causes:

- Scattered key management (typos, inconsistencies)
- Sensitive data stored insecurely
- No encryption for sensitive values
- Hard to migrate storage implementations

Centralize through a StorageService for:

- Consistent key management (enums, constants)
- Automatic encryption for sensitive data
- Easy migration between storage backends
- Testable with mock implementations

## Expected Violations

The `scattered_storage.dart` file contains violations for direct storage access.
