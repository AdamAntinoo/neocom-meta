---
name: neocom-openapi
description: >-
  Write and version neocom-back OpenAPI files under tools/openapi/.
  On API content changes: minor SemVer bump, copy-rename to the new
  filename, edit only the copy, and prepend CHANGELOG entries
  (reverse chronological). Use when /neocom-openapi or /openapi.
disable-model-invocation: true
---

# NEOCOM OpenAPI (neocom-back only)

Owned by the `neocom-openapi` agent. Slash `/neocom-openapi` or `/openapi`.

## Arguments

```text
/neocom-openapi
/neocom-openapi <adapter>
/neocom-openapi <adapter> <summary of contract change>
/openapi
/openapi <adapter>
```

| Argument | Meaning |
| --- | --- |
| `<adapter>` | One of: `auth`, `pilot`, `industry`, `manufacture`, `universe` (or a new adapter name when creating the first file) |
| *(none)* | Infer from conversation / open OpenAPI file / named OpenSpec change; ask if ambiguous |

## Steps

### 1. Bound the work

1. Confirm repo: sibling `neocom-back` only. Abort if the request targets front/domain/meta product code.
2. Announce `Destination: neocom-back` and `tools/openapi/`.
3. Read `tools/openapi/README.md` and the current adapter YAML (latest SemVer for that adapter).
4. Read `neocom-meta/openspec/specs/back/openapi/spec.md` when aligning to BACK-SVC-060…063.
5. Do not invent endpoints or fields — use controllers, DTOs, ExceptionCatalog, and/or reviewed OpenSpec text.

### 2. Decide version

1. Parse current `info.version` / filename `…-vX.Y.Z.yaml`.
2. If this turn **changes API contents** → next version is **`X.(Y+1).0`** (minor bump, patch reset).
3. If creating a **new** adapter OpenAPI → start at **`0.1.0`** (`<adapter>-service-v0.1.0.yaml`) unless the user specifies otherwise.

### 3. Copy-rename (never edit the prior SemVer file in place for contract changes)

```bash
cd <neocom-back>/tools/openapi
cp <adapter>-service-vX.Y.Z.yaml <adapter>-service-vX.(Y+1).0.yaml
```

Apply all edits to the **new** file only. Keep the old file.

### 4. Edit the new YAML

1. Set `info.version` to the new SemVer.
2. Update paths / schemas / responses / security as required.
3. Prepend the in-file `## Changelog` bullet for this version (newest first).
4. Keep schema names aligned with domain / DTO names; keep path version prefixes.

### 5. Update folder changelog and index

1. Prepend a section to `tools/openapi/CHANGELOG.md` (create the file if missing):

```markdown
## <adapter> vX.Y.Z — YYYY-MM-DD

- …
```

Newest section must stay **above** older sections.

2. Update the README adapter table to the new filename.

### 6. Stop for review

Do not commit. Summarize old → new version, files touched, and contract deltas. Hand Nest work to `/neocom-code` and commits to `/neocom-git` when the user asks.

## New adapter checklist

1. Add `<adapter>-service-v0.1.0.yaml` (template style: existing adapter YAMLs / `gateway-adapter-service-v0.2.0.yaml` for layout only).
2. Document happy path + ExceptionCatalog error responses.
3. README row + CHANGELOG `v0.1.0` entry at top.
4. Do not add Nest bootstrap or `src/generated` DTO generation from this skill.

## Boundaries

- No edits outside `neocom-back/tools/openapi/` (except reading specs/controllers for alignment).
- No git operations.
- No inventing behaviour not present in code or reviewed specs.
