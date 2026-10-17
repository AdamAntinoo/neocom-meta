# L1 epic → OpenSpec traceability

Central index so agents can **skip** epics (or passages) that are already extracted, registered, applying, applied, or archived. Each epic file also carries a `## Spec traceability` section; keep both in sync.

Refresh OpenSpec task counts from `npx openspec list --json` when updating this file.

## Status values

| Status | Meaning |
| --- | --- |
| `none` | No L2 extract and no OpenSpec change yet |
| `extracted` | Epic-named L2 file(s) exist (`L2/NN.EPIC-NAME.md` and/or `L2/NN.EPIC-NAME.<group>.md`); OpenSpec not registered (or not yet for this epic) |
| `registered` | One or more OpenSpec changes exist under `openspec/changes/` |
| `applying` | Implementation on `feature/<feature>` |
| `applied` | Accepted on `develop`; not archived |
| `archived` | OpenSpec change in `openspec/changes/archive/` |

**Skip rules**

- `/neo:extract-l2`: still skip passages already present in the L2 tree. In addition, treat passages covered by OpenSpec changes in status `applied` or `archived` as done; only extract **new** L1 material appended after the last update.
- `/neo:spec-evolution`: skip L2 notes whose L1 epic row lists the same behavior under an `applied` or `archived` change (move to `DUPLICATED` if re-appeared).
- `/epic` appends: when adding material to an epic that is `applied`/`archived`, mark new sections as not yet traced until extract/register runs.

## Index

| L1 epic | Epic id | Highest OpenSpec status | OpenSpec changes | L2 path | Last updated |
| --- | --- | --- | --- | --- | --- |
| `01.EPIC-LOGIN-PROCEDURE.md` | EPIC-001 | applying | `login` (13/13), related `back-nestjs-sso-config` (0/2) | Legacy `L2/01.EPIC-LOGIN-PROCEDURE/`; new extracts use epic-named files | 2026-10-17 |
| `02.EPIC-ANGULAR-CODIFICATION.md` | EPIC-002 | applying | `front-angular-structure` (0/7), `front-node-render` (0/7), `front-async-sse` (0/7), `back-async-sse` (0/7), `infra-async-persistence` (0/4); related: `front-app-shell`, `front-dashboard`, `front-pilot`, `front-pilot-panel`, `front-infrastructure` (8/8, applying on `feature/infrastructure`) | Epic extracts + `L2/FRONT/07.ANGULAR-STRUCTURE.md`, `08.NODE-RENDER.md`, `09.ASYNC-SSE.md`, `L2/BACK/BACK-ASYNC-SSE.md`, `INFRASTRUCTURE-SPECS.md` §H | 2026-10-17 |

Non-epic L1 notes (`REQUIREMENTS.md`, `UX.md`, `ESI.md`) are not rows here until an `/epic` owns them.

## How agents update this file

1. After `/neo:extract-l2` creates or updates epic-named L2 file(s), set status at least `extracted` and fill **L2 path** with those file paths.
2. After `/neo:spec-evolution` registers OpenSpec changes sourced from that epic, add change names and set `registered` (or keep a higher status).
3. When `/feature-delivery` starts, set `applying`.
4. When the pull request into `develop` is accepted, set `applied`.
5. After `openspec archive`, set `archived`.
6. Mirror the same facts into `## Spec traceability` on the L1 epic file.
