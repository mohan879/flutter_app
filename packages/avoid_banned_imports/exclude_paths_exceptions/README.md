# Exclude Paths Exceptions Example

Demonstrates using `exclude-paths` to create targeted exceptions for banned
imports.

## Rule Configuration

Ban Dio everywhere except `core/network/` and `data/remote/`.

## Violations

- `lib/bad_usage.dart` - imports Dio outside network layer ❌

## Allowed

- `lib/core/network/api_client.dart` - can import Dio ✅
- `lib/data/remote/user_api.dart` - can import Dio ✅

## Run

```bash
dcm analyze lib
```
