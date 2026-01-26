# Deprecation Messages Example

Demonstrates writing good deprecation messages with clear replacements.

## Good Practices

1. Include the replacement API
2. Mention when it will be removed
3. Provide migration examples for complex changes

## Examples

- `lib/good_deprecations.dart` - Well-documented deprecations
- `lib/bad_deprecations.dart` - Poorly documented deprecations
- `lib/usage.dart` - Code using deprecated APIs (shows messages)

## Run Analysis

```bash
dcm analyze lib
```
