# Tasks

## Page header

- [ ] Add `app-page-header` with `-APP-` / `-AUTH-` variants, `cy-section-name="header"`, and provider → render injection (UI-HDR-001…009)
- [ ] Enforce `vn-` selectors for domain-bound panels/renders; stop using legacy unversioned header panels for new work (UI-VER-001…003)
- [ ] Implement `v1-application-info-render` Appearance (panel-white, name/version/copyright typography) (UI-AIP-001…005)
- [ ] Implement `v1-server-status-render` Appearance (panel-blue, Elemental line 1, Open Sans metrics, CAPSULEERS = SDE + players, NEXT DT) (UI-SSP-001…007)

## Dashboard

- [ ] Make Dashboard the secured post-login home after character selection (UI-DASH-001, UI-DASH-002)
- [ ] Layout rows: `app-page-header` (`-APP-`), pilot & corporation, breadcrumb, feature list listing panel (UI-DASH-003, UI-DASH-005, UI-DASH-007)
- [ ] Breadcrumb trail: Dashboard start; each crumb a navigable link; non-Dashboard secured pages reflect Dashboard → … (UI-DASH-008, UI-DASH-010)
- [ ] Feature list via data provider + feature render; no hard-coded slots (UI-DASH-004, UI-DASH-009)
- [ ] Parent feature navigation opens feature dashboard with scoped feature list; reuse secured chrome (UI-DASH-012, UI-DASH-013, UI-DASH-014)

## EVE media

- [ ] Apply Image Server URL builder pattern in renders that show portraits/logos/type icons (UI-MED-001, UI-MED-003, UI-MED-004)
- [ ] Enforce size power-of-two 32…1024, tenant `tranquility` default, missing id → `1` (UI-MED-005…007)
- [ ] Confirm backend does not proxy/store/cache image bytes (UI-MED-002, UI-MED-008)

## Corporation

- [ ] Place corporation panel right of pilot; id from selected Pilot (UI-CORP-001, UI-CORP-003)
- [ ] Obtain public corp data via NeoCom back/provider; consume name/ticker/members/tax/ceo/home/alliance fields (UI-CORP-002, UI-CORP-004, UI-CORP-012)
- [ ] Implement `v1-corporation-render` HEADER Appearance + model-strip specimen (UI-CORP-005…011, UI-CORP-013)

## Character selection

- [ ] Provide character selection UI (page or panel) in the auth experience before Dashboard (UI-CHAR-002)
- [ ] Align visual template with EPIC-006 listing/render patterns and PilotV2 (UI-CHAR-002)
