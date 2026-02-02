# Team Thresholds Example

Demonstrates per-team threshold configuration in a monorepo.

## Problem

Different teams have different maturity levels and needs. Platform team wants
strict coupling. Feature teams need flexibility.

## Solution

Configure path-specific thresholds that match each team's responsibilities.

## Run DCM

```sh
dcm calculate-metrics packages --reporter=console
```
