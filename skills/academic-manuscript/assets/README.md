# Assets for `academic-manuscript`

| File | What it is |
|---|---|
| `custom-reference-doc.docx` | A generic Word reference document: heading styles, body text, caption styles, and margins for a manuscript. Pandoc keeps its styles and replaces its body, so it controls how the Word output looks without contributing any content |

Journals that supply their own template supersede this one. Drop theirs into the project's
`docs/assets/` and change `reference-doc:` in the YAML.

The citation style and bibliography come from the project template. To submit to a journal
that does not use the ICES style, download its CSL from the
[Zotero style repository](https://www.zotero.org/styles) into `docs/assets/` and change the
`csl:` line.
