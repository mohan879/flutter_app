# Test File Boundaries Example

This example demonstrates how to keep test files out of `lib/` using the
`avoid-banned-file-names` rule.

## What This Example Shows

- Test files (`*_test.dart`) should not be in lib/
- Mock files (`*_mock.dart`) should not be in lib/
- Fake files (`*_fake.dart`) should not be in lib/

## Configuration

See [analysis_options.yaml](./analysis_options.yaml) for the full configuration.

## Running

```bash
dcm analyze lib
```

## Expected Output

3 violations for test/mock/fake files in lib/.
