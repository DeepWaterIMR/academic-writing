# Assets for `academic-benchmark-report`

**No Word template ships with this skill, deliberately.** ICES, AFWG, and JRN-AFWG issue a new
workshop template each round, and a stale one produces a document the group will reject.

Get the current one from the working group, put it in the project's `docs/assets/`, and name
it in the document YAML:

```yaml
format:
  docx:
    reference-doc: ../assets/wg-report-template.docx
```

The citation style (`ices_jms.csl`) and the bibliography come from the project template and
are already in `docs/assets/`.
