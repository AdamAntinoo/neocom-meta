---
name: neo-pr
description: >-
  Commit pending work and prepare pull requests for one active project, or
  for neocom-meta, neocom-front, and neocom-back when no project is given.
  Use when /neo:pr is invoked.
disable-model-invocation: true
---

# `/neo:pr`

Owned by `/neocom-git`. This command is the request to commit and to prepare pull requests. Do not wait for a second confirmation.

VCS only. Do not implement product features. Do not merge.

## Argument

The text after `/neo:pr` is the project.

| Argument | Repository |
| --- | --- |
| `neocom-meta`, `meta` | `neocom-meta` |
| `neocom-front`, `front` | `neocom-front` |
| `neocom-back`, `back` | `neocom-back` |

No argument means those three active repositories. Each one is an independent project. Skip a folder that is missing or is not a git checkout, and say which one was skipped.

`neocom` is deprecated. `neocom-domain` and `neocom-esi` are aside. If the argument names one of those, stop that repository and report that it is aside. Do not commit it and do not open a pull request for it.

An unknown argument stops the command. Do not guess a repository.

## For each selected repository

1. Read `.cursor/templates/` and follow `.cursor/skills/neocom-git-workflow/SKILL.md`.
2. Orient with `git status`, `git diff`, `git diff --staged`, `git status -sb`, and `git log`.
3. When there is nothing to commit and the current branch needs no pull request, say so and continue.
4. Commit pending changes on the current `feature/<feature>` or `fix/…` branch. Do not commit that work on `develop` or `main`. If the changes are on `develop` or `main`, stop that repository and report that it needs a branch from `develop`.
5. If `develop` does not exist, stop that repository and report it. Do not use `main` as the base.
6. Prepare the pull request from the feature or fix branch into `develop`:
   - Push with `git push -u origin HEAD` when the branch has no upstream.
   - If a pull request for that branch already exists, report its URL. Do not open another.
   - Otherwise `gh pr create --base develop`. The body uses the recorded example in `.cursor/templates/pull-requests.md`.
7. Do not merge. Leave secrets out of the commit and the pull request.

## Return

For each repository: commits created (SHA and message), the pull request URL, or why that repository was skipped.
