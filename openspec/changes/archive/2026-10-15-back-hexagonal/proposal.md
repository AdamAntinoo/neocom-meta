# Proposal

## Why

`neocom-back` needs a hexagonal NestJS shape, and the first API through that shape is the Pilot endpoint.

## What Changes

- Lay out `application`, `domain`, and `infrastructure`, with inbound REST adapters (BACK-001, BACK-002, BACK-003)
- Declare the API in OpenAPI and generate the interface and DTOs (BACK-004, BACK-005)
- Publish a port whose first endpoint returns the Pilot model, omitting the private section when the caller is not logged in (BACK-006 … BACK-010)

## Capabilities

### New Capabilities

- `back/hexagonal`: Hexagonal NestJS backend and the Pilot endpoint

### Modified Capabilities

- *(none)*

## Impact

- Owner: **`neocom-back`**
- The Pilot JSON view follows `L2/DOMAIN/MODELS/Pilot.md`
- Out of scope: the universe and market endpoints in the sample. That sample only shows the controller and use-case shape.
