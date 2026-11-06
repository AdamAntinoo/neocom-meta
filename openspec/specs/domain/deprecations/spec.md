# domain/deprecations Specification

## Purpose
Deprecate domain DTOs and domain `esi-api`. Source: BACK-SVC-040…042, BACK-SVC-050…052.

## Requirements

### Requirement: Domain DTOs deprecated

Domain DTOs SHALL be treated as deprecated (not active interchange / port contracts) (BACK-SVC-040).

#### Scenario: DTO not active contract

- **WHEN** a new interchange or port contract is chosen
- **THEN** a domain DTO is not used as the active contract

### Requirement: Mark DTOs deprecated in code

Domain DTOs SHALL be marked deprecated in code so call sites are easy to identify (BACK-SVC-041).

#### Scenario: Deprecated annotation

- **WHEN** a domain DTO type is published
- **THEN** it carries a deprecation mark visible to consumers

### Requirement: Keep deprecated DTOs

Deprecated domain DTOs SHALL be kept for later use as templates or for removal (not deleted solely by this requirement) (BACK-SVC-042).

#### Scenario: Retain for later

- **WHEN** DTOs are deprecated under this change
- **THEN** they remain in the package until a later removal decision

### Requirement: Domain esi-api deprecated

`neocom-domain` `src/esi-api` SHALL be treated as deprecated (BACK-SVC-050).

#### Scenario: esi-api not active

- **WHEN** shared domain contracts are chosen
- **THEN** `src/esi-api` is not treated as the active shared API surface

### Requirement: ESI types not exported via domain

ESI DTOs and ESI API class data SHALL NOT be exported outside `neocom-back` via `neocom-domain` (BACK-SVC-051).

#### Scenario: No domain export of ESI

- **WHEN** a consumer outside `neocom-back` depends on `neocom-domain`
- **THEN** it does not receive ESI DTOs or ESI API classes through that package

### Requirement: esi-api removable from domain

`neocom-domain` `src/esi-api` MAY be removed from the domain package (ESI types remain back-internal) (BACK-SVC-052).

#### Scenario: Optional removal

- **WHEN** domain no longer needs `src/esi-api`
- **THEN** that tree MAY be removed while ESI types stay inside `neocom-back`
