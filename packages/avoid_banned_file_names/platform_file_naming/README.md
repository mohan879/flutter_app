# Platform File Naming Example

This example demonstrates how to enforce proper platform file naming using the
`avoid-banned-file-names` rule.

## What This Example Shows

- Banning platform files without underscore separator (e.g., `fileandroid.dart`)
- Banning hardcoded environment names (e.g., `config_production.dart`)

## Correct Patterns

- `file_picker_android.dart` ✅
- `file_picker_ios.dart` ✅
- `file_picker_web.dart` ✅

## Configuration

See [analysis_options.yaml](./analysis_options.yaml) for the full configuration.

## Running

```bash
dcm analyze lib
```

## Expected Output

Violations for platform files missing underscore separator and
environment-specific files.
