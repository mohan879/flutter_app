# Baseline Migration Example

Demonstrates gradual migration with DCM baseline feature.

## Rule Configuration

- Basic `avoid-deprecated-usage` rule enabled
- Use `dcm init --baseline` to snapshot existing deprecations
- New deprecations are flagged immediately

## Workflow

1. Run `dcm init --baseline` to capture current state
2. Write new code - new deprecations are flagged
3. Fix one module at a time
4. Run `dcm init --baseline` to update after each sprint

## Violations

- `lib/legacy_code.dart` - Contains existing deprecated usages
- `lib/new_code.dart` - New code using deprecated APIs (should be flagged)

## Run Analysis

```bash
dcm analyze lib
```
