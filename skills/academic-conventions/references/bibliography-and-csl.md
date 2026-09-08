# Bibliography and citation style

## Where the bibliography lives

`docs/assets/references.bib`, unless the project already has a BibTeX file or the user names
another. One file per project; a document that needs a subset gets it through `nocite:`, not
through a second file.

```yaml
bibliography: assets/references.bib
csl: assets/ices_jms.csl
```

Cite with `@key` for a narrative citation and `[@key]` for a parenthetical one; `[@a; @b]` for
several. Force an uncited entry into the list with:

```yaml
nocite: |
  @ices2018a, @ices2018b
```

The reference list renders where you put the div:

```markdown
# References

::: {#refs}
:::
```

Without that div the list lands at the end of the document, which is wrong for anything with
appendices after the references.

## Citation style

**ICES Journal of Marine Science is the default**, shipped as
`docs/assets/ices_jms.csl`. It is author–year, which is what the field expects.

To use another style, drop the `.csl` into `docs/assets/` and change one line:

```yaml
csl: assets/frontiers.csl
```

Styles come from the [Zotero style repository](https://www.zotero.org/styles) — over 10 000 of
them, most journals included, all CC BY-SA. Download the file rather than linking to a URL, so
the document renders offline and reproducibly.

Where a project has to support two targets, keep both files and swap the line; do not try to
make one style serve both.

## Software citations

Base R and every package that influenced the results are cited, in Materials and methods,
beside the AI disclosure.

**Get the BibTeX from R, never from memory:**

```r
citation()                       # base R
citation("ggplot2")              # a package
toBibtex(citation("ggplot2"))    # BibTeX to paste into references.bib
```

Write them all out at once and append to the bibliography:

```r
pkgs <- c("ggplot2", "sf", "ggOceanMaps", "quarto", "knitr")
writeLines(
  c(format(citation(), style = "bibtex"),
    unlist(lapply(pkgs, function(p) format(citation(p), style = "bibtex")))),
  "docs/assets/software.bib"
)
```

Then rename the keys to something stable and readable — `@ggplot2`, `@rcoreteam` — and check
for duplicates. Some packages emit several entries; keep the one the maintainers ask you to
cite.

Report versions with inline R rather than typed numbers:

```markdown
`r R.version.string`, Quarto `r quarto::quarto_version()`, knitr `r packageVersion("knitr")`
```

## Verifying references

Every citation needs a resolvable DOI or URL to the primary source, confirmed to exist in the
form written. Mark anything you could not verify as `[VERIFY: ...]` **in the prose**, never in
the `.bib` file, so it cannot silently render into a bibliography.

Style rules for citing — ordering, *et al.*, not creating myths from hedged sources — are in
[`../../academic-style/references/citations.md`](../../academic-style/references/citations.md).

## Common failures

- A `@key` with no entry renders as a literal `@key` in the output. Search the rendered
  document for `@` before you call it done.
- An entry in the `.bib` that nothing cites is invisible unless `nocite:` pulls it in. Check
  both directions.
- A key containing a colon or a comma breaks the citation silently. Use letters, digits,
  hyphens.
- A `.bib` saved as anything but UTF-8 mangles Scandinavian characters in author names.
- Two entries with the same key: the later one wins, without warning.
