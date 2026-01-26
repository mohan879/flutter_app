# Layer-Specific Naming Example

This example demonstrates how to enforce layer-specific file naming using the
`avoid-banned-file-names` rule.

## What This Example Shows

- Domain layer should not have widget/screen/bloc/dto files
- Data layer should not have widget/screen/bloc/entity files
- File names can reveal architectural violations before you open the code

## Configuration

See [analysis_options.yaml](./analysis_options.yaml) for the full configuration.

## Running

```bash
dcm analyze lib
```

## Expected Output

3 violations for files in wrong layers.
