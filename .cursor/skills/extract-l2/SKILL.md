---
name: extract-l2
description: >-
  Convert L1 epics into an L2 epic directory with front, back, cicd,
  architecture, and common slice files. Skip material the current L2
  tree already holds. Use when the user runs /neo:extract-l2.
disable-model-invocation: true
---

# Extract L2

Meta command `/neo:extract-l2`. Owned by `/neocom-meta`.

Converts L1 into L2. It does not register OpenSpec and it does not implement product code.

## Input

Read only `05.REQUIREMENTS-DECOMPOSITION/L1/`. An epic file is `L1/NN.EPIC-NAME.md`. Other L1 files are collected notes, not epics. Convert each epic. Leave non-epic L1 files unread by this command unless the user names one.

Do not read `02.SOURCES`. That is `/spec-collect`.

## Output and the existing L2 tree

The current L2 tree is the record of what was already generated. Do not add a second index.

| L2 path | What it already records |
| --- | --- |
| `L2/NN.EPIC-NAME/` | Extraction of the L1 file with the same epic name. Slice files hold notes under `UNREGISTERED REQUIREMENTS` or `DUPLICATED` |
| `L2/NN.EPIC-NAME/front.md` | Notes that affect `neocom-front` only |
| `L2/NN.EPIC-NAME/back.md` | Notes that affect `neocom-back` only |
| `L2/NN.EPIC-NAME/cicd.md` | Notes that affect CI/CD, when the L1 text states them |
| `L2/NN.EPIC-NAME/architecture.md` | Notes that affect programme architecture or infrastructure design, when the L1 text states them |
| `L2/NN.EPIC-NAME/common.md` | Notes that affect more than one repository and stay as one shared note |
| `L2/<SYSTEM>/*.md` | Placed requirements. Folders in use: `FRONT`, `BACK`, `DOMAIN`, `ESI`. A row has an id and a status |
| `L2/DOMAIN/MODELS/` | Model files already generated for a requirement |
| `L2/INFRASTRUCTURE-SPECS.md` | Infrastructure rows already generated |

Create only the slice files that have at least one note. Do not create empty slice files.

When another repository the L1 text names needs its own slice (`domain`, `esi`, `meta`, …), use `L2/NN.EPIC-NAME/<name>.md` the same way.

If a legacy flat file `L2/NN.EPIC-NAME.md` still exists, migrate its notes into the epic directory and remove that flat file.

## Already processed

Before writing a note, compare that L1 passage with the L2 tree above.

A passage is already generated when the same behavior, or a very similar one, is already in:

- any slice under `L2/NN.EPIC-NAME/`, under either heading
- a row in `L2/<SYSTEM>/`
- a file under `L2/DOMAIN/MODELS/`
- a row in `L2/INFRASTRUCTURE-SPECS.md`

Leave that passage where it is. Do not copy it again. Report the L2 path that already holds it.

When `L2/NN.EPIC-NAME/` does not exist, create it. When it exists, append only passages that are not already generated.

## Write

For each new L1 passage, choose one owning slice and write one note under `UNREGISTERED REQUIREMENTS` in that file.

| Affects | Destination |
| --- | --- |
| `neocom-front` only | `front.md` |
| `neocom-back` only | `back.md` |
| CI/CD only | `cicd.md` |
| Programme architecture or infrastructure design only | `architecture.md` |
| Another named repository only | `<name>.md` |

Do not put a repository label on the note. The slice file is the owner.

### More than one repository

When a passage affects more than one repository, choose:

1. **Prefer `common.md`** when the note is one shared contract both sides must follow (cookie names, SSO parameters, shared environment variables, a handshake both must implement the same way). Keep a single note. Do not invent a second wording.
2. **Prefer duplicate** when each repository has a distinct implementable slice of the same L1 passage. Write one note into each owning slice file (`front.md` and `back.md`, for example), each worded for that repository only. Do not leave a combined wording in `common.md` as well.

Report which choice was used for each multi-repository passage.

Do not place notes in `L2/<SYSTEM>/`. Do not give them an id. Do not write OpenSpec. Those steps belong to `/neo:spec-evolution`.

Do not invent behavior the L1 text does not state. Keep the L1 file unchanged.

## Return

1. L1 files read
2. L2 epic directories created or updated, and which slice files were written
3. Notes newly written, by slice file
4. Multi-repository passages: `common.md` or duplicated, and why
5. Passages already generated, each with the L2 path that holds it
6. Next step: `/neo:spec-evolution` for the new notes under `UNREGISTERED REQUIREMENTS` (optionally scoped to the epic directory or a slice file)
