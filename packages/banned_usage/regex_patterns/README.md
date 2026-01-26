# Regex Patterns Example

Demonstrates using `name-pattern` for regex-based method banning.

## What This Example Shows

- `^debug.*` - Matches methods starting with "debug" (debugPrint, debugLog,
  etc.)
- `.*[Uu]nsafe.*` - Matches methods containing "unsafe" (runUnsafe,
  unsafeMethod)
- `.*Deprecated$` - Matches methods ending with "Deprecated" (loginDeprecated)
- Type-scoped patterns for List methods

## Run Analysis

```bash
dcm analyze lib
```

## Pattern Reference

| Pattern         | Matches                     | Use Case                            |
| --------------- | --------------------------- | ----------------------------------- |
| `^debug.*`      | `debugPrint`, `debugLog`    | Remove debug methods before release |
| `.*[Uu]nsafe.*` | `runUnsafe`, `unsafeMethod` | Security-sensitive code             |
| `.*Deprecated$` | `loginDeprecated`           | Migration enforcement               |
| `^_internal.*`  | `_internalHelper`           | Prevent internal API usage          |

## Expected Violations

The `pattern_usage.dart` file contains violations matching various regex
patterns.
