# Analytics and Crash Reporting Control Example

Demonstrates centralizing analytics through an AnalyticsService.

## What This Example Shows

- Banning `FirebaseAnalytics.instance` to enforce AnalyticsService
- Banning `FirebaseAnalytics.logEvent` to enforce centralized tracking
- Banning `FirebaseCrashlytics.instance/recordError` to enforce CrashReporter

## Run Analysis

```bash
dcm analyze lib
```

## Why Centralized Analytics Matters

Direct Firebase calls cause:

- Inconsistent event names
- No consent checks (GDPR)
- Scattered analytics logic
- Hard to switch providers

AnalyticsService provides:

- Type-safe events
- Automatic consent checking
- Easy provider switching
- Consistent naming conventions

## Expected Violations

The `scattered_analytics.dart` file contains direct Firebase calls.
