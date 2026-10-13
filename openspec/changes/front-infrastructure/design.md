# Design

## Approach

- Scaffold `neocom-front` with Angular CLI latest stable (22.x), TypeScript, routing, SCSS, Vitest.
- Pin Node via `neocom-front/.nvmrc` (24.21.0) and document `nvm alias neocom <version>` for the NEOCOM environment.
- Add Cypress 16+ with `@badeball/cypress-cucumber-preprocessor` and Gherkin features under `cypress/e2e/`.
- Keep front `dev` API base URL aimed at WireMock; do not require `neocom-back` for local UI work.

## Decisions

| Topic | Decision |
| --- | --- |
| Framework | Angular (not React/Vue) |
| Version policy | Track current latest stable; recorded at scaffold as 22.2.x |
| Language | TypeScript |
| Unit tests | Vitest (Angular 22 CLI default) |
| Acceptance tests | Cypress + Cucumber |
| Node | nvm; engines `^22.22.3 \|\| ^24.15.0 \|\| >=26.0.0`; alias `neocom` → 24.21.0 |
| Local APIs | WireMock for front `dev` |

## Risks

- Cypress binary / install scripts may need `npm install-scripts approve` on some npm versions.
- Angular major upgrades may require updating `.nvmrc` and the `neocom` alias together.
