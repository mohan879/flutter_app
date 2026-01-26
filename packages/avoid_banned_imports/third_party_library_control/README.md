# Third-Party Library Control Example

Demonstrates standardizing on specific libraries across the codebase.

## Rule Configuration

- Use Dio instead of http package
- Use freezed instead of built_value
- Use centralized logging instead of dart:developer

## Violations

- `lib/bad_api_client.dart` - imports http package ❌
- `lib/bad_model.dart` - imports built_value ❌
- `lib/bad_logger.dart` - imports dart:developer ❌

## Run

```bash
dcm analyze lib
```
