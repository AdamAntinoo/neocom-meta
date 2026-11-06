# front/shared-ui Specification

## Purpose

Programme-wide UI tokens for faces, field labels, icon sizes, and expand chevrons. Source: IND-BP-080…083, 088 in .

## ADDED Requirements

### Requirement: Primary faces and field labels

Primary faces SHALL be **Elemental** and **Open Sans**; prefer them unless a render specifies another face (IND-BP-080). Field labels SHALL always use **Open Sans**, **9px**, colour **orange `#ffa500`** (IND-BP-081).

#### Scenario: Field label colour

- **WHEN** a render shows a field label
- **THEN** it uses Open Sans at 9px in `#ffa500`

### Requirement: Standard icon sizes

Programme styles SHALL define three standard icon sizes: **16 / 24 / 32** (`sm` / `md` / `lg`) (IND-BP-082).

#### Scenario: Region uses md token

- **WHEN** a Region card paints its systems icon
- **THEN** it uses the `md` (24px) token unless a render specifies another standard token

### Requirement: Expand toggle glyph pair

Expandable items SHALL show a **toggle icon** whose appearance depends on expand status: **collapsed → `arrowright.png`**, **expanded → `arrowdownred.png`** (or regenerated equivalents of that pair) (IND-BP-083).

#### Scenario: Collapsed shows arrowright

- **WHEN** an expandable item is collapsed
- **THEN** its toggle uses `arrowright.png` (or equivalent)
- **WHEN** it is expanded
- **THEN** its toggle uses `arrowdownred.png` (or equivalent)

### Requirement: Expand-chevron asset set

Programme SHALL ship the infinity expand-chevron set under `public/res-ui/drawable/` — `arrowright`, `arrowdownred`, `arrowleft`, `arrowupgreen` — as copies or regenerated equivalents; Region expand/collapse SHALL use that set (not a one-off icon) (IND-BP-088).

#### Scenario: Drawable set present

- **WHEN** the front public assets are built
- **THEN** `/res-ui/drawable/arrowright.png` and `/res-ui/drawable/arrowdownred.png` are available for expand toggles
