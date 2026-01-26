# avoid-banned-imports Examples

This directory contains runnable examples demonstrating various configurations
for DCM's `avoid-banned-imports` rule.

## Examples Overview

| Example                                                           | Description                                | Violations |
| ----------------------------------------------------------------- | ------------------------------------------ | ---------- |
| [clean_architecture_layers](./clean_architecture_layers/)         | Domain/data/presentation layer enforcement | 3          |
| [state_management_boundaries](./state_management_boundaries/)     | Ban BLoC/Riverpod in domain/data layers    | 2          |
| [feature_module_isolation](./feature_module_isolation/)           | Features cannot import each other          | 2          |
| [core_module_protection](./core_module_protection/)               | Core cannot depend on features             | 2          |
| [test_file_import_control](./test_file_import_control/)           | Control what tests can import              | 2          |
| [platform_specific_imports](./platform_specific_imports/)         | Isolate dart:io and dart:html              | 2          |
| [third_party_library_control](./third_party_library_control/)     | Standardize on one library per purpose     | 3          |
| [monorepo_package_dependencies](./monorepo_package_dependencies/) | Package dependency flow in monorepo        | 2          |
| [build_and_generated_code](./build_and_generated_code/)           | Ban direct imports of generated files      | 1          |
| [exclude_paths_exceptions](./exclude_paths_exceptions/)           | Demo exclude-paths usage                   | 1          |

## Running Examples

Each example is a standalone Dart package. To analyze:

```bash
cd <example_folder>
dcm analyze lib
# or for test examples:
dcm analyze lib test
```

## Documentation

See the full documentation at:

- [avoid-banned-imports rule docs](https://dcm.dev/docs/rules/common/avoid-banned-imports/)
