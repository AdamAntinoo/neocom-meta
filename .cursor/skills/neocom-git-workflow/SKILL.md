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

**Safety:** no git config changes; no force push to main/master; amend only per user rules; commit only when asked or when `/neocom-git` is invoked to commit.

## PR workflow

1. Parallel: status, diff, upstream tracking, `git log` + `git diff [base]...HEAD`
2. `git push -u origin HEAD` if no upstream
3. `gh pr create`:

```bash
gh pr create --title "type(scope): summary or branch purpose" --body "$(cat <<'EOF'
## Summary
- What changed and why
- Submodules / OpenSpec changes included: …

## Test plan
- [ ] …
EOF
)"
```

4. Return the PR URL.

### Submodule coordination

1. Commit (+ PR) in the **child** submodule first
2. In parent `neocom`, update the submodule pointer as a **separate** commit/PR (`chore(root): bump neocom-<name> pointer` or similar)
3. Never bundle unrelated product edits into a pointer-only PR

## Release / promotion

| Item | Convention |
| --- | --- |
| Branches | `feat/…` (or `feature/…` when user-mandated), `fix/…`, `release/x.y.z` |
| Tags | `vX.Y.Z` (only when user requests a release tag) |

**Checklist before tagging / promoting:**

- [ ] Relevant tests green (or deferred with reason)
- [ ] OpenSpec change status noted
- [ ] Parent submodule SHAs synced for coordinated releases
- [ ] No secrets in tree or CI config (`INFRA-039`)

**Promotions:** note `dev → staging → prod` only when defined. Pending L2 `INFRA-036` … `INFRA-039` — do not invent undeclared deploy targets or CD pipelines until Spec Registration defines them.

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
