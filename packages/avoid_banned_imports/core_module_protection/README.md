# Core Module Protection Example

Demonstrates protecting the core module from feature dependencies.

## Rule Configuration

Core module cannot import from features or presentation. Utils should be pure
Dart without Flutter dependencies.

## Violations

- `lib/core/base_service.dart` - imports from features ❌
- `lib/utils/format_utils.dart` - imports Flutter ❌

## Run

```bash
dcm analyze lib
```
