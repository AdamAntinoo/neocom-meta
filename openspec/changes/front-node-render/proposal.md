# Proposal

## Why

EPIC-002 needs a stable node → Part → render pipeline with a registry (replacing hard-coded `*ngIf`), hierarchy-to-list collaboration, and a shared viewer so industry screens can paint nodes consistently.

## What Changes

- Codify MVC roles for node, Part, business object, and render variants
- Replace `v2-node-container` hard-coded class maps with a `jsonClass` → render registry
- Flatten hierarchy via `collaborate2View` / `notifyDataChanged` into `nodes2render`
- Define viewer and standalone panel contracts
- Keep domain node interfaces (`INode`, `ICollaboration`, `IExpandable`, `ISelectable`, `NeoCom`, `NeoComDelayed`)

## Capabilities

### New Capabilities

- `front/node-render`: Node MVC, render registry, hierarchy list, viewer, and panel roles

### Modified Capabilities

- *(none)*

## Impact

- Owning repository: **`neocom-front`**
- Requirement ids: NODE-001 … NODE-017 
- Source extract: 
- Async fetch/SSE owned by `front-async-sse` / `back-async-sse` (condensed notes moved to DUPLICATED)
