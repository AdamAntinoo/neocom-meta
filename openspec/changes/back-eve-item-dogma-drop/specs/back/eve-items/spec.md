# back/eve-items Specification (delta)

## ADDED Requirements

### Requirement: EveItemV1Dto omits dogma arrays

Backend `EveItemV1Dto` SHALL **not** expose `dogmaAttributes` or `dogmaEffects`. The Eve item converter SHALL **not** map ESI `dogma_attributes` / `dogma_effects` into the DTO. Nested `PricedItemV1Dto` and asset `item` payloads inherit that omission (OPT-001). This narrows the ITEM-003 “type field set” for programme wire size: front does not consume dogma.

#### Scenario: EveItem by type id omits dogma

- **WHEN** the back builds an `EveItemV1Dto` from an ESI universe type that may include `dogma_attributes` / `dogma_effects`
- **THEN** the DTO does not serialize `dogmaAttributes` or `dogmaEffects`
- **AND** the converter does not map those ESI arrays onto the DTO

### Requirement: Remove unused dogma helper types

Related types (`EveItemDogmaAttribute` / `EveItemDogmaEffect` and converter branches) SHALL be removed when nothing else references them; prefer delete with the DTO fields (OPT-002).

#### Scenario: No orphan dogma types after drop

- **WHEN** dogma fields are removed from `EveItemV1Dto`
- **THEN** dogma-only helper types and converter branches are deleted if unused elsewhere

### Requirement: Do not reintroduce dogma without L1

Dogma attributes or effects SHALL NOT be reintroduced on `EveItemV1Dto` (or nested priced/asset item payloads) unless a later reviewed L1 requirement needs them (OPT-003).

#### Scenario: No silent dogma return

- **WHEN** a later change would add dogma to item wire
- **THEN** it is driven by a reviewed L1 unit registered into OpenSpec
