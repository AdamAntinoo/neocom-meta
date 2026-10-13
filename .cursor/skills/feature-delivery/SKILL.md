---
name: feature-delivery
description: >-
  Apply one registered OpenSpec feature on a feature/ branch from develop,
  then open a pull request into develop after validation and archive. Use when
  the user runs /feature-delivery or asks to apply a registered feature to code.
disable-model-invocation: true
---

# Feature delivery

Turns one registered OpenSpec feature into code and a pull request the user validates.

## Preconditions

1. The feature has an OpenSpec change `<system>-<feature>` with proposal, spec, design, and tasks.
2. The spec lives at `openspec/changes/<system>-<feature>/specs/<system>/<feature>/spec.md`.
3. Integration branch is `develop`. If `develop` does not exist in the owning repo, stop and ask. Do not create it and do not branch from `main`.

## Steps

1. **Select the feature**
   - Use the feature the user named.
   - Branch name: `feature/<feature-name>` (the feature segment, for example `feature/character-api`). The user example in `.cursor/templates/branch-names.md` is the name to use.
   - If `.cursor/templates/branch-names.md` records a user example, follow that example instead.

2. **Branch**
   - In the repo that owns the code (`neocom-front`, `neocom-back`, `neocom-domain`, `neocom-esi`, `neocom-meta`, or the parent):
   - `git checkout develop` then `git checkout -b feature/<feature-name>`.
   - Delegate the git commands to `/neocom-git`.

3. **Apply**
   - Implement only that change's tasks.
   - Delegate product work to `/neocom-front`, `/neocom-back`, or `/neocom-meta` by folder.
   - This apply is the instruction to commit. Delegate the commit to `/neocom-git`. Commit only on `feature/<feature-name>`, not on `develop` or `main`.
   - Message shape comes from `.cursor/templates/commit-messages.md` when the user has stored an example; otherwise Conventional Commits in the git skill.
   - For `neocom-esi`, the package command is `npm run release`: build, test, publish to npm, then commit, push, and open or update the pull request into `develop`.

4. **Validate**
   - Run the tests the change names.
   - Ask `/verifier` to confirm the claimed behavior is in the owning folder.

5. **Archive**
   - When validation passes and the user treats the feature as complete, archive the OpenSpec change and sync its delta into the main specs (`/opsx-archive` or the OpenSpec archive flow).
   - Do not archive a feature that failed validation.

6. **Pull request**
   - Open a pull request **into `develop`**.
   - Title and body come from `.cursor/templates/pull-requests.md` when a user example is stored there.
   - The user validates the pull request. Do not merge unless the user asks.

## Return to user

1. Branch name and base (`develop`)
2. Commits and the pull request URL
3. OpenSpec change archived or still open, and why
