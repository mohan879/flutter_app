# avoid-banned-exports Examples

Runnable examples demonstrating the
[`avoid-banned-exports`](https://dcm.dev/docs/rules/common/avoid-banned-exports/)
rule from Dart Code Metrics.

Each subfolder is a standalone Dart package with:

- Configured `analysis_options.yaml` with the rule enabled (exact configs from
  documentation)
- Sample exports that intentionally violate the configuration
- Comments explaining which violations are expected

## Examples

| Example                                                                | Demonstrates                                                                                   |
| ---------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| **[package_api_boundary](./package_api_boundary)**                     | Blocking internal implementations, test utilities, and generated files from public barrel      |
| **[clean_architecture_layers](./clean_architecture_layers)**           | Enforcing dependency rules across domain/data/presentation layers                              |
| **[wrapping_external_dependencies](./wrapping_external_dependencies)** | Preventing HTTP clients and database library leakage from public APIs                          |
| **[platform_specific_code](./platform_specific_code)**                 | Blocking direct platform file exports in favor of conditional exports                          |
| **[design_system_package](./design_system_package)**                   | Hiding internal utilities (`_impl`, `_utils`, `_calc`) from design system barrel exports       |
| **[exclude_paths_exceptions](./exclude_paths_exceptions)**             | Using `exclude-paths` to create targeted exceptions for specific folders                       |
| **[monorepo_package_isolation](./monorepo_package_isolation)**         | Enforcing package boundaries across multiple local packages in a monorepo (single root config) |

## How to Use

Navigate to any example and run the DCM analyzer:

```bash
cd package_api_boundary
dcm analyze lib
```

For monorepo example, analyze from the root:

```bash
cd monorepo_package_isolation
dcm analyze packages
```

You should see `avoid-banned-exports` violations matching the configured rules
in `analysis_options.yaml`.

## Learn More

Read the full rule documentation at
[DCM: avoid-banned-exports](https://dcm.dev/docs/rules/common/avoid-banned-exports/)
