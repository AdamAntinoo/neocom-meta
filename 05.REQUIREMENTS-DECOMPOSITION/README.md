# Requirements decomposition

| Level | Path | Role |
| --- | --- | --- |
| Programme | `../01.PROGRAMME-DEFINITION/` | Architecture and active features (updated from inputs + development) |
| Sources | `../02.SOURCES/` | External docs and extracted notes |
| L1 | `L1/NN.EPIC-NAME.md` | One file per epic, opened by `/epic`. `NN` starts at `01`. `EPIC-NAME` is `EPIC-` plus the uppercase name |
| L2 epic | `L2/NN.EPIC-NAME/` | Extraction of one open epic. Slice files: `front.md`, `back.md`, `cicd.md`, `architecture.md`, `common.md` when needed. New notes sit under `UNREGISTERED REQUIREMENTS` |
| L2 | `L2/<system>/` | Decomposed specs by system (`FRONT`, `DOMAIN`, infrastructure, CI/CD) used in **Spec Registration** |

`/neo:extract-l2` reads L1 only and writes new notes under `UNREGISTERED REQUIREMENTS` in the matching slice under `L2/NN.EPIC-NAME/`. The L2 tree already on disk is the record of generated work. A passage that is already in an epic slice, a system file, `L2/DOMAIN/MODELS/`, or `L2/INFRASTRUCTURE-SPECS.md` is not written again. A passage that spans repositories goes in `common.md` when it is one shared contract, or is duplicated into each owning slice when each repository has a distinct implementable part.

`/neo:spec-evolution` reads L2 only. Optional L2 paths after the command limit the run to those files; with no paths, every L2 file is processed. It reviews those notes, moves each item into the file for its system and feature, then moves it into an OpenSpec change `<system>-<feature>` with the spec at `openspec/changes/<system>-<feature>/specs/<system>/<feature>/spec.md`.

A note that duplicates an existing requirement, or is very similar to one, is not registered. It moves under the heading `DUPLICATED`. Processing an L2 file ignores that section. The workflow is section 5 of `PROGRAMME.md`.

## Agent commands

1. `/spec-collect` — process `02.SOURCES` → update `L1/`
2. `/neo:extract-l2` — convert L1 epics into `L2/NN.EPIC-NAME/` slice files, skipping passages the L2 tree already holds
3. `/neo:spec-evolution` — review L2 `UNREGISTERED REQUIREMENTS` and move them into OpenSpec. Optional L2 paths limit the run to those files
4. `/feature-delivery` — apply a registered feature on `feature/<feature>` from `develop` and commit. The user reviews and tests. Then open a pull request into `develop`. Archive opens a pull request from `develop` into `main`

## Registered from the current L2 set

| OpenSpec change | System | Feature | Source |
| --- | --- | --- | --- |
| `front-infrastructure` | front | toolchain | `L2/INFRASTRUCTURE-SPECS.md` INFRA-001…008 |
| `front-pilot` | front | pilot | `L2/FRONT/01.PILOT-DEFINITION.md` |
| `front-universe` | front | universe | `L2/FRONT/02.UNIVERSE.md` UNIV-001…003 |
| `front-app-shell` | front | app-shell | `L2/FRONT/03.APP-SHELL.md` |
| `front-dashboard` | front | dashboard | `L2/FRONT/04.DASHBOARD.md` |
| `domain-module` | domain | neocom-domain | `L2/DOMAIN/01.NEOCOM-DOMAIN.md` |
| `esi-character-api` | esi | character-api | `L2/ESI/ESI-SPECS.md` ESI-001…005 |
| `infra-developer-install` | infra | developer-install | INFRA-010…016 |
| `infra-local-config` | infra | local-config | INFRA-020…026 |
| `cicd-pipeline` | cicd | pipeline | INFRA-030…039 |
| `infra-style-modules` | infra | style-modules | INFRA-040 |
| `login` | front, back, esi | login / sso | `L2/FRONT/06.LOGIN.md`, `L2/BACK/BACK-LOGIN.md`, `L2/ESI/ESI-SSO.md`, `L2/ESI/ESI-LOGIN.md` |
| `infra-sso-config` | infra | sso-config | INFRA-041…042 |

L1 has no collected items yet. These changes cite L2 IDs.
