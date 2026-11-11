# Assets by location (front)

Status: registered. OpenSpec change: `front-assets-by-location`.

Dashboard Feature and `pilot` module page at `/pilot/assets-by-location` that aggregate the authenticated pilot asset list (`GET /v1/pilots/{pilotId}/assets`) into Region / Unidentified → System → Asset / AssetContainer, resolve places via spacelocations, and paint leaves with `v1-asset-render` (`EveAssetV1`).

Source: EPIC-015 `15.EPIC-FRONT-PAGE-ASSETS-BY-LOCATION.md` (FAL-001…037). Companion back change: `back-assets`.
