---
name: check-tests
description: Identify the testing strategy in a repository including test organization, local confidence loops, fixtures/mocks, and common failure modes. Use when onboarding or auditing test coverage.
---

# Check Tests

Identify the testing strategy in this repo.

## Output

- Where tests live and how they're organized (unit/integration/e2e).
- The fastest local confidence loop: which commands to run before a PR.
- How fixtures/mocks/testcontainers are handled.
- Common failure modes in this repo's tests (if visible from config/docs).

## Fallback

If there is no testing strategy, propose a plan for one that follows the testing pyramid (lots of unit tests, less e2e tests).
