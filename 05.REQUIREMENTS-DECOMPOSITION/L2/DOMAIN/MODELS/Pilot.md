# Pilot

Source: `PublicPilotV1` and `PilotV2` in the infinity frontend.

`PilotV2` extends `PublicPilotV1`. Public fields are available with no ESI login. Private fields require an ESI token.

These are successive versions of the same business object. `PublicPilotV1` stays for features that use the public model. `PilotV2` is the later version for features that also have an ESI token. A feature keeps the version it was built against.

## Public data

No ESI login. Class `PublicPilotV1`.

| Field | Type |
| --- | --- |
| `pilotId` | number |
| `name` | string |
| `corporation` | [PublicCorporationV1](./PublicCorporationV1.md) |
| `birthday` | string |
| `description` | string |
| `gender` | string |
| `securityStatus` | number |
| `url4Icon` | string |
| `raceData` | [UniverseRaceData](./UniverseRaceData.md) |
| `ancestryData` | [UniverseAncestryData](./UniverseAncestryData.md) |
| `bloodlineData` | [UniverseBloodlineData](./UniverseBloodlineData.md) |

## Private data

Requires an ESI token. Class `PilotV2`, in addition to the public fields.

| Field | Type |
| --- | --- |
| `totalSkillpoints` | number |
| `walletBalance` | number |
| `currentShipName` | string |
| `currentShipTypeName` | string |
| `lastKnownLocation` | [SpaceLocationV1](./SpaceLocationV1.md) |
