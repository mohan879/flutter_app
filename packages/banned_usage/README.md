# banned-usage Examples

This directory contains working examples demonstrating the `banned-usage` rule
from [Dart Code Metrics](https://dcm.dev/docs/rules/common/banned-usage).

## Examples

| Example                                                   | Violations |
| --------------------------------------------------------- | ---------- |
| [custom_wrappers](./custom_wrappers/)                     | 5          |
| [dangerous_apis](./dangerous_apis/)                       | 8          |
| [immutability_patterns](./immutability_patterns/)         | 10         |
| [design_system_enforcement](./design_system_enforcement/) | 14         |
| [state_management_bans](./state_management_bans/)         | 7          |
| [api_layer_control](./api_layer_control/)                 | 9          |
| [logging_control](./logging_control/)                     | 8          |
| [storage_control](./storage_control/)                     | 5          |
| [regex_patterns](./regex_patterns/)                       | 14         |
| [path_based_restrictions](./path_based_restrictions/)     | 4          |
| [constructor_bans](./constructor_bans/)                   | 8          |
| [test_code_isolation](./test_code_isolation/)             | 5          |
| [analytics_control](./analytics_control/)                 | 5          |
| [memory_management](./memory_management/)                 | 2          |
| [security_sensitive](./security_sensitive/)               | 6          |
| [exclude_paths_exceptions](./exclude_paths_exceptions/)   | 4          |

## Running Examples

Each example is a standalone Dart project. To analyze:

```bash
cd <example_folder>
dcm analyze lib
```

## Documentation

See the full documentation with explanations:
[banned-usage](https://dcm.dev/docs/rules/common/banned-usage)
