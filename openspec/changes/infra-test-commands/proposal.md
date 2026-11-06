# Proposal

## Why

EPIC-003 needs one shared vocabulary of short testing commands (TDD / BDD / SDD layers plus a run-all sequence) so agents and developers use the same names across front and back.

## What Changes

- Publish a catalog of stable, common testing command names and intent
- Allow front/back implementation to differ while names stay shared
- Cover TDD, BDD, and later SDD layers with documented environment setup per entry
- Provide a command that runs all layers in sequence after each layer's setup

## Capabilities

### New Capabilities

- `infra/test-commands`: Shared NEOCOM testing command catalog

### Modified Capabilities

- *(none)*

## Impact

- Owning docs: **`neocom-meta`**; npm scripts in **`neocom-front`** / **`neocom-back`**
- Requirement ids: INFRA-060 … INFRA-064 ( §I)
- Source extract: 
- SDD tooling details remain “defined later” per L2
