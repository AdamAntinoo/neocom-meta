# Proposal

## Why

The front application needs a Pilot: the Eve Online user's presence in the game. Public character data and a fixed test fixture have to be specified before UI or domain code treats a pilot as an informal blob.

## What Changes

- Define a Pilot as the user's interaction with the Eve Online environment, mapped to the ESI Character
- A game credential owns at most 3 pilots
- Load public character data from ESI `GetCharactersDetail`
- Feed WireMock with the supplied character `93813310` (`Perico Tuerto`) for standalone tests
- Create the Pilot data model from that character payload

## Capabilities

### New Capabilities

- `front/pilot`: Pilot identity, credential limit, ESI public character source, and the development fixture

### Modified Capabilities

- *(none)*

## Impact

- Owning submodule for the model and WireMock fixture: **`neocom-domain`** once present, consumed by **`neocom-front`**
- Until `neocom-domain` exists, do not invent a second Pilot type inside the front app
- Out of scope: login, token exchange, private ESI routes, and any character fields not present in the supplied public payload
