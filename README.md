# Sam Self Cleaning Bottle

Product landing page for the Sam self-cleaning water bottle, with a
requirements form. Generated from Brotea's `landing-astro` template;
English content with a full Spanish mirror (`/` and `/es/`). Live at
<https://sam-self-cleaning-bottle.brotea.dev/>.

See [docs/](docs/README.md) for page structure and the i18n contract.
All user-facing copy lives in `src/locales/<code>.json` — never in
components.

## Configuration
- `PUBLIC_REQUIREMENTS_ENDPOINT` — URL that receives the form's JSON POST
  (`{project, source, submitted_by, content}` → requirements table).
  Without it the form politely refuses to submit.

## Commands
- `npm install` · `npm run dev` · `npm run build` (output in `dist/`)
