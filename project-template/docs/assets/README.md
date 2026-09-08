# docs/assets/

Everything a document reads but does not generate:

- `references.bib` — the project bibliography
- `*.csl` — citation styles; `ices_jms.csl` is the default
- `*.docx` — Word reference documents that give the output its styles
- `*.tex` — LaTeX partials included in the PDF header or after the body
- `*.lua` — Pandoc filters
- static figures, logos, and photographs the documents include

**Paths in a YAML header are resolved relative to the `.qmd`, not to the project root.** A
document in `docs/<type>/` therefore refers to these files as `../assets/...`, and so do the
`\includegraphics` paths inside the LaTeX partials. Keep every document to that convention.

These files are tracked even though the root `.gitignore` blocks their extensions elsewhere —
that is what the `!docs/assets/**` negation is for.
