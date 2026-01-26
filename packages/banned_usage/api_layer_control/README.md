# API and Network Layer Control Example

Demonstrates centralizing HTTP calls through an ApiClient for consistent error
handling and interceptors.

## What This Example Shows

- Banning direct `Dio.get/post` to enforce `ApiClient` usage
- Banning `jsonDecode/jsonEncode` to enforce `SafeJson` utilities

## Run Analysis

```bash
dcm analyze lib
```

## Why Centralized API Layer Matters

Scattered HTTP calls lead to:

- Inconsistent error handling
- Missing auth tokens
- No retry logic
- Scattered logging

Centralize through an `ApiClient` for:

- Interceptors (auth, logging, retry)
- Consistent error handling
- Request/response transformation

## Expected Violations

The `scattered_calls.dart` file contains violations for making direct HTTP
calls.
