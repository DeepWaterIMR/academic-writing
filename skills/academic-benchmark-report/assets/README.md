# Assets for `academic-benchmark-report`

**No files of its own.** A benchmark uses the same three Word templates as an assessment
report, and `scaffold.R` copies all three into a scaffolded project's `docs/assets/`:

| Body | Template | Owned by |
|---|---|---|
| ICES | `ices_scientific_reports_template.docx` | [`academic-assessment-report`](../../academic-assessment-report/assets/) |
| JRN-AFWG | `jrn_afwg_report_template.docx` | [`academic-assessment-report`](../../academic-assessment-report/assets/) |
| Internal IMR | `nettrapport_template.docx` | [`academic-cruise-report`](../../academic-cruise-report/assets/) |

Keeping one copy of each rather than duplicating them per skill is what the `extra_assets`
field in `scaffold.R`'s `DOCUMENT_TYPES` is for.

Pick one in the document YAML:

```yaml
format:
  docx:
    reference-doc: ../assets/ices_scientific_reports_template.docx
```
