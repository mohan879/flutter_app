# Enforcing snake_case Example

This example demonstrates how to enforce `snake_case` file naming conventions
using the `avoid-banned-file-names` rule.

## What This Example Shows

- Banning kebab-case file names (`home-screen.dart`)
- Banning files with spaces (`auth bloc.dart`)
- Banning double underscores (`user__service.dart`)

## Configuration

See [analysis_options.yaml](./analysis_options.yaml) for the full configuration.

## Running

```bash
dcm analyze lib
```

## Expected Output

3 violations should be detected for files not following snake_case convention.
