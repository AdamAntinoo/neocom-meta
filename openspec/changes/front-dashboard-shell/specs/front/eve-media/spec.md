# front/eve-media Specification

## Purpose

Client-side EVE Image Server URL contract for portraits, logos, and type icons. Source: UI-MED-001…008 in `L2/FRONT/18.EVE-MEDIA.md`.

## ADDED Requirements

### Requirement: Client loads Image Server media

Portraits, corporation/alliance logos, and type icons SHALL be loaded by the **client** directly from the EVE Image Server (UI-MED-001). The NeoCom **backend** SHALL NOT proxy, store, or return these image bytes (UI-MED-002). Clients MAY request the URL as a CDN; they SHALL NOT cache the image bytes through the backend (UI-MED-008).

#### Scenario: Render builds URL from id

- **WHEN** a render needs a portrait or logo
- **THEN** it requests `images.evetech.net` directly
- **AND** the backend response does not include the image bytes

### Requirement: URL pattern and categories

A render SHALL build the image URL from the id it already has — pattern `https://images.evetech.net/{category}/{id}/{variation}?size={size}` (UI-MED-003). Categories/variations SHALL follow: pilot portrait → `characters`/`portrait`; corporation logo → `corporations`/`logo`; alliance logo → `alliances`/`logo`; item/module/resource icon → `types`/`icon`; hull or type render → `types`/`render`; blueprint original → `types`/`bp` (UI-MED-004).

#### Scenario: Corporation logo path

- **WHEN** a corporation id is known
- **THEN** the logo URL uses category `corporations`, variation `logo`

### Requirement: Size, tenant, and missing id

When `size` is supplied it SHALL be a power of two from **32** to **1024**; omit `size` only when the original size is acceptable (UI-MED-005). Image `tenant` defaults to **`tranquility`** (UI-MED-006). When a character, corporation, or alliance id is missing, the URL SHALL use id **`1`** (UI-MED-007).

#### Scenario: Missing pilot id

- **WHEN** pilot id is missing for a portrait
- **THEN** the URL uses character id `1`
