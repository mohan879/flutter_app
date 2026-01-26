# Generated File Patterns Example

This example demonstrates how to enforce standard generated file naming patterns
using the `avoid-banned-file-names` rule.

## What This Example Shows

- Banning non-standard patterns like `*_generated.dart`, `*.generated.dart`
- Banning double extensions like `*.g.g.dart` (build_runner mistakes)

## Standard Patterns (allowed)

- `*.g.dart` - json_serializable, built_value
- `*.freezed.dart` - freezed
- `*.gr.dart` - auto_route
- `*.mocks.dart` - mockito

## Configuration

See [analysis_options.yaml](./analysis_options.yaml) for the full configuration.

## Running

```bash
dcm analyze lib
```

## Expected Output

Violations for non-standard generated file patterns.
