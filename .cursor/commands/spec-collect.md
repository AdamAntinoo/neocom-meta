---
name: "/spec-collect"
id: "spec-collect"
category: "NEOCOM Specs"
description: "Spec Collect — process 02.SOURCES into L1 requirements"
---

Run the **Spec Collect** workflow.

Follow the project skill at `.cursor/skills/spec-collect/SKILL.md` in `neocom-meta`.

Process documents at `02.SOURCES` and generate or refresh the L1 requirements list at `05.REQUIREMENTS-DECOMPOSITION/L1/`. Use `extract-requirements-from-urls` and Graphify when fetching documentation. Do not register into OpenSpec; if L1 is atomic-ready, tell the user to run `/spec-registration`.
