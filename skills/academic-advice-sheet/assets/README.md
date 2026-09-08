# Assets for `academic-advice-sheet`

| File | What it is |
|---|---|
| `advice_template_imr.docx` | Institute of Marine Research advice-sheet Word template |
| `advice_template_ices.docx` | ICES advice-sheet Word template |
| `normal-style.lua` | Pandoc filter putting every paragraph in Word's *Normal* style. **Required by the IMR template, and wrong for the ICES one** |
| `ices_advice.css` | Styles the HTML preview to resemble the printed sheet |

Pick one template and match the filter to it: with `advice_template_imr.docx` keep
`filters: [../assets/normal-style.lua]`; with `advice_template_ices.docx` remove it, or every
paragraph is forced into a style that template does not use.

These are institutional templates belonging to the Institute of Marine Research and ICES — see
[`../../../LICENSE`](../../../LICENSE).
