# Widget vs Non-Widget Code Example

Demonstrates different thresholds for widget code (UI) vs non-widget code
(business logic).

## Problem

Widget code is compositional and often deeply nested by nature. Non-widget code
handling business logic should be simpler.

## Solution

Apply stricter thresholds to domain/business logic and more relaxed thresholds
to presentation/UI code.

## Run DCM

```sh
dcm calculate-metrics lib --reporter=console
```
