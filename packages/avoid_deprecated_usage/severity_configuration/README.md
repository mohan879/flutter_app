# Severity Configuration Example

Demonstrates using different severity levels for CI vs local development.

## Rule Configuration

- `analysis_options.yaml` - CI config with `severity: error` (fails build)
- `analysis_options_local.yaml` - Local config with `severity: warning` (IDE
  only)

## Usage

**CI/CD:**

```bash
dcm analyze lib  # Uses analysis_options.yaml (error severity)
```

**Local Development:**

```bash
dcm analyze lib --options=analysis_options_local.yaml  # Warning only
```

## Violations

- `lib/deprecated_usage.dart` - Uses deprecated APIs (error in CI, warning
  locally)

## Run Analysis

```bash
dcm analyze lib
```
