---
name: neocom-git-workflow
description: >-
  NEOCOM git workflow templates for Conventional Commits, PRs, submodule
  pointer updates, and release checklists. Use when /neocom-git-workflow is
  invoked or when /neocom-git needs detailed commit/PR/release steps.
disable-model-invocation: true
---

# NEOCOM Git workflow

Primary entry: **`/neocom-git`** agent. This skill is the detailed playbook (slash `/neocom-git-workflow`).

VCS only — do not implement product features.

## Templates first

Before a commit, branch, or pull request, read `neocom-meta/.cursor/templates/`. If the user has stored an example there, use it. When the user provides a new example in the conversation, append it to the matching template file and use it from then on.

## Commit workflow

1. Orient in the correct repo (parent `neocom` or a submodule cwd):
   - `git status`
   - `git diff` and `git diff --staged`
   - `git log` (recent style)
2. Draft Conventional Commit:

```text
<type>(<scope>): <short summary>

<optional body — why>

<optional footer: Refs, Breaks, etc.>
```

| Types | Scopes (examples) |
| --- | --- |
| feat, fix, docs, chore, refactor, test, build, ci, style, perf, revert | front, meta, back, openspec, root, infra, login, init |

3. Stage relevant paths only (no `.env` / credentials).
4. Commit via HEREDOC:

```bash
git commit -m "$(cat <<'EOF'
type(scope): short summary

Why this change matters.

EOF
)"
```

5. Verify with `git status`.

**Safety:** no git config changes; no force push to main/master; amend only per user rules; commit only when asked, when `/neocom-git` or `/neo:pr` is invoked to commit, or when an OpenSpec feature apply is in progress. That apply instructs this agent to commit on `feature/<feature>` created from `develop`. `/neo:pr` also prepares the pull request; see `.cursor/skills/neo-pr/SKILL.md`.

## PR workflow

1. Parallel: status, diff, upstream tracking, `git log` + `git diff [base]...HEAD`
2. `git push -u origin HEAD` if no upstream
3. After an OpenSpec apply, do not open a pull request. The user reviews the branch and tests first.
4. When the user says that review and testing are done, `gh pr create` with base `develop` and head `feature/<feature-name>`. If `.cursor/templates/pull-requests.md` has a user example, use that title and body.

```bash
gh pr create --base develop --title "type(scope): summary or branch purpose" --body "$(cat <<'EOF'
## Summary
- What changed and why
- Submodules / OpenSpec changes included: …

## Test plan
- [ ] …
EOF
)"
```

5. Return the PR URL. Do not merge.
6. The next OpenSpec apply creates a new `feature/<name>` from `develop`. Do not stack it on the feature branch that already has a pull request.
7. When the OpenSpec change is archived, open a separate pull request from `develop` into `main` for review and approval. Do not merge it.

### Submodule coordination

1. Commit (+ PR) in the **child** submodule first
2. In parent `neocom`, update the submodule pointer as a **separate** commit/PR (`chore(root): bump neocom-<name> pointer` or similar)
3. Never bundle unrelated product edits into a pointer-only PR

## Release / promotion

| Item | Convention |
| --- | --- |
| Integration | `develop` (do not branch feature work from `main` while `develop` is the integration branch) |
| Feature | `feature/<feature-name>` created from `develop`. See `.cursor/templates/branch-names.md` |
| Fix | `fix/…` from `develop` |
| Release | `release/x.y.z` |
| Tags | `vX.Y.Z` (only when user requests a release tag) |

**Checklist before tagging / promoting:**

- [ ] Relevant tests green (or deferred with reason)
- [ ] OpenSpec change status noted
- [ ] Parent submodule SHAs synced for coordinated releases
- [ ] No secrets in tree or CI config (`INFRA-039`)

**Promotions:** note `dev → staging → prod` only when defined. Pending L2 `INFRA-036` … `INFRA-039` — do not invent undeclared deploy targets or CD pipelines until Spec Registration defines them.

## Versioning

`/neocom-git` owns Node library versions. The package version is GitVersion `MajorMinorPatch` (`X.Y.Z`). Do not store `SemVer` in `package.json`; that variable adds a branch pre-release label.

Before a release, review `version:sync` and any `scripts/release.mjs`. Both must call `gitversion /nocache /showvariable MajorMinorPatch`. Correct a script that still uses `SemVer`. Do not use `npm version`.

## Examples

```text
feat(front): add WireMock base URL for local dev

Local UI must not depend on neocom-back during scaffolding.
```

```text
chore(root): bump neocom-meta submodule pointer

Pick up neocom-git agent and commit conventions.
```

```text
docs(openspec): register front-toolchain infrastructure change
```
