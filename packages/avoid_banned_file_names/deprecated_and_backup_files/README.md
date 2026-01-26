# Deprecated and Backup Files Example

This example demonstrates how to detect deprecated/backup file patterns using
the `avoid-banned-file-names` rule.

## What This Example Shows

- Banning deprecated/backup markers (`*_old.dart`, `*_backup.dart`)
- Banning copy markers (`*_copy.dart`, `*_copy2.dart`)
- Banning inline version numbers (`*_v2.dart`, `*V2.dart`)

## What to Do Instead

- Use `@deprecated` annotation for deprecated code
- Use version control (git) for file history
- Delete duplicate/backup files

## Configuration

See [analysis_options.yaml](./analysis_options.yaml) for the full configuration.

## Running

```bash
dcm analyze lib
```

## Expected Output

3 violations for deprecated/backup/versioned file patterns.
