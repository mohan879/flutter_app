# Widget-Specific Metrics Example

Demonstrates metrics that only apply to widget code (build methods).

## Problem

Widget code has different concerns than business logic. You need widget-specific
metrics.

## Solution

Use `widgets-nesting-level` and `number-of-used-widgets` with path-specific
thresholds.

## Run DCM

```sh
dcm calculate-metrics lib --reporter=console
```
