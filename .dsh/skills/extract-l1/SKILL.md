---
name: extract-l1
description: >-
  Generate an L1 epic file from an epic. Requires an epic argument (number,
  id, stem, name, or path). Use when /neo:extract-l1. The epic source is
  never modified; only the generated L1 file and the traceability indexes
  are updated.
disable-model-invocation: true
---

# Extract L1

Meta command `/neo:extract-l1`. Owned by `neocom-spec-workflow`.

Generates an L1 epic file from an epic. It is the first generated level of the progression epic → L1 → L2 → OpenSpec. It does not extract L2 (`/neo:extract-l2`), does not register OpenSpec (`/neo:spec-evolution`), and does not implement product code.

## Parameter (required)

`/neo:extract-l1` **requires** one argument: the epic to process. There is no default and no "all epics" mode — if the argument is missing, stop and ask for it.

| Invocation | Effect |
| --- | --- |
| `/neo:extract-l1 08` | Process epic number `08` |
| `/neo:extract-l1 EPIC-008` | Process by epic id |

Resolve the argument to exactly one epic. Accept (in order of preference):

| Form | Example |
| --- | --- |
| Number `NN` or `N` (preferred) | `08`, `8` |
| Epic id | `EPIC-008` |
| Epic stem | `08.EPIC-LOCATIONS` |
| Name fragment | `locations`, `LOCATIONS` |
| Path | `sources/L1/08.EPIC-LOCATIONS.md` or absolute path under `sources/L1/` |

If the argument matches none or more than one epic, stop and report it. Do not guess.

## Graphify (before processing)

Run `graphify update .` from `neocom-meta` before reading the epic, so `graphify-out/graph.json` reflects the current `sources/L1/`, `sources/L2/`, and `openspec/` files. Prefer `graphify query` to locate existing requirements; fall back to Read/Grep/Glob only on files the graph surfaces.

## Source (read-only) and generated target

| Level | Path | Role |
| --- | --- | --- |
| Epic (source) | `sources/L1/NN.EPIC-NAME.md` — the epic's authored material: `## Goals`, `## Search criteria`, `## Sources` (its `[selected]` cards), `## Version card` | Read only — never modified |
| L1 (generated) | `sources/L1/NN.EPIC-NAME.md` — the generated L1 spec: `## Spec traceability`, numbered requirement/model registers, and any derived sections | Written by this command |

> Current harness note: the epic source and the L1 file share `sources/L1/NN.EPIC-NAME.md` (the epic is authored there by `/epic`). This command reads the epic's **authored** sections and writes the **generated** L1 sections of that file; it never rewrites the authored sections.

## Algorithm

1. **Resolve the epic** from the argument (above). Read its authored sections (`## Goals`, `## Search criteria`, `## Sources`).
2. **Generate the L1 spec** from that material:
   - Ensure the `## Spec traceability` header is present and current.
   - Generate the requirement/model registers the epic's goals and sources imply, with stable IDs (e.g. `LOC-001`, `REQ-001`) and a `Review`/`Status` column set to `to review` for new material.
   - Do not invent behavior the epic does not state.
3. **Never modify the epic source.** Do not rewrite `## Goals`, `## Search criteria`, `## Sources`, or `## Version card`.
4. **Update the indexes** (the only place the transition is recorded):
   - `sources/L1/TRACEABILITY.md` — add or refresh the epic's row (status at least the pre-L2 `none`/`extracted` convention; see below), note the L1 path.
   - `sources/L0/executive/INDEX.md` — leave card states as the collector set them; do not change `selected`/`returned`/`out of scope`/`deleted` here.

## Traceability

Set the epic row in `sources/L1/TRACEABILITY.md` so later stages know L1 exists. Status is still `none` until `/neo:extract-l2` runs; record that the L1 file was generated (fill the **L2 path** column only after L2 is extracted).

## Return

1. The epic processed (id + name, resolved from the argument)
2. The L1 file generated/refreshed (full path)
3. Which authored sections were left untouched
4. The indexes updated (`sources/L1/TRACEABILITY.md`)
5. Next step: `/neo:extract-l2 <epic>` to convert this L1 into L2
