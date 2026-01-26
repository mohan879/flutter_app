# Build and Generated Code Example

Demonstrates preventing direct imports of generated files (_.g.dart,
_.freezed.dart).

## Rule Configuration

Generated files should be included via `part` directive, not imported directly.

## Violations

- `lib/bad_usage.dart` - imports user.g.dart directly ❌

## Run

```bash
dcm analyze lib
```
