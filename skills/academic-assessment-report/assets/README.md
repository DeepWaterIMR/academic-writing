# Assets for `academic-assessment-report`

| File | What it is |
|---|---|
| `jrn_afwg_report_template.docx` | JRN-AFWG report template |
| `ices_scientific_reports_template.docx` | The ICES Scientific Reports chairs template, used for benchmark and workshop reports |

The internal-IMR route uses the institute's web-report template,
[`../../academic-cruise-report/assets/nettrapport_template.docx`](../../academic-cruise-report/assets/nettrapport_template.docx).
`scaffold.R` copies it into `docs/assets/` alongside these two, so all three are available in
a scaffolded project and switching is one YAML line:

```yaml
format:
  docx:
    reference-doc: ../assets/jrn_afwg_report_template.docx
```

**ICES and the working groups reissue their templates.** Check the shipped one is still
current before relying on it; if the group has a newer one, put it in the project's
`docs/assets/` and point `reference-doc:` at that instead. A stale template produces a
document the group will reject.

The citation style (`ices_jms.csl`) and the bibliography come from the project template and
are already in `docs/assets/`.

These are institutional templates belonging to ICES, JRN-AFWG, and the Institute of Marine
Research — see [`../../../LICENSE`](../../../LICENSE).
