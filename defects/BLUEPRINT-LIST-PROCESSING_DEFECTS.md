# Defects — `feature/blueprint-list-processing`

Register of defects found while validating the current implementation on `feature/blueprint-list-processing` (primarily `neocom-back`). This file is the **intake log** only until a defect is promoted into the OpenSpec / epic flow.

Related OpenSpec (applying): [`back-blueprint-list-processing`](../openspec/changes/back-blueprint-list-processing/), [`front-blueprint-list-processing`](../openspec/changes/front-blueprint-list-processing/) (registered).  
Related epics: [EPIC-011](../sources/L1/11.EPIC-BLUEPRINT-LIST-PROCESSING.md), [EPIC-008](../sources/L1/08.EPIC-LOCATIONS.md) (spacelocation / catalog), [EPIC-006](../sources/L1/06.EPIC-USER-INTERFACE.md) (domain-node / render naming norms).

## Contents

- [Register](#register)
- [DEF-BLP-002 — CI/CD front build cannot resolve neocom-domain](#def-blp-002-ci-cd-front-build-cannot-resolve-neocom-domain)
- [DEF-BLP-015 — Blueprint type names missing; resolve type_id via ESI and Redis](#def-blp-015-blueprint-type-names-missing-resolve-type_id-via-esi-and-redis)

## How defects resolve (intended programme flow)

1. **Record here** — `/defect`; status `open` (or `prep`).
2. **Register the spec on the epic** — author or amend the L1 requirement; **selecting this assumes Review accepted** → `[x] reviewed`. Prefer **not** inventing behaviour beyond what the defect states.
3. **Mark to run the process** (developer, manual) — authorizes `/fix:defect`.
4. `/fix:defect` — list defects + actions; wait for go-ahead; then implement Expected. Status `applying`. No commit.
5. **Developer validates** the product fix — then `/defect:fixed DEF-…` moves the defect (same row + section) to [`FIXED-DEFECTS.md`](./FIXED-DEFECTS.md) and removes it from this page.

Statuses: `open` · `prep` · `in openspec` · `applying` · `fixed` · `closed` · `wontfix`.

---

## Register

| ID | Title | Status | Owning epic / capability | OpenSpec (when known) | Found |
| --- | --- | --- | --- | --- | --- |
| DEF-BLP-002 | CI/CD front build cannot resolve neocom-domain | `open` | Front CI/CD · `neocom-domain` dependency | TBD — front / cicd package install | 2026-11-05 |
| DEF-BLP-015 | Blueprint type names missing; resolve type_id via ESI and Redis | `open` | EPIC-011 · back blueprint list | TBD — `back-blueprint-list-processing` / ESI type lookup | 2026-11-06 |

---

## DEF-BLP-002 — CI/CD front build cannot resolve neocom-domain

| Field | Value |
| --- | --- |
| Status | `open` |
| Severity | `TBD` |
| Surfaces | Front CI/CD application bundle generation; `neocom-front` / `neocom-back` `package.json` `neocom-domain` dep; `application-info.provider.ts` (`import { ApplicationInfoV1 } from 'neocom-domain'`); `/git:pr` domain → npm publish flow |
| Found on | CI run `2026-11-05T08:38:11.968Z` — Application bundle generation failed (2.266s) with esbuild resolve error |
| Branch tip | `neocom-front` `feature/blueprint-list-processing` `@ 8030666` |
| L1 | TBD — consumers use published npm `neocom-domain`; domain PR publishes to npm |

### Observed

Front CI/CD **Application bundle generation failed**:

```text
✘ [ERROR] Could not resolve "neocom-domain"

    src/app/modules/header/providers/application-info.provider.ts:2:34:
      2 │ import { ApplicationInfoV1 } from 'neocom-domain';
```

Root cause: dependents pin `neocom-domain` as `**file:../neocom-domain**` (local checkout / `dist`), which is **not present in CI**. Domain change rate is low; the temporary local-file link broke the published-npm consumption path.

### Expected

1. `**neocom-front` / `neocom-back**` SHALL depend on `**neocom-domain` from the npm registry** (semver range / pinned published version), not a local `file:../neocom-domain` path, so CI can resolve the package without a sibling clone/`dist`.
2. `neocom-domain` **SHALL publish to npm** with an incremental version (npm-led: patch after commit, minor on PR→develop, major on PR→main; GitHub `npm-publish.yml` on push). Consumers install from the registry, not a local `file:` link.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | TBD | Domain published on npm; apps consume registry package |
| OpenSpec | TBD — `cicd-*` / domain packaging | CI installs registry `neocom-domain` |
| Harness | `.dsh/agents/neocom-git.md`, `.dsh/skills/git-pr/SKILL.md`; domain `.github/workflows/npm-publish.yml` | npm-led publish on push; PR open bumps minor/major |
| Code | `neocom-front` / `neocom-back` `package.json` (+ lockfiles) | Replace `file:../neocom-domain` with published npm version |

### Prep for resolution (checklist)

- [ ] Register the spec on the owning epic (L1 requirement row; Review starts `[ ] to review`)
- [ ] Mark to run the process — sets Review to `[x] reviewed` and authorizes `/fix:defect`
- [ ] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Local builds can still succeed with `file:` + a sibling `neocom-domain` `dist`; CI cannot. Prefer npm publish after domain PRs given low domain churn.

---

Corporation panel layout defect moved to [`UI-DEFECTS.md`](./UI-DEFECTS.md) **DEF-UI-002** (was DEF-BLP-004).

## DEF-BLP-015 — Blueprint type names missing; resolve type_id via ESI and Redis

| Field | Value |
| --- | --- |
| Status | `open` |
| Severity | `TBD` |
| Surfaces | Back blueprint list DTO / industry ESI transform; front `v1-blueprint-render` name; Redis type cache |
| Found on | Back blueprint payloads expose `type_id` codes without resolved type names (`blueprintTypeName` left empty) |
| Branch tip | `neocom-back` `develop` `@ 3424886` (defect page: `feature/blueprint-list-processing`) |
| L1 | TBD — EPIC-011 blueprint list / type enrichment (archive §03 BLP-018 has `type_id` only) |

### Observed

Back blueprint data **does not include the type name**. ESI (and the current converter) supply type identifiers as **codes** (`type_id` → `blueprintTypeId`); `blueprintTypeName` is left empty (e.g. `blueprint-list-dto.converter.ts` sets `blueprintTypeName: ''`). Downstream list/render falls back to placeholders such as `Blueprint {id}` instead of the universe type name.

### Expected

1. When building blueprint DTOs / list responses, the back SHALL **resolve each blueprint `type_id`** to its universe **type name**.
2. Resolution SHALL query the **ESI API** for type information (universe type by id).
3. Resolved type data SHALL be **cached in Redis**, keyed by the **`type_id`** (typeid identifier), so repeated blueprints / requests do not re-hit ESI for the same type.
4. The outbound blueprint payload SHALL include the resolved **type name** (e.g. `blueprintTypeName`), not only the numeric type code.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | TBD — EPIC-011 (archived) / new BLP type-resolve rows | Type name enrichment + Redis cache by `type_id` |
| OpenSpec | TBD — `back-blueprint-list-processing` (archived 2026-11-06) or successor | ESI type lookup + Redis |
| Code | `neocom-back` `blueprint-list-dto.converter.ts`; industry / blueprint-list services; Redis adapter | Replace empty `blueprintTypeName`; cache by typeid |

### Prep for resolution (checklist)

- [ ] Register the spec on the owning epic (L1 requirement row; selecting this assumes Review accepted → `[x] reviewed`)
- [ ] Mark to run the process — authorizes `/fix:defect`
- [ ] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Same enrichment pattern as location catalog / Redis (DEF-BLP-001 lineage), applied to universe **types** for blueprint `type_id`.

Expand-toggle alignment defect moved to [`UI-DEFECTS.md`](./UI-DEFECTS.md) **DEF-UI-001** (was DEF-BLP-016 / DEF-IB-011).

---

