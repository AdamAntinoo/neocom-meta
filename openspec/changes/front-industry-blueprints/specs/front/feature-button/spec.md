# front/feature-button Specification

## Purpose

FeatureV1 display element and procedural Feature panel population. Source: IND-BP-010…012, 020, 021, 023 in `L2/FRONT/15.FEATURE-BUTTON.md`.

## ADDED Requirements

### Requirement: FeatureV1 and v1-feature-button

The application SHALL introduce display element **Feature** (`FeatureV1`) with name and/or icon, navigating to a page (including a feature-group landing page) (IND-BP-010). Programme Feature SHALL be **`FeatureV1`** + **`v1-feature-button`** (infinity `v1-feature-button`); candidate A (`v2-feature-render`) is discarded (IND-BP-012). Comparison specimens for both infinity Feature UIs were placed on `model-strip-page` so the developer could choose (IND-BP-011).

#### Scenario: Feature button navigates to a page

- **WHEN** an enabled Feature uses PAGEROUTE
- **THEN** selecting it navigates to that Feature’s route page
- **AND** the render used is `v1-feature-button`

### Requirement: Procedural Feature panel population

The page controller that hosts the Feature panel SHALL populate Features by **procedural creation** of Feature domain instances (infinity `industry-dashboard-page` pattern), not by hard-wiring unrelated one-off buttons outside the Feature model (IND-BP-020). The Industry Feature panel SHALL include Feature `blueprint-by-location` — label **Blueprint Availability**, PAGEROUTE to the **v1-blueprint-by-location** page, with a representative `imageRef` (IND-BP-021). Selecting an enabled Feature SHALL navigate to that Feature’s `route` page (IND-BP-023).

#### Scenario: Industry panel includes blueprint-by-location

- **WHEN** the Industry Feature panel is populated
- **THEN** it includes Feature `blueprint-by-location`
- **AND** selecting it navigates to the blueprint-by-location page
