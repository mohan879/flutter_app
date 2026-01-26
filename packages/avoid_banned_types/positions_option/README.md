# Using the positions Option

Demonstrates using `positions: [is]` to ban only is checks while allowing the
type elsewhere.

## Rule Configuration

- Ban `is` checks for `LoadingState`, `ErrorState`, `SuccessState`
- Encourages exhaustive pattern matching with `switch` expressions

## Violations

- `lib/bad_handler.dart` - Uses `is` checks instead of pattern matching

## Run Analysis

```bash
dcm analyze lib
```
