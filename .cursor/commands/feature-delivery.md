---
name: "/feature-delivery"
id: "feature-delivery"
category: "NEOCOM Specs"
description: "Apply a registered feature on feature/<name> from develop, commit, then wait for user review before the pull request into develop"
---

Run the **feature delivery** workflow.

Follow `.cursor/skills/feature-delivery/SKILL.md` in `neocom-meta`.

Apply one registered OpenSpec feature on a branch `feature/<feature-name>` created from `develop`. The apply instructs `/neocom-git` to commit on that branch. For `neocom-esi`, `npm run release` builds, tests, publishes, and commits on that feature branch. It does not open the pull request. Stop for the user to review and test. After the user accepts that review, `/neocom-git` opens a pull request into `develop`. The next OpenSpec apply starts a new branch from `develop`. Archiving the change opens a pull request from `develop` into `main`.

Use commit, branch, and pull request examples stored in `.cursor/templates/` when the user has provided them.
