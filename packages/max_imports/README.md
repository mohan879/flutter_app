# max-imports Examples

Runnable examples demonstrating the
[`max-imports`](https://dcm.dev/docs/rules/common/max-imports/) rule from Dart
Code Metrics.

Each subfolder is a standalone Dart package with:

- Configured `analysis_options.yaml` with the rule enabled (exact configs from
  documentation)
- Sample files that intentionally violate the configured import threshold
- Comments explaining which violations are expected

## Examples

| Example                                            | Violations | Demonstrates                                            |
| -------------------------------------------------- | ---------- | ------------------------------------------------------- |
| **[threshold_selection](./threshold_selection)**   | 1          | Basic threshold configuration and layer-specific limits |
| **[reduction_strategies](./reduction_strategies)** | 1          | Barrel files and facade patterns to reduce imports      |
| **[combined_rules](./combined_rules)**             | 2          | Combining max-imports with other architecture rules     |
| **[threshold_exceptions](./threshold_exceptions)** | 1          | Using file-level ignores for valid exceptions           |

## How to Use

Navigate to any example and run the DCM analyzer:

```bash
cd threshold_selection
dcm analyze lib
```

You should see `max-imports` violations matching the configured rules in
`analysis_options.yaml`.

## Learn More

Read the full rule documentation at
[DCM: max-imports](https://dcm.dev/docs/rules/common/max-imports/)
