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

Before a commit, branch, or pull request, read `neocom-meta/.dsh/templates/`. If the user has stored an example there, use it. When the user provides a new example in the conversation, append it to the matching template file and use it from then on.

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

**Safety:** no git config changes; no force push to main/master; amend only per user rules; commit **only** when the user asks, or when `/neocom-git`, `/git:commit`, or `/git:pr` is invoked to commit. **OpenSpec apply does not authorize a commit** — after apply, **stop before committing** and leave the working tree for developer review; commit only when they explicitly request it. **OpenSpec branch base:** default `develop`; if other `feature/*` tips are ahead of `develop`, **ask** before stacking onto a sibling (do not silently fan every apply from `develop`). See `/neocom-git` OpenSpec feature flow. `/git:commit <project>` commits on the current branch only; `/git:pr` also prepares the pull request. See `.dsh/skills/git-commit/SKILL.md` and `.dsh/skills/git-pr/SKILL.md`.

## PR workflow

1. Parallel: status, diff, upstream tracking, `git log` + `git diff [base]...HEAD`
2. `git push -u origin HEAD` if no upstream
3. After an OpenSpec apply, do not commit and do not open a pull request. The developer reviews the code first; commit only when they ask (`/git:commit` / `/git:pr` / explicit commit language).
4. When the user says that review and testing are done, `gh pr create` with base `develop` and head `feature/<feature-name>`. If `.dsh/templates/pull-requests.md` has a user example, use that title and body.

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
6. **Same turn:** update `neocom-meta/openspec/DELIVERY-INDEX.md` for every OpenSpec id in the PR body (PR `#N`, URL, head SHA, state `open`). On merge / validate / archive, refresh that index as in `/neocom-git` → OpenSpec delivery index. Prefer the index (and graphify) over repeated GitHub API calls for traceability.
7. The next OpenSpec apply creates a new `feature/<name>` from `develop`. Do not stack it on the feature branch that already has a pull request.
8. After product validation on develop, run **`/git:release`** to open `develop` → `main` titled `Release-` plus GitVersion `MajorMinorPatch` listing **OpenSpec to validate**. Validate those changes while the PR is open. After merge, run **`/git:release-done`** to archive them (+ L1 §6.7). Do not archive while the Release PR is open. See `/neocom-git` § OpenSpec feature flow and delivery-control §C–D.

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
| Feature (front/back) | `feature/<feature-name>`; default from `develop`; ask before stacking onto a sibling ahead of `develop`. See `.dsh/templates/branch-names.md` |
| Feature (`neocom-meta`) | `feature/agents` (default) or `feature/cicd` (when commanded). Rebase cicd onto agents or develop when the user asks. See `.dsh/templates/branch-names.md` |
| Fix | `fix/…` from `develop` |
| Release | `release/x.y.z` |
| Tags | `vX.Y.Z` (only when user requests a release tag) |

### Version before a pull request (hooks own it)

Do **not** run `version:sync` as an agent chore or invent a version commit.

| Repository | Who writes the version |
| --- | --- |
| `neocom-front` / `neocom-back` | `.githooks/pre-commit` + GitHub `version-sync` → GitVersion `MajorMinorPatch` |
| `neocom-domain` | **GitHub Actions only** (no GitVersion, no local version hooks): push → **patch** + publish; PR→develop → **minor**; PR→main → **major** |
| `neocom-meta` | No package version |

Do not write GitVersion `SemVer` on apps or domain. Do not use bare `npm version` on apps (hooks/GitVersion). Domain uses `npm version patch|minor|major --no-git-tag-version`. Front/back depend on **registry** `neocom-domain`, not `file:../neocom-domain`, when CI must resolve the package.
**Checklist before tagging / promoting:**

- [ ] App version files match hooks/CI (no manual SemVer edit)
- [ ] Relevant tests green (or deferred with reason)
- [ ] OpenSpec change status noted
- [ ] The release stays inside the repository that owns it
- [ ] No secrets in tree or CI config (`INFRA-039`)

**Promotions:** note `dev → staging → prod` only when defined. Pending `INFRA-036` … `INFRA-039` — do not invent undeclared deploy targets or CD pipelines until `/epic:extract` registers them.

## Versioning

Apps: GitVersion `MajorMinorPatch` via hooks/CI. Domain: distribute/publish-led (see `/neocom-git` Versioning). Do not store GitVersion `SemVer` in `package.json`.

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
