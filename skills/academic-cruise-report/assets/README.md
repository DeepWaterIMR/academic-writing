# Assets for `academic-cruise-report`

| File | What it is |
|---|---|
| `nettrapport_template.docx` | The Institute of Marine Research web-report Word template. Controls the styles the submission system expects |
| `imr-pdf-header.tex` | LaTeX preamble reproducing the same cover, colours, and heading styles in the PDF output |
| `imr-pdf-lastpage.tex` | The closing page, matching the last page of the Word template |
| `imr-logo.png`, `imr-chevron.png`, `imr-cover-gradient.png` | Cover artwork the LaTeX partials include. **A PDF build fails without all three** |

The `\includegraphics` paths in the partials are `../assets/...`, relative to the `.qmd` in
`docs/<type>/`. Keep the document there, or fix the paths to match.

These are institutional templates and branding belonging to the Institute of Marine Research.
Use them for material that comes from the institute, not for anything else — see
[`../../../LICENSE`](../../../LICENSE).
