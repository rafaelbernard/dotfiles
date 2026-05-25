---
name: check-environment-readiness
description: Produce a repo-specific local setup checklist with commands covering runtimes, dependencies, env vars, databases, and smoke tests. Use when setting up a development environment for the first time.
---

# Check Environment Readiness

Produce a repo-specific local setup checklist with commands.

## Rules

- Only include steps you can justify from files in the repo (README, Makefile, package/build files, scripts, devcontainer config).
- Include: required runtimes, dependency install, env vars, database setup, migrations/seeds, and "run server / run worker / run UI".
- End with a smoke test of one key flow.
