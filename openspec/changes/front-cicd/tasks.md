## 1. BDD / Cypress (CICD-F-001…004)

- [x] Enforce SDD→BDD→TDD with Gherkin pass before feature complete (CICD-F-001)
- [x] Cypress validates flows, contents, and UI via documented `cy-*` (CICD-F-002)
- [x] Gherkin asserts published `cy-*` properties (CICD-F-003)
- [x] Pages/panels under test expose `cy-*` properties (CICD-F-004)

## 2. Automated fixtures (CICD-F-010…013)

- [x] Configurable replaceable adapters for automated fixtures (CICD-F-010)
- [x] Fixtures from real runs including errors/stale/incorrect (CICD-F-011)
- [x] Stable predefined fixtures reflecting edge cases (CICD-F-012)
- [x] Gherkin can select fixtures per scenario (CICD-F-013)

## 3. Coverage / Sonar (CICD-F-020…024)

- [x] Front coverage tool local + CI (CICD-F-020)
- [x] Front quality-gate rules on coverage/outcomes (CICD-F-021)
- [x] Record front thresholds and suites (CICD-F-022)
- [x] Front reports to SonarCloud (CICD-F-023)
- [x] Front CI upload; Sonar fail blocks completeness (CICD-F-024)

## 4. CI job order (CICD-F-030…032)

- [x] Front unit and acceptance MAY run in parallel (CICD-F-030)
- [x] Both pass before Sonar (CICD-F-031)
- [x] Sonar waits for tests/artifacts (CICD-F-032)

## 5. Test command catalog (CICD-F-040…044)

- [x] Front implements shared command catalog names (CICD-F-040)
- [x] Align names/intent with back (CICD-F-041)
- [x] Cover TDD/BDD/SDD entries (CICD-F-042)
- [x] Environment setup per entry (CICD-F-043)
- [x] Run-all sequence command (CICD-F-044)

## 6. Mock fixtures (014–016)

- [x] Mock / captured data from real runs SHALL be used only for automated testing; it SHALL … (CICD-F-014)
- [x] The data feed for automated Gherkin testing SHALL be obtained from back real endpoint r… (CICD-F-015)
- [x] Captured back endpoint result data SHALL be the source that Gherkin scenarios select an… (CICD-F-016)

## 7. Deployment / CD (080–082, 130–133)

- [x] Front CI/CD is in scope: implement front deployment / promotion workflows for `dev` → `… (CICD-F-080)
- [x] Front artifact publication SHALL come from the GitHub workflow to GitHub Packages / GHC… (CICD-F-081)
- [x] Front `staging` and `prod` deployments SHALL target a Docker engine (Docker deployment … (CICD-F-082)
- [x] Front SemVer: patch on develop merge; minor on default main merge; annotated tag MajorMinorPatch on every main merge (CICD-F-130)
- [x] Front named release: `release/X.Y.Z` from main, merge develop; set version+tag X.Y.Z only on main merge (CICD-F-131)
- [x] Front named release→main uses branch-named version instead of default minor bump (CICD-F-132)
- [x] Front feature/non-main commitTag ≡ imageTag SemVer string; on main both are MajorMinorPatch (CICD-F-133)

## 8. Logging (110+)

- [x] `neocom-front` SHALL provide logging through a provider API that application code uses … (CICD-F-110)
- [x] Front logging configuration SHALL control which logs are shown by section and log level… (CICD-F-111)
- [x] Every front log call through the provider SHALL include log level, section, and message (CICD-F-112)
- [x] The front logging provider SHALL emit a log only when the call’s level is allowed for t… (CICD-F-113)
- [x] Front logging configuration SHALL live with front local / environment configuration own… (CICD-F-114)
- [x] Front sections used in log calls SHALL be stable named identifiers documented for the f… (CICD-F-115)
- [x] Emitted front log lines that pass the filter SHALL retain level, section, and message s… (CICD-F-116)
- [x] Front log messages MAY include placeholders; when additional parameters are supplied on… (CICD-F-117)
- [x] Front programme log call levels SHALL be `DEBUG`, `INFO`, and `PRODUCTION`; section con… (CICD-F-118)
- [x] Front logs at level `PRODUCTION` SHALL not be filtered out even when the application ru… (CICD-F-119)
- [x] On a production environment, front section log levels SHALL default to `NONE`, meaning … (CICD-F-120)
- [x] When a front section’s configured level is `NONE`, that section SHALL not emit `DEBUG` … (CICD-F-121)
- [x] Front programme logs that pass the filter SHALL be sent to the browser console (CICD-F-122)

## 9. CI pipeline (070–089)

- [x] Front CI SHALL run with a documented Node version that matches `.nvmrc` and the Angular… (CICD-F-070)
- [x] Front CI SHALL run unit tests (`npm test` / Vitest, non-watch) as part of the front CI … (CICD-F-071)
- [x] Front CI SHALL run lint and format checks as the first pipeline step after setup and be… (CICD-F-072)
- [x] Front CI SHALL produce a production build (`npm run build`) and SHALL fail the pipeline… (CICD-F-073)
- [x] Front acceptance (Cypress + Cucumber) SHALL run in CI on a defined job that starts the … (CICD-F-074)
- [x] Front-only CI SHALL NOT require a live `neocom-back` (was INFRA-035) (CICD-F-075)
- [x] Front SHALL keep a thin caller workflow in `neocom-front`; reusable composite actions a… (CICD-F-076)
- [x] Front CI/CD secrets SHALL use the host secret store and SHALL NOT be committed (was INF… (CICD-F-077)
- [x] Front CI SHALL upload analysis to the Sonar project and validate the quality gate only … (CICD-F-078)
- [x] After the front Sonar gate passes, front CI SHALL publish the versioned artifact to Git… (CICD-F-079)
- [x] Front CI SHALL generate a Docker deployable image configured for a Docker engine and pu… (CICD-F-083)
- [x] Loading / running the front image on the local Docker engine SHALL not run on github-ho… (CICD-F-084)
- [x] `neocom-front` GitHub Actions SHALL be configured with secret `SONAR_TOKEN` and SHALL u… (CICD-F-085)
- [x] Front non-secret CI config SHALL be committed: Node / `.nvmrc`, meta `uses` `@ref`, GHC… (CICD-F-086)
- [x] Front CI callers SHALL declare the workflow `permissions` required for the stages they … (CICD-F-087)
- [x] `neocom-meta` Actions access SHALL allow `neocom-front` (and `neocom-back`) to use its … (CICD-F-088)
- [x] `neocom-meta` SHALL maintain developer documentation for the manual GitHub repo configu… (CICD-F-089)

## 10. Developer install (092–098)

- [x] A script SHALL perform initial installation from scratch. Its first check SHALL run `nv… (CICD-F-092)
- [x] After the nvm check, the install script SHALL clone every active repository listed in `… (CICD-F-093)
- [x] After the repositories are cloned, the install script SHALL run `npm install` in `neoco… (CICD-F-094)
- [x] WireMock SHALL be available for local front automated testing (not for development; dev… (CICD-F-095)
- [x] After `npm install` in each active repository, the install script SHALL install Graphif… (CICD-F-097)
- [x] After OpenSpec actions that change code finish for a target project, that project’s Gra… (CICD-F-098)

## 11. Local configuration (101–108)

- [x] WireMock port, mappings directory, and the start command SHALL be pinned in `neocom-fro… (CICD-F-101)
- [x] Front service ports SHALL differ by named environment: `dev` (`start:dev`, local manual… (CICD-F-102)
- [x] Environment names and config files SHALL use the consistent names `dev`, `staging`, and… (CICD-F-103)
- [x] On hosts where `sass-embedded` cannot run, front scripts MAY set `NG_BUILD_SASS_EMBEDDE… (CICD-F-105)
- [x] Programme architecture docs SHALL stay under `neocom-meta` programme definition and sta… (CICD-F-106)
- [x] `neocom-front` SHALL support a watch run mode that compiles on the fly; that mode SHALL… (CICD-F-107)
- [x] `neocom-front` SHALL support a server run mode that starts the application with `server… (CICD-F-108)

## Domain NeoCom node unit tests (CICD-F-050…053)

- [ ] The testing process SHALL review all front domain NeoCom node classes for unit-test cov… (CICD-F-050)
- [ ] For each domain node lacking adequate unit tests, the process SHALL create Vitest unit … (CICD-F-051)
- [ ] New domain NeoCom nodes SHALL include unit tests in the same delivery as the node class… (CICD-F-052)
- [ ] Domain-node unit tests SHALL live with the domain module (co-located `*.spec.ts` or an … (CICD-F-053)

## Logging note (CICD-F-124)

- [x] Front programme logs from the Angular provider SHALL not be required to appear in the n… (CICD-F-124)

## Front Gherkin/Cypress step catalog (CICD-F-060…067)

- [x] `neocom-front` SHALL maintain a catalog of Gherkin/Cypress steps used by front acceptan… (CICD-F-060)
- [x] The front step catalog SHALL stay small; variation SHALL be achieved by parametrization… (CICD-F-061)
- [x] Front catalog SHALL include parametrized steps for application bootstrap, feature/dock … (CICD-F-062)
- [x] Front catalog SHALL include parametrized steps for target selection (panel type, item b… (CICD-F-063)
- [x] Front catalog SHALL include parametrized steps for field label/value assertions, button… (CICD-F-064)
- [x] Front acceptance SHALL use a symbolic-name → selector translation (page/panel/render/di… (CICD-F-065)
- [x] Pages, sections, panels, and renders under acceptance test SHALL publish the required `… (CICD-F-066)
- [x] Front Gherkin scenarios SHALL assert page/panel/render content and UI through those `cy… (CICD-F-067)
