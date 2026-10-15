---
name: "/neo:spec-evolution"
id: "neo:spec-evolution"
category: "NEOCOM Specs"
description: "Review L2 notes and move them into OpenSpec. Optional paths limit the run to those files"
---

Run **Spec Evolution** for the `/neocom-meta` agent.

Command: `/neo:spec-evolution` or `/neo:spec-evolution <L2-file>…`

Follow `.cursor/skills/spec-registration/SKILL.md` in `neocom-meta`.

Read `05.REQUIREMENTS-DECOMPOSITION/L2/` only. When one or more file paths follow the command, process only those L2 files. When none are given, process every L2 file. Review notes under `UNREGISTERED REQUIREMENTS`, place each one in the file for its system and feature, and move it into an OpenSpec change `<system>-<feature>` with the spec at `specs/<system>/<feature>/spec.md`. Skip `DUPLICATED`. Do not read L1. Do not implement product features.
