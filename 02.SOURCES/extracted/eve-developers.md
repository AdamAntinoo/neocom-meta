# EVE Online Developers (portal home)

- URL: https://developers.eveonline.com/
- Fetched: 2026-10-12

## Summary

The EVE Developers portal home is primarily a blog/news surface for ESI platform updates, plus entry points to create/manage applications, documentation, and community showcase. It establishes that third-party developers use CCP’s developer platform (applications, ESI routes, static data export, OpenAPI) but does not itself specify OAuth/SSO mechanics.

## Requirements

- Developers can **Create** an application via the portal (“Create your application now”) and **Manage** applications (“Manage Applications”).
- Platform direction signals from published posts (informational, not Login-normative):
  - ESI continues to gain routes for game features (SKINR, Military Campaigns, corporation palette, titles/achievements, structures/sovereignty/access lists).
  - Remaining Swagger specs are being removed in favor of **OpenAPI**.
  - Static data export (SDE) is used alongside ESI for some definitions.

## Concepts / tokens

- ESI (EVE Swagger Interface / EVE API)
- Applications / developer portal login
- OpenAPI (migration away from Swagger)
- Static Data Export (SDE)
- Documentation, API Explorer, Community Showcase
- Blog topics: SKINR, Military Campaigns, Corporation Palette, character titles/achievements, Upwell structures, Access Lists, sovereignty

## Implications for NEOCOM

- **Application registration** on this portal is a prerequisite for EVE SSO (confirmed in detail on the SSO docs page).
- ESI + OpenAPI + SDE are the data-plane surfaces NEOCOM may later consume after Login establishes tokens; this home page does not define scopes or token handling.
- Blog posts are change-log context only—do not treat them as Login requirements without Spec Collect.

## Open questions

- What application type (web vs native/public) and redirect URIs will NEOCOM register?
- Which ESI scopes (if any beyond identity/login) are needed for the initial Login feature vs later features?
