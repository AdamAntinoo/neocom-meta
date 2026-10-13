# Design

## Approach

Follow `L2/INFRASTRUCTURE-SPECS.md` section B (INFRA-010 … INFRA-016). Document the commands; do not add a second installer.

## Decisions

| Topic | Decision |
| --- | --- |
| Clone | `git clone --recurse-submodules` of the parent remote, or `git submodule update --init --recursive` |
| Front submodules | `neocom-meta`, `neocom-front` |
| Node | nvm, version from `neocom-front/.nvmrc`, alias `neocom` |
| Install | `npm install` in `neocom-front` with `nvm use neocom` |
| Mocks | WireMock; `neocom-back` is not required |
| Delivery branch | `features/developer-install` from `develop` |

## Risks

- WireMock's concrete start command is still "documented when stubs land" (INFRA-014). This change does not invent that command.
