# YAML headers

Every document in this pack shares a core. Document-type skills add their own `format:` blocks
on top of it.

## The shared core

```yaml
---
title: "Document title"
subtitle: "Optional second line"
author:
  - name: Author Name
    affiliations:
      - ref: imr
    corresponding: true
    email: name@example.org
    orcid: 0000-0000-0000-0000
affiliations:
  - id: imr
    name: Institute of Marine Research, Norway
date: today
published-title: "Version"
lang: en-US
bibliography: assets/references.bib
csl: assets/ices_jms.csl
format:
  html:
    self-contained: true
    toc: true
    fig-width: 6.69
    fig-height: 5
execute:
  echo: false
  warning: false
  message: false
editor_options:
  chunk_output_type: console
---
```

Notes on the fields that matter:

- **`author:` is a human byline.** Preserve the existing authors when revising a document.
  Otherwise take names and affiliations from project configuration or explicit user input.
  Never substitute a role such as “project analysis”, the report title, or an AI system; ask
  if the accountable author is not recorded.
- **`html` comes first** in `format:`. Quarto renders the first format by default, so the
  editor's Preview/Render button gives HTML with no arguments.
- **`date: today`** with **`published-title: "Version"`** turns the date line into a version
  stamp. Use `date: last-modified` where the document is updated in place. Inspect the
  rendered title block and fail the review if it still says “Published”.
- **`lang: en-US`** matches the American English default; set `en-GB` where the target
  requires British English, and change the prose to match.
- **`fig-width: 6.69`** is 170 mm, the ICES double-column width. `3.35` is 85 mm, single
  column. Nothing in between. Override `fig-height` per chunk, not `fig-width`.
- **`execute: echo: false`** hides code in a finished document. A data report inverts this —
  see below.
- Paths in `bibliography:`, `csl:`, `reference-doc:`, and `include-in-header:` are relative to
  the `.qmd`. Keep them inside `docs/assets/` so they resolve the same way from every document
  folder.

## Showing code: two settings that look alike

- **`execute: echo: false`** — code hidden entirely. Manuscripts, cruise reports, advice
  sheets.
- **`format: html: code-fold: true`**, with `echo` left alone — code present but collapsed
  behind a fold. This is the data-report pattern: the document doubles as a methods appendix,
  and every analysis step is one click away.

Do not set both. `echo: false` wins, and the fold silently does nothing.

## `params:`

Use parameters for values that change between editions of the same document — assessment year,
advice year, previous advice, whether to refresh data from a server:

```yaml
params:
  assessment_year: 2026
  advice_year: 2027
  update_data: false
```

Read them as `params$assessment_year`. Everything derived from them stays inline R, so a
single edit propagates. Do not use parameters for settings that belong in `config.yaml` —
parameters are per-document, `config.yaml` is per-project.

## Cross-references

Standard kinds — `fig-`, `tbl-`, `sec-`, `lst-`, `eq-` — need only a matching label. Custom
kinds are declared in `crossref:`:

```yaml
crossref:
  custom:
    - kind: float
      key: suppfig
      latex-env: suppfig
      reference-prefix: Figure S
      space-before-numbering: false
      latex-list-of-description: Supplementary Figure
```

`crossref: chapters: true` numbers floats by chapter, which is what a working-group report
usually wants. To bold the float prefixes in an ICES-style document:

```yaml
crossref:
  fig-title: '**Figure**'
  tbl-title: '**Table**'
  title-delim: '**:**'
```

## Format-conditional content

```markdown
::: {.content-visible when-format="docx"}
![Institute logo](assets/logo.png){width=1.65in fig-align="left"}
:::

::: {.content-visible when-format="html"}
A note that only makes sense in the interactive version.
:::
```

Raw blocks reach the underlying format directly. A Word page break:

````
```{=openxml}
<w:p><w:r><w:br w:type="page"/></w:r></w:p>
```
````

`{{< pagebreak >}}` is the portable version and works in HTML, Word, and PDF. Prefer it.

## Root directory

A `.qmd` in `docs/<type>/` is two levels below the project root. Either set the root once in a
setup chunk:

```r
knitr::opts_knit$set(root.dir = here::here())
```

or use `execute-dir: project` in the YAML. Pick one per project and use it everywhere;
mixing them makes relative paths unpredictable.

## Things that break quietly

- A trailing space after a YAML key, or a tab anywhere in the block.
- `fig-width` set inside `execute:` **and** inside a `format:` block — the format wins, which
  is rarely what you meant.
- `output-file:` at top level applies to every format; inside a `format:` block it applies to
  that one. Both are valid; know which you wrote.
- `prefer-html: true` is needed when a document renders to Word but contains HTML widgets.
- A caption containing a colon must be quoted. A caption containing LaTeX maths needs the
  backslashes doubled inside a double-quoted string, or single quotes around the whole thing.
