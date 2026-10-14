# Proposal

## Why

The ESI tool needs PKCE token management before authenticated ESI calls can be made.

## What Changes

- Start a login feature that implements PKCE token management for the ESI tool (ESI-012)

## Capabilities

### New Capabilities

- `esi/login`: PKCE token management for the ESI tool

### Modified Capabilities

- *(none)*

## Impact

- Owner: **`neocom-esi`** for the token management the ESI tool uses
- Out of scope: the front login page, and any PKCE parameter that the note does not name
