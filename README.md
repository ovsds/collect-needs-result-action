# Collect Needs Result Action

[![CI](https://github.com/ovsds/collect-needs-result-action/workflows/Check%20PR/badge.svg)](https://github.com/ovsds/collect-needs-result-action/actions?query=workflow%3A%22%22Check+PR%22%22)
[![GitHub Marketplace](https://img.shields.io/badge/Marketplace-Collect%20Needs%20Result-blue.svg)](https://github.com/marketplace/actions/collect-needs-result)

Collect Needs Result Action

## Usage

### Example

```yaml
jobs:
  collect-needs-result:
    runs-on: ubuntu-latest
    if: always() && !cancelled()

    needs:
      - job1
      - job2

    permissions:
      contents: read

    steps:
      - name: Collect Needs Result
        id: collect-needs-result
        uses: ovsds/collect-needs-result-action@v1
        with:
          needs_json: ${{ toJson(needs) }}
```

### Action Inputs

| Name                | Description                                                | Default |
| ------------------- | ---------------------------------------------------------- | ------- |
| `needs_json`        | `${{ toJson(needs) }}` passed directly as input            |         |
| `cancelled_allowed` | If `true`, cancelled jobs won't fail the action            | `false` |
| `failure_allowed`   | If `true`, failed jobs won't fail the action               | `false` |
| `skipped_allowed`   | If `true`, skipped jobs won't fail the action              | `true`  |
| `success_allowed`   | If `true`, successful jobs won't fail the action           | `true`  |
| `fail_on_failure`   | If `true`, the action will fail if total result is failure | `true`  |

### Action Outputs

| Name     | Description  |
| -------- | ------------ |
| `result` | Total result |

## Development

### Global dependencies

- [Taskfile](https://taskfile.dev/installation/)
- [nvm](https://github.com/nvm-sh/nvm?tab=readme-ov-file#install--update-script)

### Taskfile commands

For all commands see [Taskfile](Taskfile.yaml) or `task --list-all`.

## License

[MIT](LICENSE)
