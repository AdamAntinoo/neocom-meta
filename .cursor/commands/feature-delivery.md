---
name: "/feature-delivery"
id: "feature-delivery"
category: "NEOCOM Specs"
description: "Apply a registered feature on feature/<name> from develop. Several features can stay open, rebase when one needs another, and share one pull request into develop"
---

Run the **feature delivery** workflow.

Follow `.cursor/skills/feature-delivery/SKILL.md` in `neocom-meta`.

Apply a registered OpenSpec feature on a branch `feature/<feature-name>` created from `develop`. Other feature branches may already be open. `/neocom-code` implements the change. The apply instructs `/neocom-git` to commit on that branch. Rebase onto another feature only when this one needs that code. For `neocom-esi`, `npm run release` builds, tests, publishes, and commits on that feature branch. It does not open the pull request. Stop for the user to review and test. After the user accepts that review, `/neocom-git` opens a pull request into `develop`. Several reviewed features can share that pull request. The next OpenSpec apply starts a new branch from `develop`. Archiving the change opens a pull request from `develop` into `main`. Follow section 5.9 of `README.md`.

Use commit, branch, and pull request examples stored in `.cursor/templates/` when the user has provided them.
