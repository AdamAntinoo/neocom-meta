---
name: git-pr
description: >-
  Commit pending work and prepare pull requests for one active project, or
  for neocom-meta, neocom-front, and neocom-back when no project is given.
  Use when /git:pr is invoked.
disable-model-invocation: true
---

# `/git:pr`

Owned by `/neocom-git`. This command is the request to commit and to prepare pull requests. Do not wait for a second confirmation.

VCS only. Do not implement product features. Do not merge.

This is a **git** command (`/git:…`), not a workflow or OpenSpec command (`/neo:…`, `/feature-delivery`, `/opsx-*`).

## Argument

The text after `/git:pr` is the project.

| Argument | Repository |
| --- | --- |
| `neocom-meta`, `meta` | `neocom-meta` |
| `neocom-front`, `front` | `neocom-front` |
| `neocom-back`, `back` | `neocom-back` |
| `neocom-domain`, `domain` | `neocom-domain` |

No argument means `neocom-meta`, `neocom-front`, and `neocom-back`. Name `neocom-domain` / `domain` explicitly to include the library. Each one is an independent project. Skip a folder that is missing or is not a git checkout, and say which one was skipped.

`neocom` is deprecated. `neocom-esi` is aside. If the argument names one of those, stop that repository and report that it is aside. Do not commit it and do not open a pull request for it.

For **`neocom-domain`** PRs: do not run GitVersion. Version advances after `npm run distribute` (patch) or `publish:lib` (npm-led). Publish to npm only when the user asks.

An unknown argument stops the command. Do not guess a repository.

## For each selected repository

1. Read `.dsh/templates/` and follow `.dsh/skills/neocom-git-workflow/SKILL.md`.
2. Orient with `git status`, `git diff`, `git diff --staged`, `git status -sb`, and `git log`.
3. When there is nothing to commit and the current branch needs no pull request, say so and continue.
4. Commit pending changes on the correct feature or fix branch. Do not commit that work on `develop` or `main`. If the changes are on `develop` or `main`, stop that repository and report that it needs a branch from `develop`.
   - **`neocom-front` / `neocom-back`:** current `feature/<feature>` or `fix/…`. Pre-commit / GitHub hooks sync GitVersion — do **not** run `version:sync` as a separate agent step.
   - **`neocom-meta`:** prefer `feature/agents` (default). Use `feature/cicd` only when the user commanded CI/CD work on that branch. Do not keep inventing `feature/<product-feature>` on meta. If the working tree is on a short-lived product-named meta branch (for example `feature/login`), move the commits onto `feature/agents` (or the commanded meta branch) before the pull request, unless the user says otherwise.
5. If `develop` does not exist, stop that repository and report it. Do not use `main` as the base.
6. **Version:** do not create a version chore commit. Apps: hooks/CI. Domain: distribute/publish. Meta: none.
7. Prepare the pull request from the feature or fix branch into `develop` (**validation intake**):
   - Push with `git push -u origin HEAD` when the branch has no upstream.
   - If a pull request for that branch already exists, report its URL. Do not open another.
   - Otherwise `gh pr create --base develop`. Body: `.dsh/templates/pull-requests.md` **plus** required fields from `.dsh/templates/openspec-delivery-control.md` (OpenSpec ids, out of scope, validation readiness).
   - Listed features are **ready for validation on develop** after merge. Do not archive on this PR.
   - For `neocom-meta` `feature/cicd`, rebase onto latest `feature/agents` or `develop` when the user commands that update, before opening or updating the pull request. Ask before a force push.
8. A **release** PR (`develop` → `main`) is separate: title `Release-<MajorMinorPatch>`; body lists OpenSpec **archive** and **deferred** sets (delivery-control §C). Archive only listed validated changes.
9. Do not merge unless asked. Leave secrets out of the commit and the pull request.

## Return

For each repository: commits created (SHA and message), the pull request URL, or why that repository was skipped.
