# avoid-banned-types Examples

This directory contains working examples demonstrating the `avoid-banned-types`
rule from
[Dart Code Metrics](https://dcm.dev/docs/rules/common/avoid-banned-types).

## Examples

| Example                                                           | Violations |
| ----------------------------------------------------------------- | ---------- |
| [clean_architecture_boundaries](./clean_architecture_boundaries/) | 4          |
| [preventing_anti_patterns](./preventing_anti_patterns/)           | 4          |
| [platform_specific_types](./platform_specific_types/)             | 1          |
| [state_management_isolation](./state_management_isolation/)       | 3          |
| [design_system_widget_control](./design_system_widget_control/)   | 1          |
| [dependency_injection_control](./dependency_injection_control/)   | 1          |
| [test_types_control](./test_types_control/)                       | 2          |
| [positions_option](./positions_option/)                           | 4          |
| [exclude_paths_exceptions](./exclude_paths_exceptions/)           | 3          |

## Running Examples

Each example is a standalone Dart project. To analyze:

```bash
cd <example_folder>
dcm analyze lib
```

## Documentation

See the full documentation with explanations:
[avoid-banned-types](https://dcm.dev/docs/rules/common/avoid-banned-types)
