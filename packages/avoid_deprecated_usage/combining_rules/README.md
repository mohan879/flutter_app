# Combining Rules Example

Demonstrates combining `avoid-deprecated-usage` with `banned-usage` and
`avoid-banned-types` for layered coverage.

## Rule Configuration

| Rule                     | Catches                                   |
| ------------------------ | ----------------------------------------- |
| `avoid-deprecated-usage` | Anything with `@deprecated` annotation    |
| `banned-usage`           | Specific method/property names you define |
| `avoid-banned-types`     | Type names in declarations                |

## Coverage

- `avoid-deprecated-usage` catches `@deprecated` annotated APIs
- `banned-usage` catches specific identifiers like `FlatButton`, `accentColor`
- `avoid-banned-types` catches type declarations

## Violations

- `lib/deprecated_widgets.dart` - Uses deprecated and banned widgets/properties

## Run Analysis

```bash
dcm analyze lib
```
