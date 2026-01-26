# Design System Widget Control

Demonstrates enforcing design system widgets over raw Flutter widgets.

## Rule Configuration

- Ban raw `Scaffold` in presentation (except in design_system folder)
- Ban `StatefulWidget` in components folder (use state management instead)

## Violations

- `lib/presentation/components/bad_counter.dart` - Uses StatefulWidget in
  components

## Run Analysis

```bash
dcm analyze lib
```
