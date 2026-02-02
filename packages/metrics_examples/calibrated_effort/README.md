# Calibrated Effort Example

Demonstrates custom effort estimates that match your team's actual experience.

## Problem

Default effort estimates (15 min per violation) don't match reality. Your team's
actual fix times are different.

## Solution

Calibrate `effort` values per metric based on your team's actual experience.

## Run DCM

```sh
dcm calculate-metrics lib --reporter=console
```

The output will show calibrated effort values:

- cyclomatic-complexity violations: 30 min each
- coupling-between-object-classes violations: 90 min each
- weighted-methods-per-class violations: 60 min each
- source-lines-of-code violations: 20 min each
