---
name: spec-registration
description: >-
  Spec Registration — when L1 requirements are atomic enough, process L1 and L2
  under 05.REQUIREMENTS-DECOMPOSITION and register them into OpenSpec at the
  neocom root. Use when the user runs /spec-registration.
disable-model-invocation: true
---

# Spec Registration

Agent command that **registers** collected requirements into OpenSpec for project advancement. Run only after Spec Collect (or an equivalent L1 set) exists.

## Preconditions

1. Read `05.REQUIREMENTS-DECOMPOSITION/L1/REQUIREMENTS.md`.
2. Proceed only if readiness is `ready` or `partial` **and** the user wants that slice registered. If `not-ready`, stop and tell them to run `/spec-collect` (or refine L1) first.
3. Read all relevant L2 files under `05.REQUIREMENTS-DECOMPOSITION/L2/` (e.g. `INFRASTRUCTURE-SPECS.md` and any others present).
4. OpenSpec root is the parent `neocom/` repo (`neocom/openspec/`), not inside `neocom-meta`.

## Goal

Turn atomic L1 (+ supporting L2) into OpenSpec artifacts so later `/opsx-propose` / `/opsx-apply` (or equivalent) can advance the project.

## Steps

1. **Select the slice**
   - Prefer IDs marked `atomic-ready`.
   - If the user named IDs or a domain, use that subset.
   - Skip items that are still `draft` unless the user overrides.

2. **Confirm OpenSpec root**
   - From `neocom/`: run `openspec list --json` and confirm `"root"` is set.
   - If missing, stop and ask the user to init OpenSpec at the neocom root (do not create it as a side effect).

3. **Register into OpenSpec**
   For each coherent capability slice:
   - Create or update an OpenSpec **change** whose proposal and specs are derived from the selected L1 statements and any matching L2 detail.
   - Prefer the project’s existing OpenSpec workflow:
     - `openspec new change "<kebab-name>"` when creating a new change, then author artifacts per `openspec instructions`, **or**
     - follow `/opsx-propose` guidance when proposing a full change in one pass.
   - Delta specs under `openspec/changes/<change>/specs/<capability>/spec.md` must map clearly to L1 IDs (cite `L1-XXX` in the requirement text).
   - Keep L2 infrastructure/detail in `design.md` or capability specs as appropriate; do not invent infra not present in L1/L2 or sources.

4. **Traceability**
   - In the OpenSpec proposal (or a short `neocom-meta` note under `05.REQUIREMENTS-DECOMPOSITION/`), record which L1 IDs were registered and the OpenSpec change name(s).
   - Update L1 status for registered items to `registered` (add that status if missing).
   - Update matching feature docs under `01.PROGRAMME-DEFINITION/FEATURES/` with L1 IDs and OpenSpec change names.

5. **Boundaries**
   - Do not implement product code in front/back from this command.
   - Do not edit `neocom-front` / `neocom-back` application sources.
   - Meta writes stay under `neocom-meta` except OpenSpec artifacts under `neocom/openspec/`.

## Return to user

1. Whether the atomicity gate passed
2. OpenSpec change name(s) and paths under `neocom/openspec/`
3. L1 IDs registered vs skipped
4. Next step hint: `/opsx-apply` (or review proposal) when ready to implement
