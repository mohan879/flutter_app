# Avoiding Generic File Names Example

This example demonstrates how to ban generic/vague file names using the
`avoid-banned-file-names` rule.

## What This Example Shows

- Banning vague names like `utils.dart`, `helpers.dart`, `common.dart`
- Banning "manager" suffix which often indicates god objects

## Configuration

See [analysis_options.yaml](./analysis_options.yaml) for the full configuration.

## Running

```bash
dcm analyze lib
```

## Expected Output

Multiple violations for generic file names.
