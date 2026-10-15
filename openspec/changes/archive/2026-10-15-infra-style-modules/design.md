# Design

## Approach

- `panel-styles.scss` loads `_scss_variables.scss` with `@use './scss_variables' as *` so existing variable names keep working.
- `styles.scss` already loads its packs with `@use`.
- `@angular/build` 22.2.2 still compiles global styles through a virtual `@import 'src/styles.scss'`. That rule is not in the repository. `stylePreprocessorOptions.sass.silenceDeprecations` includes `import` so the build does not warn for that generated rule. Application files do not use `@import`.

## Decisions

| Topic | Decision |
| --- | --- |
| Application styles | Sass modules (`@use` / `@forward`) |
| Variables partial | `@use './scss_variables' as *` |
| CLI global entry | Silence the `import` deprecation until the Angular builder stops emitting it |

## Risks

- Silencing `import` also hides a future `@import` added in application code. Reviews should reject new `@import` rules.
