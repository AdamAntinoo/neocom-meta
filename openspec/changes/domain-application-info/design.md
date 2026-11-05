# Design

## Approach

- Domain model carries name, version, copyright; render reads only node methods
- Values today come from front environment via a provider

## Decisions

| Topic | Decision |
| --- | --- |
| jsonClass | `ApplicationInfoV1` |
| Render | `v1-application-info-render` |
| Delivery | `feature/application-info` |

## Risks

- L1 APPINFO-001…004 requirement rows remain `to review`; this change registers the extracted model section only
