---
name: git-commit
description: >-
  Commit all pending changes on one NEOCOM repository to its current branch.
  Use when /git:commit is invoked.
disable-model-invocation: true
---

# `/git:commit`

Owned by `/neocom-git`. This command is the request to commit pending work on one repository. Do not wait for a second confirmation.

VCS only. Do not implement product features. Do not open a pull request. Do not push unless the user asks.

This is a **git** command (`/git:…`), not a workflow or OpenSpec command (`/neo:…`, `/feature-delivery`, `/opsx-*`).

## Argument

The text after `/git:commit` is the project. **Required.**

| Argument | Repository |
| --- | --- |
| `neocom-meta`, `meta` | `neocom-meta` |
| `neocom-front`, `front` | `neocom-front` |
| `neocom-back`, `back` | `neocom-back` |
| `neocom-domain`, `domain` | `neocom-domain` |

No argument stops the command. Ask for a project name.

`neocom` is deprecated. `neocom-esi` is aside. If the argument names one of those, stop and report that it is aside. Do not commit it.

An unknown argument stops the command. Do not guess a repository.

Skip the repository when its folder is missing or is not a git checkout, and say so.

## Steps

1. Read `.cursor/templates/` and follow `.cursor/skills/neocom-git-workflow/SKILL.md`.
2. Orient in that repository only: `git status`, `git diff`, `git diff --staged`, `git status -sb`, and `git log`.
3. When there is nothing to commit, say so and stop.
4. Stay on the **current** branch. Do not create a branch, do not switch branch, and do not rebase.
5. If the current branch is `develop` or `main`, stop and report that product work should be committed on a feature or fix branch. Do not commit on `develop` or `main` unless the user explicitly overrides that rule in the same request.
6. Stage all pending relevant paths (tracked modifications and new files that belong in the commit). Exclude secrets (`.env`, credentials, tokens). Warn and skip secret files if they appear.
7. Draft a Conventional Commit message from the diff and recent `git log` style. Pass the message via HEREDOC.
8. Commit. If a hook rejects the commit, fix and create a **new** commit (do not amend unless user rules allow).
9. Run `git status` after the commit and report the SHA and message.

## Return

Repository name, current branch, commit SHA and message, or why the command stopped.
