# domain/application-info Specification

## Purpose

ApplicationInfoV1 for header identity. Source: DOM-APPINFO-001…003 in `L2/DOMAIN/04.APPLICATION-INFO.md`.

## ADDED Requirements

### Requirement: ApplicationInfoV1 published model

**ApplicationInfoV1** SHALL be the published domain model for front application identity in the header (name, version, copyright). NeoCom node `jsonClass = "ApplicationInfoV1"` (DOM-APPINFO-001).

#### Scenario: jsonClass is ApplicationInfoV1

- **WHEN** a header identity node is published
- **THEN** its `jsonClass` is `ApplicationInfoV1`

### Requirement: Provider and render methods

Values today from front environment (`appName`, `appVersion`, `copyright`). Provider builds **ApplicationInfoV1**; render reads only `getName()`, `getVersion()`, `getCopyright()`. Name displayed uppercase in default header render (DOM-APPINFO-002).

#### Scenario: Render does not read environment directly

- **WHEN** `v1-application-info-render` displays the node
- **THEN** it uses the node methods, not raw environment keys

### Requirement: v1-application-info-render

Appearance: `v1-application-info-render` (`media/v1-application-info-render.png`) displays ApplicationInfoV1 (DOM-APPINFO-003).

#### Scenario: Header uses the named render

- **WHEN** the application header shows application identity
- **THEN** the registered render is `v1-application-info-render`
