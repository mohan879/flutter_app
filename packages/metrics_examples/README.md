# Metrics Examples

This directory contains example projects demonstrating advanced DCM (Dart Code
Metrics) configuration patterns. Each example corresponds to a specific problem
and solution documented in the
[DCM Metrics Guide](https://dcm.dev/docs/guides/advanced-metrics-configuration).

## Examples

| Example                                                       | Problem   | Description                                                   |
| ------------------------------------------------------------- | --------- | ------------------------------------------------------------- |
| [**tracking_without_enforcing**](tracking_without_enforcing/) | Problem 5 | Track metrics without failing builds using `threshold: unset` |
| [**tracking_with_entries**](tracking_with_entries/)           | Problem 5 | Track specific paths differently while still collecting data  |
| [**team_thresholds**](team_thresholds/)                       | Problem 6 | Different thresholds for different team-owned code paths      |
| [**critical_code_protection**](critical_code_protection/)     | Problem 4 | Non-ignorable metrics for critical paths (payments, auth)     |
| [**calibrated_effort**](calibrated_effort/)                   | Problem 7 | Estimated fix times with custom effort values per metric      |
| [**metrics_with_rules**](metrics_with_rules/)                 | Problem 8 | Combine metrics with architecture rules for layer enforcement |
| [**progress_metrics**](progress_metrics/)                     | Problem 3 | Staged rollout with legacy code thresholds                    |
| [**legacy_code_thresholds**](legacy_code_thresholds/)         | Problem 3 | Higher thresholds for legacy modules during migration         |
| [**widget_specific_metrics**](widget_specific_metrics/)       | Problem 2 | Widget-specific thresholds (nesting depth for UI code)        |
| [**widget_vs_nonwidget**](widget_vs_nonwidget/)               | Problem 2 | Different metrics for widgets vs business logic               |
| [**comprehensive_metrics**](comprehensive_metrics/)           | Problem 1 | Full metrics setup with multiple thresholds                   |

## Usage

Each example is a standalone Dart/Flutter project. To test an example:

```sh
cd <example_name>
dcm calculate-metrics lib --reporter=console
```

For rule-based examples:

```sh
dcm analyze lib --reporter=console
```

## Related Packages

- [avoid_banned_imports](../avoid_banned_imports/) - Import restriction rules
- [avoid_banned_types](../avoid_banned_types/) - Type restriction rules
- [max_imports](../max_imports/) - Import count limits
- [banned_usage](../banned_usage/) - API usage restrictions

## Documentation

See the full documentation with detailed explanations in
[doc.mdx](../../doc.mdx).
