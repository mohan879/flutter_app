# Tracking with Entries Example

Demonstrates using `threshold: unset` in entries for specific paths.

## Problem

You want to enforce coupling thresholds generally, but DI/injection code
naturally has high coupling.

## Solution

Use `threshold: unset` in entries for specific paths - data is collected but no
violations triggered.

## Run DCM

```sh
dcm calculate-metrics lib --reporter=console
```

Files in `lib/di/` and `lib/injection/` will have their coupling values tracked
but won't trigger violations.
