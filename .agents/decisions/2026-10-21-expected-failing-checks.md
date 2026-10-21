# Expected failing checks

- Context: [AGENTS.md § Expected failing checks](../../AGENTS.md#expected-failing-checks)
- Source: conversation 2026-10-21 - "Add this repo as an exclusion, add context about expected failures to the repo
  context"
- Supersedes: -

The `mock-failure` and `mock-failure-matrix` checks count as passing; the E2E result is the `e2e-*` jobs and the `e2e`
collector.

Why: those mock jobs fail on purpose so the e2e jobs can collect a failure, and treating them as real failures kept a
green PR parked as a draft instead of in review.
