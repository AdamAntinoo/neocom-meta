# infra/style-modules Specification

## Purpose

Sass module loading for application styles under the current Angular builder. Source: INFRA-040.

## Requirements

### Requirement: Application styles use Sass modules

Application stylesheets SHALL load other stylesheets with the Sass module system (`@use` and `@forward`). They SHALL NOT use `@import` (INFRA-040).

#### Scenario: Panel styles load variables with @use

- **WHEN** a developer inspects `neocom-front` stylesheets
- **THEN** shared variables are loaded with `@use`
- **AND** no application stylesheet contains `@import`

### Requirement: Angular global entry deprecation

`@angular/build` still emits `@import` for the global style entry `src/styles.scss`. The front build SHALL silence that `import` deprecation until the Angular builder stops emitting it. Silencing it SHALL NOT be a reason to add `@import` to application styles (INFRA-040).

#### Scenario: Global style build does not warn on import

- **WHEN** the front application styles are built
- **THEN** the Sass `import` deprecation from the Angular global style loader is silenced
- **AND** application styles still use `@use`
