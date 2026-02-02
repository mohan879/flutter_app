# Comprehensive Metrics Example

Demonstrates combining widget and non-widget metric patterns in one
configuration.

## Problem

Real apps have both widget and non-widget code that need different standards.

## Solution

Configure multiple metrics with path-specific thresholds that match each code
type.

## Run DCM

```sh
dcm calculate-metrics lib --reporter=console
```
