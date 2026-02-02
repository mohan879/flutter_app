# Progress Metrics Example

Demonstrates comprehensive metric collection for leadership reporting and
baseline establishment.

## Problem

Leadership asks "Is code quality improving?" You need actual data to answer.

## Solution

Configure all metrics with `threshold: unset` to collect comprehensive data
without enforcement. Use `--report-all` to capture all values for dashboard
upload.

## Run DCM

```sh
# Collect baseline data
dcm calculate-metrics lib --report-all --reporter=json --output-to=baseline.json

# Console view
dcm calculate-metrics lib --report-all --reporter=console
```

## Dashboard Upload

```sh
dcm run lib --all --upload --project=PROJECT_KEY --email=LICENSE_EMAIL
```
