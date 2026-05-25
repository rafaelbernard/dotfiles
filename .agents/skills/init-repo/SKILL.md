---
name: init-repo
description: Onboard to a repository by identifying architecture, directory responsibilities, runtime boundaries, and producing a Mermaid dependency diagram. Use when exploring a new codebase for the first time.
---

# Init Repo

You are onboarding me to this repository.

## Tasks

- Identify the top-level architecture (apps/services/libraries), and what each does.
- Produce a directory map: top 10 directories with responsibilities.
- Identify key runtime boundaries: API layer, domain layer, persistence, async jobs, config.
- Show a dependency diagram (Mermaid) using the repo's actual module/package boundaries.
- Cite exact files for each claim (paths + brief evidence).

## Constraints

- Do not edit files.
- Prefer reading docs first (README, AGENTS.md, CLAUDE.md, docs/, CONTRIBUTING, ADRs) and then code.
- If the repo is a monorepo, explain the workspace/tooling setup.

## Diagram

Create a mermaid diagram with your findings.
