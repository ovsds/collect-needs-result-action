# Agent instructions

## Expected failing checks

These checks of `.github/workflows/e2e.yaml` fail on every run by design. They are inputs for the `e2e-*` jobs, which
check how the action collects a failed need. Treat them as passing: never rerun, fix or park them, and never let them
keep a PR from review.

- `mock-failure` - exits 1
- `mock-failure-matrix (*)` - entry 2 exits 1, and fail-fast may cancel the others

The E2E result is the `e2e-*` jobs and the `e2e` collector; any of them red is a real failure.
