# Agent instructions

## Expected failing checks

The `mock-failure` job and every `mock-failure-matrix` entry in `.github/workflows/e2e.yaml` fail on every run by
design: entry 2 exits 1, and fail-fast may cancel the others. They are inputs for the `e2e-*` jobs, which check how
the action collects a failed need.

- Treat these checks as passing: never rerun, fix or park them, and never let them keep a PR from review.
- The E2E result is the `e2e-*` jobs and the `e2e` collector; any of them red is a real failure.
