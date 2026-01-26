# avoid-banned-file-names Examples

This folder contains runnable examples demonstrating the
`avoid-banned-file-names` rule from
[Dart Code Metrics](https://dcm.dev/docs/rules/common/avoid-banned-file-names).

## Examples

| Example                                                      | Description                                                   | Expected Violations |
| ------------------------------------------------------------ | ------------------------------------------------------------- | ------------------- |
| [enforcing_snake_case](./enforcing_snake_case)               | Ban kebab-case, spaces, double underscores                    | 3                   |
| [avoiding_generic_file_names](./avoiding_generic_file_names) | Ban vague names like utils.dart, helpers.dart, manager suffix | 3                   |
| [layer_specific_naming](./layer_specific_naming)             | Layer-specific naming violations (domain/data)                | 3                   |
| [test_file_boundaries](./test_file_boundaries)               | Test/mock/fake files in lib/                                  | 3                   |
| [generated_file_patterns](./generated_file_patterns)         | Non-standard generated file patterns                          | 2                   |
| [platform_file_naming](./platform_file_naming)               | Platform file naming violations                               | 3                   |
| [deprecated_and_backup_files](./deprecated_and_backup_files) | Old/backup/deprecated file patterns                           | 4                   |

## Running the Examples

Each example can be analyzed independently:

```bash
cd <example_folder>
dcm analyze lib
```

## Documentation

Full documentation for this rule is available at:

- [avoid-banned-file-names](https://dcm.dev/docs/rules/common/avoid-banned-file-names)
