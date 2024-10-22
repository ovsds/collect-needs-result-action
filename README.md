# Collect Needs Result Action

[![CI](https://github.com/ovsds/collect-needs-result-action/workflows/Check%20PR/badge.svg)](https://github.com/ovsds/collect-needs-result-action/actions?query=workflow%3A%22%22Check+PR%22%22)
[![GitHub Marketplace](https://img.shields.io/badge/Marketplace-Collect%20Needs%20Result-blue.svg)](https://github.com/marketplace/actions/collect-needs-result)

Collect Needs Result Action

## Usage

### Example

```yaml
jobs:
  collect-needs-result:
    permissions:
      contents: read

    steps:
      - name: Collect Needs Result
        id: collect-needs-result
        uses: ovsds/collect-needs-result-action@v1
```

### Action Inputs

| Name          | Description  | Default |
| ------------- | ------------ | ------- |
| `placeholder` | Placeholder. |         |

### Action Outputs

| Name          | Description  |
| ------------- | ------------ |
| `placeholder` | Placeholder. |

## Development

### Global dependencies

- [Taskfile](https://taskfile.dev/installation/)
- [nvm](https://github.com/nvm-sh/nvm?tab=readme-ov-file#install--update-script)

### Taskfile commands

For all commands see [Taskfile](Taskfile.yaml) or `task --list-all`.

## License

[MIT](LICENSE)
