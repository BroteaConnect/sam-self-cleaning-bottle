# Sam Self Cleaning Bottle

Landing page with a requirements form, generated from Brotea's
`landing-astro` template.

## Template placeholders (replaced by the new-project skill)
- `Sam Self Cleaning Bottle` — human-readable project name
- `sam-self-cleaning-bottle` — kebab-case slug (also the repo name)
- `sam self cleaning bottle` — one-sentence idea/description
- `sam-self-cleaning-bottle` — same slug, used in machine-validated name
  fields (package.json) where leading underscores are illegal

## Configuration
- `PUBLIC_REQUIREMENTS_ENDPOINT` — URL that receives the form's JSON POST
  (`{project, source, submitted_by, content}` → requirements table).
  Without it the form politely refuses to submit.

## Commands
- `npm install` · `npm run dev` · `npm run build` (output in `dist/`)
