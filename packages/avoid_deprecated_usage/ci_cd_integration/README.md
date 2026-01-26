# CI/CD Integration Example

Demonstrates integrating deprecation checking into CI pipeline.

## GitHub Actions Workflow

```yaml
name: Code Analysis
on: [push, pull_request]
jobs:
  analyze:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: dart pub global activate dcm
      - run: dcm analyze --fatal-warnings
```

## Rule Configuration

- `severity: error` ensures CI fails on deprecated usage
- Use `--fatal-warnings` to fail on any warnings

## Violations

- `lib/deprecated_code.dart` - Uses deprecated APIs (will fail CI)

## Run Analysis

```bash
dcm analyze lib
```
