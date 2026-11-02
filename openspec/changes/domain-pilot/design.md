# Design

## Approach

- Domain owns PublicPilotV1 / PilotV2 field contracts from EPIC-004 extract
- Front render apply stays on `front-pilot`; this change does not re-specify PILOT-001…007 front ids
- Fixture character **93813310** is shared with front-pilot WireMock work

## Decisions

| Topic | Decision |
| --- | --- |
| Programme type | **PilotV2** (not unversioned Pilot) |
| Base type | **PublicPilotV1** |
| Location field | infinity `SpaceLocationV1`; new work derives from **EveLocationV1** |
| Delivery | `feature/pilot` in `neocom-domain` (and consumers as needed) |

## Risks

- EveLocationV1 / PilotShipV1 are still `to review` on EPIC-004; complements are stated but those models are not registered in this change
