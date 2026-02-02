# Metrics with Rules Example

Demonstrates how metrics and architecture rules work together to enforce code
quality.

## Problem

High coupling often indicates boundary violations. How do metrics and rules
complement each other?

## Solution

- **Metrics** are observational: they measure what exists (high coupling
  detected)
- **Rules** are prescriptive: they prevent specific violations (banned imports)

When coupling violations correlate with import rule violations, you've found a
structural issue.

## Run DCM

```sh
# See both metric violations and rule violations
dcm analyze lib --reporter=console
```

Expected output:

1. `coupling-between-object-classes` violation in presentation (metric)
2. `avoid-banned-imports` violation for data layer import (rule)

The metric tells you something's wrong; the rule tells you what specifically.
