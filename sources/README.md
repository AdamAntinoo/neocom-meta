# Requirements decomposition

| Level | Path | Role |
| --- | --- | --- |
| Programme | `../01.PROGRAMME-DEFINITION/` | Architecture and active features (updated from L1/L2 + development) |
| L1 | `L1/NN.EPIC-NAME.md` | One file per epic, opened by `/epic`. `NN` starts at `01`. Each epic has `## Spec traceability` linking L2 and OpenSpec |
| L1 index | `L1/TRACEABILITY.md` | Per-epic Sections + L2 delivery (OpenSpec + PR/SHA); agents skip `applied` / `archived` material on later extract/register |
| L2 epic extract | `L2/NN.EPIC-NAME.md` or `L2/NN.EPIC-NAME.<group>.md` | Extraction of one open epic. Epic stem in the file name for traceability. One or more files by topic. New notes sit under `UNREGISTERED REQUIREMENTS` |
| L2 | `L2/<system>/` | Decomposed specs by system (`FRONT`, `DOMAIN`, infrastructure, CI/CD) used in **Spec Registration** |

L1 is authored with `/epic` (and refined in the epic file). There is no `/spec-collect` step and no `02.SOURCES` intake into L1.

`/neo:extract-l2` reads L1 only and writes new notes under `UNREGISTERED REQUIREMENTS` in epic-named L2 files. It does not force an epic directory or a per-repository split. The L2 tree already on disk is the record of generated work. A passage that is already in an epic-named file, a legacy epic directory, a system file, `L2/DOMAIN/MODELS/`, or `L2/INFRASTRUCTURE-SPECS.md` is not written again.

`/neo:spec-evolution` reads L2 only. Optional L2 paths after the command limit the run to those files; with no paths, every L2 file is processed. It reviews those notes, moves each item into the file for its system and feature, then moves it into an OpenSpec change `<system>-<feature>` with the spec at `openspec/changes/<system>-<feature>/specs/<system>/<feature>/spec.md`.

A note that duplicates an existing requirement, or is very similar to one, is not registered. It moves under the heading `DUPLICATED`. Processing an L2 file ignores that section. The workflow is section 5 of `PROGRAMME.md`.

## Agent commands

1. `/epic` — author or extend an L1 epic under `L1/`
2. `/neo:extract-l2` — convert L1 into epic-named L2 file(s). No args: pending epics; args: only those epics. Skip passages the L2 tree already holds
3. `/neo:spec-evolution` — review L2 `UNREGISTERED REQUIREMENTS` and move them into OpenSpec. Optional L2 paths limit the run to those files
4. `/feature-delivery` — apply a registered feature on `feature/<feature>` from `develop` and commit. The user reviews and tests. Then open a pull request into `develop`. Archive opens a pull request from `develop` into `main`

## Registered from the current L2 set

| OpenSpec change | System | Feature | Source |
| --- | --- | --- | --- |
| `front-infrastructure` | front | toolchain | `L2/INFRASTRUCTURE-SPECS.md` INFRA-001…008 |
| `front-pilot` | front | pilot | `L2/FRONT/01.PILOT-DEFINITION.md` |
| `front-universe` | front | universe | `L2/FRONT/02.UNIVERSE.md` UNIV-001…003 |
| `front-app-shell` | front | app-shell | `L2/FRONT/03.APP-SHELL.md` |
| `front-dashboard-shell` | front | page-header, dashboard, eve-media, corporation, character-selection | `L2/FRONT/04`, `12`, `18`, `19`, `20` |
| `front-industry-blueprints` | front | model-strip, color-table, feature-button, blueprint-by-location, shared-ui | `L2/FRONT/13`…`17` |
| `domain-module` | domain | neocom-domain | `L2/DOMAIN/01.NEOCOM-DOMAIN.md` |
| `esi-character-api` | esi | character-api | `L2/ESI/ESI-SPECS.md` ESI-001…005 |
| `infra-developer-install` | infra | developer-install | INFRA-010…016 |
| `infra-local-config` | infra | local-config | INFRA-020…026 |
| `cicd-pipeline` | cicd | pipeline | INFRA-030…039 |
| `infra-style-modules` | infra | style-modules | INFRA-040 |
| `login` | front, back, esi | login / sso | `L2/FRONT/06.LOGIN.md`, `L2/BACK/BACK-LOGIN.md`, `L2/ESI/ESI-SSO.md`, `L2/ESI/ESI-LOGIN.md` |
| `nestjs-sso-config` | back | nestjs-sso-config | INFRA-041…042 |

OpenSpec changes cite L2 IDs. L1 epics record the same linkage under `## Spec traceability` and in `L1/TRACEABILITY.md` (Sections + L2 delivery) so a later `/neo:extract-l2` or `/neo:spec-evolution` skips passages already processed or applied.
