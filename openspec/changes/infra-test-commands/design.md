# Design

## Approach

- Document catalog names in meta (and mirror as npm script names where practical).
- Map TDD → unit runner, BDD → Cypress/Gherkin, SDD → deferred cross-cutting UI automation.
- Each entry lists required setup (nvm, mocks, app under test, Cypress binary).

## Decisions

| Topic | Decision |
| --- | --- |
| Shared names | Same catalog intent across front and back |
| Layers | TDD, BDD, SDD (SDD defined later) |
| Run-all | Sequential TDD → BDD → SDD when defined |
| Delivery branch | `feature/test-commands` / meta `feature/agents` |

## Risks

- Exact script names are not fixed in L2; choose short clear names at apply without changing layer intent.
