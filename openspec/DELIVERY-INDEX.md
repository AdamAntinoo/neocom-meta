# OpenSpec delivery index (commits & PRs)

Local register of **which git commits and pull requests** carried each OpenSpec change. Owned by **`/neocom-git`**. Programme status (`registered` / `applying` / `applied` / `archived`) stays in [`CHANGE-STATUS.md`](./CHANGE-STATUS.md); this file holds **delivery evidence** so agents can answer “which PR / SHA?” **without calling GitHub**.

Graphify indexes this path under `neocom-meta` (`graphify update .`). Prefer `graphify query` / `explain` on delivery questions before `gh` or the GitHub API.

**Do not** treat this file as a substitute for CHANGE-STATUS or L1 TRACEABILITY. Cross-link only.

Last refreshed: 2026-11-12 (`neocom-meta#4` merged → `develop` @ `431bf26`; meta `front-cicd` / `back-cicd` artefacts).

Previous Last refreshed: 2026-11-12 (`back-cicd` 72/72 + `/neocom-openapi` @ `neocom-meta@2c2c1ff` on `feature/process-epics`).

## When `/neocom-git` must update this file

Same turn as the git event (do not defer):

| Event | What to write |
| --- | --- |
| Commit on a feature branch that implements OpenSpec work (`/git:commit`) | Append or refresh **Commits** for each OpenSpec id in the commit (repo, SHA, branch, date) |
| PR opened feature → `develop` (`/git:pr`) | Set **PR** (`owner/repo#N`, URL, head SHA, base `develop`, state `open`) for every OpenSpec id listed in the PR body |
| PR updated (push / retitle / body OpenSpec list change) | Refresh head SHA and OpenSpec id list on that PR row |
| PR merged into `develop` (user reported or agent verified locally) | Set PR state `merged`, **merge / develop tip SHA**, date; align CHANGE-STATUS → `applied` |
| Validation on develop recorded | Set **validated** tip SHA(s) per repo (may match merge tip) |
| Release PR `develop` → `main` opened / merged | Add **release PR** + archive note; on archive, keep historical rows (do not delete) |

If GitHub API / `gh` is unavailable, still write what local git knows (`repo@sha`, branch, commit subjects). Fill `owner/repo#N` when the PR number is known from a prior successful `gh pr create` or the user.

## Column legend

| Field | Meaning |
| --- | --- |
| OpenSpec | Change folder name under `openspec/changes/` |
| Repos | Product/meta clones that received the work |
| Branch | Feature (or release) branch tip when committed / PR opened |
| Commits | One or more `repo@sha` (short SHA fine); optional subject |
| PR | `owner/repo#N` or `—` if never opened / unknown |
| PR state | `none` · `open` · `merged` · `closed` |
| Develop tip | SHA on `develop` after merge (per primary repo) |
| Validated | `validated on develop @ <sha>` (or multi-repo tips) when §6.5 done |
| Updated | ISO date of last index edit for this row |

---

## Active delivery rows

| OpenSpec | Repos | Branch | Commits | PR | PR state | Develop tip | Validated | Updated |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `front-assets-by-location` | front | `feature/assets-by-location` | `neocom-front@d1fed92` (on develop) | [AdamAntinoo/neocom-front#7](https://github.com/AdamAntinoo/neocom-front/pull/7) | merged | `d1fed92` | openspec validate passed 2026-11-09 | 2026-11-09 |
| `back-assets` | back | `feature/assets` | `neocom-back@63a2098` (on develop) | [AdamAntinoo/neocom-back#9](https://github.com/AdamAntinoo/neocom-back/pull/9) | merged | `63a2098` | openspec validate passed 2026-11-09 | 2026-11-09 |
| `back-eve-items` | meta, back | `feature/eve-items` → `feature/assets` tip | `neocom-back@b72ff05`…`63a2098` (on develop) | [AdamAntinoo/neocom-back#8](https://github.com/AdamAntinoo/neocom-back/pull/8) + [#9](https://github.com/AdamAntinoo/neocom-back/pull/9) | merged | `63a2098` | openspec validate passed 2026-11-09 | 2026-11-09 |
| `front-cicd` | meta, front | meta `feature/process-epics` → `develop`; product `feature/cicd` | meta: SemVer + front-ci Actions + GitVersion/tag-prefix (`neocom-meta` tip `431bf26` on develop); product: `neocom-front@99c43a0`…`1531378` on `feature/cicd` | [AdamAntinoo/neocom-meta#4](https://github.com/AdamAntinoo/neocom-meta/pull/4) (meta) | merged | meta `431bf26` | — | 2026-11-12 |
| `back-cicd` | meta, back | meta `feature/process-epics` → `develop`; product `feature/cicd` | meta: SemVer B-130…133 + back-ci + `/neocom-openapi` (`neocom-meta` tip `431bf26` on develop); product apply on `neocom-back` `feature/cicd` | [AdamAntinoo/neocom-meta#4](https://github.com/AdamAntinoo/neocom-meta/pull/4) (meta) | merged | meta `431bf26` | — | 2026-11-12 |
| `front-universe` | front | `feature/universe` | `neocom-front@a9ffcc0` (Universe ESI adapter + WireMock) | — | none | — | — | 2026-11-11 |

## Not yet delivered (no commit/PR required in index until apply commits)

Registered / deferred changes appear in CHANGE-STATUS only until `/git:commit` or `/git:pr` records delivery. Optional stub:

| OpenSpec | Notes |
| --- | --- |
| `esi-character-api` | deferred (`neocom-esi` aside) |
| `front-app-shell` | registered — no delivery row yet |

## Archived delivery (historical)

When a change is OpenSpec-archived, **move** its row here (keep PR/SHA forever).

| OpenSpec | Repos | PR / commits | Archived | Updated |
| --- | --- | --- | --- | --- |
| `back-service` | back | already on develop (`EsiPilotSource` / `GetPilotUseCase` / `PILOT_NOT_FOUND`); tip `neocom-back@63a2098`; archive `2026-11-09-back-service` → `specs/back/service` | 2026-11-09 | 2026-11-09 |
| `domain-module` | domain, front, back | develop tips; Release-0.1.0 set | 2026-11-06 Release-0.1.0 | 2026-11-06 |
| `login` | front, back | —; commits: `neocom-front@e3356db`; `neocom-back@3317849` (SSO commits on develop; distinct login PR id not recorded locally); develop `front `e3356db` · back `3317849`` | 2026-11-06 Release-0.1.0 | 2026-11-03 |
| `front-infrastructure` | front | —; commits: `neocom-front@e3356db`; develop ``e3356db`` | 2026-11-06 Release-0.1.0 | 2026-11-03 |
| `front-angular-structure` | front | —; commits: `neocom-front@e3356db`; develop ``e3356db`` | 2026-11-06 Release-0.1.0 | 2026-11-03 |
| `front-node-render` | front | —; commits: `neocom-front@e3356db`; develop ``e3356db`` | 2026-11-06 Release-0.1.0 | 2026-11-03 |
| `front-async-sse` | front | —; commits: `neocom-front@e3356db`; develop ``e3356db`` | 2026-11-06 Release-0.1.0 | 2026-11-03 |
| `front-pilot` | front | —; commits: `neocom-front@e3356db`; develop ``e3356db`` | 2026-11-06 Release-0.1.0 | 2026-11-03 |
| `front-pilot-panel` | front | —; commits: `neocom-front@e3356db`; develop ``e3356db`` | 2026-11-06 Release-0.1.0 | 2026-11-03 |
| `back-async-sse` | back | `AdamAntinoo/neocom-back#4`; commits: tip before merge included session bind; develop `@ 3317849`; develop ``3317849`` | 2026-11-06 Release-0.1.0 | 2026-11-03 |
| `infra-async-persistence` | back, meta | `AdamAntinoo/neocom-back#4` (back portion); commits: back `@ 3317849`; meta companion under `tools/infra`; develop `back `3317849`` | 2026-11-06 Release-0.1.0 | 2026-11-03 |
| `back-spacelocations` | back | `AdamAntinoo/neocom-back#4`; commits: `@ 3317849`; develop ``3317849`` | 2026-11-06 Release-0.1.0 | 2026-11-03 |
| `back-openapi` | back | `AdamAntinoo/neocom-back#4`; commits: `@ 3317849`; develop ``3317849`` | 2026-11-06 Release-0.1.0 | 2026-11-03 |
| `back-industry-blueprints` | back | `AdamAntinoo/neocom-back#4`; commits: `@ 3317849`; develop ``3317849`` | 2026-11-06 Release-0.1.0 | 2026-11-03 |
| `domain-pilot` | domain | —; commits: `neocom-domain@477ee33`; develop ``477ee33`` | 2026-11-06 Release-0.1.0 | 2026-11-03 |
| `domain-blueprint` | domain | —; commits: `neocom-domain@477ee33`; develop ``477ee33`` | 2026-11-06 Release-0.1.0 | 2026-11-03 |
| `domain-application-info` | domain | —; commits: `neocom-domain@477ee33`; develop ``477ee33`` | 2026-11-06 Release-0.1.0 | 2026-11-03 |
| `domain-server-status` | domain | —; commits: `neocom-domain@477ee33`; develop ``477ee33`` | 2026-11-06 Release-0.1.0 | 2026-11-03 |
| `domain-spacelocation` | domain | —; commits: `neocom-domain@477ee33`; develop ``477ee33`` | 2026-11-06 Release-0.1.0 | 2026-11-03 |
| `domain-locations` | domain | —; commits: `neocom-domain@477ee33`; develop ``477ee33`` | 2026-11-06 Release-0.1.0 | 2026-11-03 |
| `domain-jsonclass` | domain, front, back | back portion `AdamAntinoo/neocom-back#4`; commits: domain `@ 477ee33`; front `@ e3356db`; back `@ 3317849`; develop `see tips` | 2026-11-06 Release-0.1.0 | 2026-11-03 |
| `domain-layout` | domain | —; commits: `neocom-domain@477ee33`; develop ``477ee33`` | 2026-11-06 Release-0.1.0 | 2026-11-03 |
| `domain-ports` | domain | —; commits: `neocom-domain@477ee33`; develop ``477ee33`` | 2026-11-06 Release-0.1.0 | 2026-11-03 |
| `domain-deprecations` | domain | —; commits: `neocom-domain@477ee33`; develop ``477ee33`` | 2026-11-06 Release-0.1.0 | 2026-11-03 |
| `front-dashboard-shell` | front | feature [front#5](https://github.com/AdamAntinoo/neocom-front/pull/5) merged; Release [front#6](https://github.com/AdamAntinoo/neocom-front/pull/6) `Release-0.1.0`; commits: `neocom-front@1c78473` (develop tip); develop ``1c78473`` | 2026-11-06 Release-0.1.0 | 2026-11-06 |
| `front-industry-blueprints` | front | feature #5 merged; Release [front#6](https://github.com/AdamAntinoo/neocom-front/pull/6); commits: `neocom-front@1c78473`; develop ``1c78473`` | 2026-11-06 Release-0.1.0 | 2026-11-06 |
| `front-blueprint-list-processing` | front, meta | feature #5 merged; Release [front#6](https://github.com/AdamAntinoo/neocom-front/pull/6); commits: `neocom-front@1c78473`; meta register prior; develop ``1c78473`` | 2026-11-06 Release-0.1.0 | 2026-11-06 |
| `front-domain-nodes` | front, meta | feature #5 merged; Release [front#6](https://github.com/AdamAntinoo/neocom-front/pull/6); commits: `neocom-front@1c78473`; develop ``1c78473`` | 2026-11-06 Release-0.1.0 | 2026-11-06 |
| `back-blueprint-list-processing` | back, meta | feature [back#5](https://github.com/AdamAntinoo/neocom-back/pull/5) merged; Release [back#7](https://github.com/AdamAntinoo/neocom-back/pull/7) `Release-0.1.0`; commits: `neocom-back@3424886`; develop ``3424886`` | 2026-11-06 Release-0.1.0 | 2026-11-06 |
| `back-space-location-service` | back, meta | feature #5 merged; Release [back#7](https://github.com/AdamAntinoo/neocom-back/pull/7); commits: `neocom-back@3424886` (npm pin via [back#6](https://github.com/AdamAntinoo/neocom-back/pull/6)); develop ``3424886`` | 2026-11-06 Release-0.1.0 | 2026-11-06 |

---

## Agent lookup order (traceability)

1. `graphify query` / `explain` mentioning the OpenSpec change or `DELIVERY-INDEX`
2. Read this file’s row for that change
3. Only if the row is missing or marked incomplete → local `git log` / `gh` / user

## How to update (checklist)

1. Identify OpenSpec ids touched (PR body, CHANGE-STATUS, or commit scope).
2. Upsert one table row per OpenSpec id (multi-repo → multiple SHAs in Commits / Develop tip).
3. Never invent a PR number. Use `—` / `none` until known.
4. Bump **Last refreshed** and the row **Updated** date.
5. Keep CHANGE-STATUS / TRACEABILITY status moves in the **same turn** when merge or validation happens.
