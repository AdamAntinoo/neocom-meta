# Design

## Context

EPIC-004 Section 22: interchange `jsonClass` on domain responses. Complements per-model `jsonClass` constants already registered under `domain-pilot`, `domain-application-info`, `domain-server-status`, and the EPIC-002 `front-node-render` registry.

## Goals

- One wire field name: `jsonClass`
- Value = programme type name from `neocom-domain` / EPIC-004 register
- Front uses that field for render selection on domain API payloads

## Non-Goals

- Replacing the node-render registry (owned by `front-node-render`)
- Defining individual model field lists (owned by other `domain-*` changes)

## Approach

| Concern | Owner |
| --- | --- |
| Emit `jsonClass` on responses | `neocom-back` |
| Type name / alignment | `neocom-domain` + EPIC-004 register |
| Consume for render | `neocom-front` (lookup via existing registry) |

## Decisions

| Decision | Choice |
| --- | --- |
| Discriminator field name | `jsonClass` only |
| Change folder | `domain-jsonclass` with capabilities `domain/jsonclass`, `back/jsonclass`, `front/jsonclass` |
