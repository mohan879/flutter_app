# Legacy Code Thresholds Example

Demonstrates path-specific thresholds for handling legacy code.

## Problem

When enabling metrics, legacy code may have hundreds of violations that can't be
fixed immediately.

## Solution

Use `entries` to apply stricter standards to new code while allowing legacy code
to exist temporarily.

## Run DCM

```sh
dcm calculate-metrics lib --reporter=console
```
