---
name: neocom-git-workflow
description: >-
  NEOCOM git workflow templates for Conventional Commits, PRs, and release
  checklists. Each repository is an independent project. Use when /neocom-git-workflow is
  invoked or when /neocom-git needs detailed commit/PR/release steps.
disable-model-invocation: true
---

# NEOCOM Git workflow

Primary entry: **`/neocom-git`** agent. This skill is the detailed playbook (slash `/neocom-git-workflow`).

VCS only — do not implement product features.

## Templates first

Before a commit, branch, or pull request, read `neocom-meta/.cursor/templates/`. If the user has stored an example there, use it. When the user provides a new example in the conversation, append it to the matching template file and use it from then on.

## Commit workflow

1. Orient in the repository that owns the change:
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

**Safety:** no git config changes; no force push to main/master; amend only per user rules; commit only when asked, when `/neocom-git`, `/git:commit`, or `/git:pr` is invoked to commit, or when an OpenSpec feature apply is in progress. That apply instructs this agent to commit on `feature/<feature>` created from `develop`. `/git:commit <project>` commits on the current branch only; `/git:pr` also prepares the pull request. See `.cursor/skills/git-commit/SKILL.md` and `.cursor/skills/git-pr/SKILL.md`.

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
7. When the OpenSpec change is archived, open a separate pull request from `develop` into `main` for review and approval. Do not merge it. Its title is `Release-` plus GitVersion `MajorMinorPatch`.

### Title for `develop` into `main`

A pull request into `develop` keeps a Conventional Commit title. A pull request from `develop` into `main` is a release. Title it `Release-<MajorMinorPatch>`, for example `Release-0.1.0`.

Calculate that value on a branch named `main` after merging `origin/develop` into `origin/main` in a temporary worktree:

```bash
gitversion /nocache /showvariable MajorMinorPatch
```

Remove the worktree and restore the local `main` pointer afterwards. Do not push that merge. Use `MajorMinorPatch` only. Do not put a `SemVer` pre-release label in the title.

### Independent repositories

Each repository is its own project. The parent `neocom` repository is deprecated. Do not update a submodule pointer. A commit and its pull request stay in the repository that owns the change.

## Release / promotion

| Item | Convention |
| --- | --- |
| Integration | `develop` (do not branch feature work from `main` while `develop` is the integration branch) |
| Feature (front/back) | `feature/<feature-name>` created from `develop`. See `.cursor/templates/branch-names.md` |
| Feature (`neocom-meta`) | `feature/agents` (default) or `feature/cicd` (when commanded). Rebase cicd onto agents or develop when the user asks. See `.cursor/templates/branch-names.md` |
| Fix | `fix/…` from `develop` |
| Release | `release/x.y.z` |
| Tags | `vX.Y.Z` (only when user requests a release tag) |

### Version sync before a pull request (mandatory)

Do not open a pull request until the package version matches GitVersion `MajorMinorPatch`.

| Repository | Command |
| --- | --- |
| `neocom-front` | `nvm use` then `npm run version:sync` — updates `package.json`, both `appVersion` fields, `index.html` loading text, Cypress version expectation, and `.app-banner.txt` |
| `neocom-back` | `nvm use` then `npm run version:sync` |
| Node libraries | `npm run version:sync` when in scope |

Commit any files that command changes on the feature branch, then open the PR. Use `MajorMinorPatch` only. Do not write `SemVer`. Do not use `npm version`.

### New feature branch in `neocom-front`

After `feature/<feature-name>` exists from `develop`, run `npm run version:sync` early (same command as above). Run it again before the pull request if the calculated version may have moved.

**Checklist before tagging / promoting:**

- [ ] `version:sync` run; version files committed
- [ ] Relevant tests green (or deferred with reason)
- [ ] OpenSpec change status noted
- [ ] The release stays inside the repository that owns it
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
docs(meta): record that each repository is an independent project

The parent neocom repository is deprecated.
```

```text
docs(openspec): register front-toolchain infrastructure change
```
