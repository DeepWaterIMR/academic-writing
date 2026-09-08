# docs/assets/

Everything a document reads but does not generate:

- `references.bib` — the project bibliography
- `*.csl` — citation styles; `ices_jms.csl` is the default
- `*.docx` — Word reference documents that give the output its styles
- `*.tex` — LaTeX partials included in the PDF header or after the body
- `*.lua` — Pandoc filters
- static figures, logos, and photographs the documents include

Paths in a YAML header are relative to the `.qmd`, so a document in `docs/<type>/` refers to
these as `assets/...` when the render happens from the document's own folder, or
`docs/assets/...` from the project root. Keep whichever convention the project uses
consistent across every document.

These files are tracked even though the root `.gitignore` blocks their extensions elsewhere —
that is what the `!docs/assets/**` negation is for.
