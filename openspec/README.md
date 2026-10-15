# OpenSpec features

Manual register of OpenSpec changes in this repository. OpenSpec itself does not require this file; it is for programme tracking.

Refresh the task counts with:

```bash
cd neocom-meta && nvm use && npx openspec list --json
```

## Status legend

| Status | Meaning |
| --- | --- |
| `registered` | Change exists under `changes/<name>/` with proposal, specs, design, and tasks |
| `applying` | Implementation on `feature/<feature>` from `develop` |
| `applied` | Work accepted on `develop`; archive not done yet |
| `archived` | Moved to `changes/archive/` and merged into `openspec/specs/` |

Task progress comes from checkboxes in each change’s `tasks.md` (`openspec list`).

## Active changes

| Change | System / feature | Tasks | Status | Notes |
| --- | --- | --- | --- | --- |
| `login` | front/login, back/login, esi/sso, esi/login | 0/13 | applying | Branch `feature/login` from `develop` in meta, front, and back |
| `infra-sso-config` | infra / sso-config | 0/2 | registered | INFRA-041…042; related to `login` |
| `front-infrastructure` | front / toolchain | 6/8 | registered | |
| `front-pilot` | front / pilot | 4/5 | registered | |
| `front-pilot-panel` | front / pilot-panel | 0/4 | registered | |
| `front-universe` | front / universe | 0/4 | registered | |
| `front-app-shell` | front / app-shell | 0/3 | registered | |
| `front-dashboard` | front / dashboard | 0/6 | registered | |
| `back-service` | back / service | 0/3 | registered | |
| `domain-module` | domain / neocom-domain | 2/3 | registered | |
| `esi-character-api` | esi / character-api | 3/4 | registered | |
| `infra-developer-install` | infra / developer-install | 0/4 | registered | |
| `infra-local-config` | infra / local-config | 0/7 | registered | |
| `cicd-pipeline` | cicd / pipeline | 0/8 | registered | |

Delta specs usually live at `changes/<system>-<feature>/specs/<system>/<feature>/spec.md`. A multi-system feature may use one change folder (for example `changes/login/`) with several capability specs underneath.

## Archived

| Archive folder | Main spec |
| --- | --- |
| `2026-10-15-back-esi-client` | `specs/back/esi-client/spec.md` |
| `2026-10-15-back-hexagonal` | `specs/back/hexagonal/spec.md` |
| `2026-10-15-infra-style-modules` | `specs/infra/style-modules/spec.md` |

## How to update this file

1. After `/neo:spec-evolution`, add a row under **Active changes** with status `registered`.
2. When `/feature-delivery` starts, set status to `applying` and name the branch if useful.
3. After the pull request into `develop` is accepted, set status to `applied`.
4. After `openspec archive`, move the row to **Archived** and point at the main spec path.
