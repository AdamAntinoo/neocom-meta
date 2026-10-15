---
name: feature-delivery
description: >-
  Apply a registered OpenSpec feature on feature/<feature> from develop
  and commit it. Several features can be open. Rebase when one needs
  another's code. One pull request into develop can carry several features.
  Use when the user runs /feature-delivery or asks to apply a registered
  feature to code.
disable-model-invocation: true
---

# Feature delivery

Turns a registered OpenSpec feature into commits on `feature/<feature-name>` from `develop`. Other feature branches may already be open. The user reviews and tests those commits before any pull request. Section 5.9 of `README.md` is the rule for keeping those branches apart.

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
   - Create `feature/<feature-name>` from `develop`. Other `feature/*` branches may already exist. Do not create this one from them or from `main`.
   - Delegate the git commands to `/neocom-git`.
   - When this feature needs code that is only on another open feature branch, ask `/neocom-git` to rebase this branch onto that one after the branch exists. Do not edit the same files on two branches that both still start from `develop`.

3. **Apply**
   - Implement only that change's tasks.
   - Delegate the implementation to `/neocom-code`. Docs and spec registration stay with `/neocom-meta`.
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
   - Rebase a feature with no dependency onto the current `develop`. Rebase a dependent feature onto its provider only after that provider has been rebased onto `develop`. If the branch is already on the remote, ask before a force push.
   - Open a pull request **into `develop`**. The user may put several reviewed features in that one pull request: stack them in dependency order and open it from the tip. Name every feature.
   - Title and body come from `.cursor/templates/pull-requests.md` when a user example is stored there.
   - Do not merge unless the user asks.
   - The next OpenSpec apply creates a new branch from `develop`. Do not implement the next feature by adding commits on this one.

6. **Archive**
   - Archive is a later step, when the user archives the OpenSpec change.
   - That archive instructs `/neocom-git` to open a pull request from `develop` into `main` for review and approval. Do not merge it.

## Return to user

1. Branch name and the `develop` commit it was created from
2. Commits on that branch
3. That the user reviews and tests next, and the pull request into `develop` waits for that review
