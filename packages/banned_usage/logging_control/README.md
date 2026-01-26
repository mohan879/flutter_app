# Logging and Debugging Control Example

Demonstrates banning raw print statements to enforce structured logging.

## What This Example Shows

- Banning `print()` to enforce `Logger.d/i/w/e()` (error severity)
- Banning `debugPrint()` to enforce Logger service (warning severity)
- Banning `debugger()` calls in production code (error severity)

## Run Analysis

```bash
dcm analyze lib
```

## Why Structured Logging Matters

Raw `print()` has problems:

- No log levels (debug, info, warning, error)
- Stays in production builds
- No context or structured data
- Hard to filter or search

A logging service provides:

- Leveled output (debug stripped in release)
- Structured data for remote logging
- Automatic filtering in release builds
- Consistent formatting

## Expected Violations

The `raw_logging.dart` file contains violations for using print statements.
