---
name: spec-registration
description: >-
  Spec Registration — place reviewed L1 and L2 requirements into OpenSpec.
  Used by Register Requirements (/neo:register-spec). Also use when the user
  runs /spec-registration.
disable-model-invocation: true
---

# Spec Registration

Processing steps for **Register Requirements** (`/neo:register-spec`). The review pass is `.cursor/skills/register-requirements/SKILL.md`. This skill registers the reviewed notes into OpenSpec.

## Preconditions

1. Read `05.REQUIREMENTS-DECOMPOSITION/L1/REQUIREMENTS.md` and every L2 file, including nested system folders (`L2/FRONT/`, `L2/DOMAIN/`, and later `L2/BACK/`, `L2/CICD/`).
2. Also process any section headed `UNREGISTERED REQUIREMENTS`, even when L1 readiness is `not-ready`. Those notes are user-written requirements. Do not wait for Spec Collect to register them.
3. For an L1-only slice with no unregistered notes, proceed when readiness is `ready` or `partial` and the user wants that slice. If there is nothing to register, stop.
4. OpenSpec root is `neocom-meta` (`openspec/` in this repository).

## Goal

Turn atomic L1 (+ supporting L2) into OpenSpec artifacts so later `/opsx-propose` / `/opsx-apply` (or equivalent) can advance the project.

## Steps

1. **Place unregistered requirements**
   - Find every heading `UNREGISTERED REQUIREMENTS` under `05.REQUIREMENTS-DECOMPOSITION/`.
   - For each bullet, choose the system (`front`, `infra`, `cicd`, `back`, `domain`, or a system the user names) and the feature.
   - If the note is in the wrong file, move it to `L2/<SYSTEM>/<feature-file>.md` (create the file). Keep infrastructure rows that belong in `L2/INFRASTRUCTURE-SPECS.md` in that register.
   - Give a stable id, status `pending`, then `registered` after the OpenSpec change exists.
   - Leave the heading in place and empty.
   - Before creating a new change, run the Graphify check in `.cursor/skills/register-requirements/SKILL.md`. Extend an existing change only when a returned node `src` is an OpenSpec change or an L2 file that already states the same behavior. Ignore every other node.

2. **Select the slice**
   - Include the items just placed, plus L2 rows still `pending`, plus L1 ids marked `atomic-ready`.
   - If the user named ids or a feature, use that subset.
   - Skip items that are still `draft` unless the user overrides.

3. **Confirm OpenSpec root**
   - From `neocom-meta/`: run `npx openspec list --json` and confirm `"root"` is this repository.
   - If missing, stop and ask the user to init OpenSpec here (do not create it as a side effect).

4. **Register into OpenSpec**
   For each feature:
   - Change name: `<system>-<feature>` (hyphens only; the CLI rejects `/`).
   - Delta spec path: `openspec/changes/<system>-<feature>/specs/<system>/<feature>/spec.md`.
   - Create with `openspec new change "<system>-<feature>"`, then author proposal, specs, design, and tasks.
   - Cite L1 ids when they exist. Cite L2 ids (`PILOT-001`, `INFRA-010`, `DOMAIN-001`, …) when L1 has no row yet.
   - Do not invent behavior that is not in the L1 or L2 text.

5. **Traceability**
   - In the OpenSpec proposal (or a short `neocom-meta` note under `05.REQUIREMENTS-DECOMPOSITION/`), record which L1 IDs were registered and the OpenSpec change name(s).
   - Update L1 status for registered items to `registered` (add that status if missing).
   - Update matching feature docs under `01.PROGRAMME-DEFINITION/FEATURES/` with L1 IDs and OpenSpec change names.

6. **Boundaries**
   - Do not implement product code in front/back from this command.
   - Do not edit `neocom-front` / `neocom-back` application sources.
   - Meta writes, including OpenSpec artifacts, stay under `neocom-meta`.

## Return to user

1. Whether the atomicity gate passed
2. OpenSpec change name(s) and paths under `openspec/`
3. L1 IDs registered vs skipped
4. Next step hint: `/feature-delivery` when the user wants that feature applied on `feature/<feature>` from `develop`
