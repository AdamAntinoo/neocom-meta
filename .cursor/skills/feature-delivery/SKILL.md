---
name: feature-delivery
description: >-
  Apply one registered OpenSpec feature on feature/<feature> from develop
  and commit it. The user reviews and tests before the pull request into
  develop. Use when the user runs /feature-delivery or asks to apply a
  registered feature to code.
disable-model-invocation: true
---

# Feature delivery

Turns one registered OpenSpec feature into commits on `feature/<feature-name>` from `develop`. The user reviews and tests those commits before any pull request.

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
   - In the active repository that owns the code (`neocom-meta`, `neocom-front`, or `neocom-back`):
   - `git checkout develop` then `git checkout -b feature/<feature-name>`.
   - Delegate the git commands to `/neocom-git`.

3. **Apply**
   - Implement only that change's tasks.
   - Delegate product work to `/neocom-front`, `/neocom-back`, or `/neocom-meta` by folder.
   - This apply is the instruction to commit. Delegate the commit to `/neocom-git`. Commit only on `feature/<feature-name>`, not on `develop` or `main`.
   - Message shape comes from `.cursor/templates/commit-messages.md` when the user has stored an example; otherwise Conventional Commits in the git skill.
   - For `neocom-esi`, `npm run release` builds, tests, publishes, and commits on that feature branch. It does not open the pull request.

4. **Stop for review**
   - Run the tests the change names.
   - Ask `/verifier` to confirm the claimed behavior is in the owning folder.
   - Stop. The user reviews the branch and does any further testing.
   - Do not open a pull request and do not archive during this step.

5. **Pull request into `develop`**
   - Only after the user says the review and testing are done, delegate to `/neocom-git`.
   - Open a pull request from `feature/<feature-name>` **into `develop`**.
   - Title and body come from `.cursor/templates/pull-requests.md` when a user example is stored there.
   - Do not merge unless the user asks.
   - The next OpenSpec apply creates a new branch from `develop`. Do not reuse this feature branch.

6. **Archive**
   - Archive is a later step, when the user archives the OpenSpec change.
   - That archive instructs `/neocom-git` to open a pull request from `develop` into `main` for review and approval. Do not merge it.

## Return to user

1. Branch name and the `develop` commit it was created from
2. Commits on that branch
3. That the user reviews and tests next, and the pull request into `develop` waits for that review
