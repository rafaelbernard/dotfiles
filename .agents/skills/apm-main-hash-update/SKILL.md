---
name: apm-main-hash-update
description: Update a project's APM dependencies to the latest commit of each source's default branch, then pin every dependency in apm.yml to that commit hash instead of a moving branch like main or master. Use when the user says "update apm", "pin apm dependencies", "apm hash update", or wants apm.yml refs to be commit hashes.
---

# APM main hash update

Refresh the APM dependencies of the current project, then replace the branch refs in `apm.yml` with the commit hashes APM resolved. Skills and agents are instructions a model follows, so a version bump should be an explicit, reviewable diff, not a branch that moves under you.

## Tasks

1. **Check the project.** `apm.yml` and `apm.lock.yaml` must exist in the current directory. Run `apm --version`. If `apm.yml` or `apm.lock.yaml` have uncommitted changes, say so and ask before going on.
2. **Save a copy.** Copy `apm.yml` and `apm.lock.yaml` to a temporary directory so you can restore them if a step fails.
3. **Classify each entry under `dependencies.apm`.**
   - Remote entry: `[host/]owner/repo[/path][#ref]`. Handle these.
   - Local path (`./`, `../`, `/`) or any entry that is not a plain string: leave it untouched and list it in the report.
4. **Point each remote entry at its default branch**, so `apm update` is allowed to move it. `apm update` retains an entry pinned to a hash, so this step is required.
   - Find the branch with `gh repo view owner/repo --json defaultBranchRef -q .defaultBranchRef.name`, or `git ls-remote --symref https://<host>/<owner>/<repo> HEAD`.
   - Rewrite the entry as `…#<branch>`, replacing any existing ref (a hash, a tag or a branch).
5. **Run `apm update --yes` in the project.** Never pass `-g`: that updates the user-wide dependencies, not this project.
6. **Pin from the lock.** For each remote entry, find its block in `apm.lock.yaml` by `repo_url` plus `virtual_path` (just `repo_url` when there is no `virtual_path`) and read `resolved_commit`. Rewrite the entry as `…#<full 40-character hash>`. Read the lock with plain text matching on the `- repo_url:` blocks; do not assume a YAML library is installed.
7. **Reconcile the lock.** Run `apm install` (without `--frozen`). It rewrites `resolved_ref` in the lock from the branch to the hash and keeps the commits.
8. **Verify.** `apm install --frozen` must succeed, and `apm update --dry-run` must report that the revision pins are retained and nothing is updated. If either fails, restore the saved copies and report the output.
9. **Report.** One line per dependency whose hash changed: source, old short hash, new short hash, and the compare link `https://github.com/<owner>/<repo>/compare/<old>...<new>`. Also list unchanged entries as a count and any skipped entries by name. Tell the user to read the compare links before committing, because the changes land in instructions the model will follow.

## Constraints

- Never commit, push or open a pull request. Leave the changed `apm.yml` and `apm.lock.yaml` for the user.
- Never run `apm update` or `apm install` with `-g`, and never use `--force`.
- If APM says another operation is running, stop and tell the user. Do not kill the process.
- Do not edit the generated directories (`.agents/`, `.claude/`, `.kiro/`, `.codex/`, `apm_modules/` and similar). `apm install` owns them.
- Never print tokens or credentials. If authentication fails, run `apm auth` or `apm doctor` and report what they say.
- Do not add dependencies, change `targets`, or reformat the rest of `apm.yml`; change only the refs.
