# Critical Code Protection Example

Demonstrates non-ignorable metrics for critical paths like payments and
authentication.

## Problem

Critical code (payments, auth, migrations) shouldn't allow developers to add
`// ignore:` comments and bypass quality checks.

## Solution

Use `ignorable: false` to prevent suppression of violations in critical code
paths.

## Run DCM

```sh
dcm calculate-metrics lib --reporter=console
```
