# Tracking Without Enforcing Example

Demonstrates using `threshold: unset` to collect metric data without triggering
violations.

## Problem

Sometimes you want to collect metric data without enforcement - for establishing
baselines or dashboard tracking.

## Solution

Use `threshold: unset` to collect values that appear in reports but never
trigger violations.

## Run DCM

```sh
dcm calculate-metrics lib --reporter=console --report-all
```
