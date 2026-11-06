# Design

## Approach

- ESI server status shape stays internal; ServerStatusV1 may add NeoCom fields
- ONLINE/OFFLINE remains a UI derivation, not a stored field

## Decisions

| Topic | Decision |
| --- | --- |
| jsonClass | `ServerStatusV1` |
| Render | `v1-server-status-render` |
| Delivery | `feature/server-status` |

## Risks

- L1 SRV-001…004 rows remain `to review`; this change registers the extracted model section only
