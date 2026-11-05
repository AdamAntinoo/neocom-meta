# Design

## Approach

- Front card for KnownSystem (`jsonClass = 'KnownSystem'`, selector `v1-planetary-system`) shows the fields stated in LOC-110
- Does not invent universe-catalog `locationType` behaviour; KnownSystem is a planetary list model

## Decisions

| Topic | Decision |
| --- | --- |
| Fields | System name; breadcrumb `region > constellation`; security class; security level; planet count |
| Delivery | Prefer `feature/known-system` from `develop` in `neocom-front` |

## Risks

- Appearance/media capture for the card is out of scope unless a later extract adds it
