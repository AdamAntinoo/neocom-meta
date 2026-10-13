---
name: "/feature-delivery"
id: "feature-delivery"
category: "NEOCOM Specs"
description: "Apply a registered feature from develop on feature/<name> and open a PR into develop"
---

Run the **feature delivery** workflow.

Follow `.cursor/skills/feature-delivery/SKILL.md` in `neocom-meta`.

Apply one registered OpenSpec feature on a branch `feature/<feature-name>` created from `develop`. The apply instructs `/neocom-git` to commit on that branch. For `neocom-esi`, run `npm run release` (build, test, publish, commit, then open or update the pull request into `develop`). After the code is validated and the specs are archived and applied, the pull request is for the user to validate.

Use commit, branch, and pull request examples stored in `.cursor/templates/` when the user has provided them.
