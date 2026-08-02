# Landing page

One Astro page renders every language: `src/pages/[...lang]/index.astro`
serves `/` (English, the default locale) and `/es/` (Spanish), with
`hreflang` alternates in `<head>` and a `LanguageSwitcher` in the top bar.
The `<meta name="description">` comes from the `meta.description` locale
key.

## Sections (top to bottom)

| Section | Content | Locale keys |
|---|---|---|
| Hero | h1 title, tagline, supporting line, CTA button anchoring to `#requirements-form` | `hero.title`, `hero.tagline`, `hero.sub`, `hero.cta` |
| Features | 4 benefit cards in a responsive grid (self-cleaning tech, insulation, durable materials, easy care) | `features.title`, `features.1-4.title/body` |
| How it works | Ordered list, 3 steps | `how.title`, `how.step1-3` |
| FAQ | 4 native `<details>`/`<summary>` entries | `faq.title`, `faq.1-4.q/a` |
| CTA | Card with title, subtitle and a second button to the form | `cta.title`, `cta.sub` (button reuses `hero.cta`) |
| Lead form | Requirements capture card (`id="requirements-form"`) | `form.*` |

The copy is deliberately benefit-level: no wavelengths, battery hours or
capacities are stated anywhere, so none should appear in docs or marketing
derived from it.

## FeatureCard component

`src/components/FeatureCard.astro` — a benefit card with no copy of its
own; all text arrives already translated via props.

```astro
<FeatureCard
  title={t(locale, 'features.1.title')}
  body={t(locale, 'features.1.body')}
/>
```

Props: `{ title: string; body: string }`. Renders an `<article>` with an
`<h3>` and a `<p>`.

## Styling rules

All styling uses theme tokens only (`src/styles/theme.css`) — e.g.
`--surface`, `--border`, `--radius-lg`, `--shadow`, `--space-5`,
`--font-display`, `--muted` — so every section works in both light and
dark color schemes. Never hardcode colors, fonts or spacing.

## Lead form (unchanged contract)

The form card posts JSON to the endpoint in
`PUBLIC_REQUIREMENTS_ENDPOINT` (default
`https://api.brotea.dev/requirements`):

```json
{
  "project": "sam-self-cleaning-bottle",
  "source": "landing_form",
  "submitted_by": "Name <email>",
  "content": "…"
}
```

The Docker build gate greps `dist/index.html` for
`data-endpoint="https://…"`, so the form (and its `data-endpoint`
attribute) must stay present in the built HTML.
