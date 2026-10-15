# Requirements decomposition

| Level | Path | Role |
| --- | --- | --- |
| Programme | `../01.PROGRAMME-DEFINITION/` | Architecture and active features (updated from inputs + development) |
| Sources | `../02.SOURCES/` | External docs and extracted notes |
| L1 | `L1/` | Atomic-oriented requirements list (from **Spec Collect**) |
| L2 | `L2/<system>/` | Decomposed specs by system (`FRONT`, `DOMAIN`, infrastructure, CI/CD) used in **Spec Registration** |

New requirements are written under a heading named `UNREGISTERED REQUIREMENTS`. `/neo:register-spec` (Register Requirements) reviews those notes, moves each item into the file for its system and feature, then registers an OpenSpec change `<system>-<feature>` with the spec at `openspec/changes/<system>-<feature>/specs/<system>/<feature>/spec.md`.

## Agent commands

1. `/spec-collect` — process `02.SOURCES` → update `L1/`
2. `/neo:register-spec` — Register Requirements: review and process every `UNREGISTERED REQUIREMENTS` section into OpenSpec
3. `/feature-delivery` — apply a registered feature on `feature/<feature>` from `develop` and commit. The user reviews and tests. Then open a pull request into `develop`. Archive opens a pull request from `develop` into `main`

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

L1 has no collected items yet. These changes cite L2 IDs.
