# Sam Self Cleaning Bottle — documentation

Static Astro landing page for the Sam Self Cleaning Bottle, built from
Brotea's `landing-astro` template. Live at
<https://sam-self-cleaning-bottle.brotea.dev/> (English) and
<https://sam-self-cleaning-bottle.brotea.dev/es/> (Spanish).

## Pages

- [landing-page.md](landing-page.md) — page structure and sections (hero,
  features, how it works, FAQ, CTA, lead form), the `FeatureCard`
  component, and the theme-token styling rules.
- [i18n.md](i18n.md) — locale dictionaries, key groups, the
  English-first / Spanish-mirror contract, and how the locales test gates
  CI.

## Quick facts

- Fully static (`output: 'static'`); no database. The only data path is
  the lead form's JSON POST to `PUBLIC_REQUIREMENTS_ENDPOINT`
  (default `https://api.brotea.dev/requirements`).
- Zero hardcoded user-facing copy: every string comes from
  `src/locales/<code>.json` via `t(locale, key)` and CI blocks merges
  when any shipped language is incomplete.
- `npm install` · `npm run dev` · `npm run build` (output in `dist/`).
