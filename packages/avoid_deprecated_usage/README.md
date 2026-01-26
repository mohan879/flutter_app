# avoid-deprecated-usage Examples

This directory contains working examples demonstrating the
`avoid-deprecated-usage` rule from
[Dart Code Metrics](https://dcm.dev/docs/rules/common/avoid-deprecated-usage).

## Examples

| Example                                                 | Violations |
| ------------------------------------------------------- | ---------- |
| [baseline_migration](./baseline_migration/)             | 7          |
| [severity_configuration](./severity_configuration/)     | 3          |
| [combining_rules](./combining_rules/)                   | 4          |
| [package_upgrade_workflow](./package_upgrade_workflow/) | 4          |
| [ci_cd_integration](./ci_cd_integration/)               | 4          |
| [deprecation_messages](./deprecation_messages/)         | 5          |

## Running Examples

Each example is a standalone Dart project. To analyze:

```bash
cd <example_folder>
dcm analyze lib
```

## Documentation

See the full documentation with explanations:
[avoid-deprecated-usage](https://dcm.dev/docs/rules/common/avoid-deprecated-usage)
