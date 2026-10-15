# Proposal

## Why

Local front configuration is still a list of pending L2 rows. Agents need one registered place for the WireMock base URL, serve URL, submodule pins, and the Sass workaround.

## What Changes

- Point front `dev` HTTP clients at WireMock
- Pin WireMock port, stub directory, and start command in `neocom-front` once stubs exist
- Keep the local UI on the Angular CLI default unless docs say otherwise
- Keep secrets out of git and environment files in the owning submodule
- Track product folders as submodule SHA pins
- Allow `NG_BUILD_SASS_EMBEDDED=0` where `sass-embedded` cannot run
- Keep programme docs aligned with this register

## Capabilities

### New Capabilities

- `infra/local-config`: Local front configuration and submodule pins

### Modified Capabilities

- *(none)*

## Impact

- `neocom-front` configuration and the parent submodule pointers
- Out of scope: choosing a WireMock port before stubs exist, and staging or production hosts
