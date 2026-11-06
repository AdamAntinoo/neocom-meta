# front/known-system Specification

## Purpose

KnownSystem planetary card fields. Source: LOC-110 in  (EPIC-008 Section 13).

## ADDED Requirements

### Requirement: Known-system card fields

A known-system card SHALL show system name, `region > constellation`, security class and level, and planet count (LOC-110).

#### Scenario: Card shows identity and counts

- **WHEN** a KnownSystem card is rendered for a planetary system the pilot works
- **THEN** the card displays the system name, the `region > constellation` breadcrumb, security class, security level, and planet count
