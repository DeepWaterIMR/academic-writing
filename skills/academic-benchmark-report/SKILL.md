---
name: academic-benchmark-report
description: Write a benchmark report — the full revision of a stock assessment method carried out at an ICES, AFWG, JRN-AFWG, or internal IMR benchmark workshop, covering data revision, candidate models, model selection, reference points, and the recommended stock annex. Use when the user is preparing for or writing up a benchmark.
metadata:
  version: "0.1.0"
license: MIT
---

# Benchmark report

Load [`../academic-style/SKILL.md`](../academic-style/SKILL.md) and
[`../academic-conventions/SKILL.md`](../academic-conventions/SKILL.md) first.

## What a benchmark is

A **benchmark** is a full revision of a stock assessment, carried out at a workshop on a
three-to-five-year cycle and reviewed by invited external experts. Stocks rotate through it;
between benchmarks the assessment is only updated, not redesigned.

The question is not *what is the state of the stock* — that is an
[assessment report](../academic-assessment-report/SKILL.md) — but **is this the right
assessment, and what should replace it**.

**The workshop's most important product is the stock annex**: the settings the annual
assessment will use until the next benchmark. Write the annex as the deliverable and the
chapter as the argument for it.

> **Check the workshop's terms of reference and a recent benchmark report before you start.**
> The sections below are stable in outline; the details are revised each round. This skill
> will be refined at each benchmark.

## Step 1 — Scaffold

```r
source("<academic-writing>/scaffold.R")
scaffold_document("config.yaml", "../stock-benchmark-2027", types = "benchmark-report")
```

The skeleton is `docs/benchmark-report/benchmark-report.qmd`. As with an assessment chapter:
no YAML `title:`, `number-sections: false`, the workshop's own Word template in
`docs/assets/`, and floats collected at the end with their assigned numbers in the captions.

## Step 2 — Sections

1. **Terms of reference and issues addressed** — what the workshop was asked to resolve, and
   the issue list it worked from.
2. **Stock identity and ecosystem context** — stock boundaries, mixing, and the environmental
   and ecosystem issues considered.
3. **Data** — catch and landings, survey indices, biological data, and **data quality and
   revisions**: what changed since the last benchmark and why the revised series is preferred.
4. **Assessment methods** — candidate models, exploration and diagnostics, model selection.
5. **Short-term forecast.**
6. **Biological reference points** — proposed values, their basis, and what they replace.
7. **Recommended stock annex** — the deliverable.
8. **Recommendations for future work** — specific enough to become the next issue list.
9. **Reviewers' report and issue list** — compiled by the workshop. Reference it; do not write
   it.
10. **Software and reproducibility** — package citations and the AI disclosure.

## Step 3 — Report what failed

This is the part that separates a benchmark from an assessment. **A benchmark that reports
only the accepted model is not reviewable.** Report the candidates that were tried and
rejected, the diagnostics that rejected them, and the convergence or estimability problems
that made a formulation unusable.

Keep one object per candidate model and derive the comparison, rather than typing a comparison
table by hand:

````
```{r}
#| label: tbl-candidates
#| tbl-cap: "Table X.1. Candidate assessment models: structure, data used, and the issue each addresses."
```
````

State the **selection criteria and the order they were applied in** before giving the choice.
A selection that is only justified afterwards reads as a preference.

## Step 4 — The stock annex

Write it so that next year's stock coordinator can run the assessment from it alone: the data
inputs and how they are processed, the model configuration, the forecast assumptions, and the
reference points. Anything the annex leaves implicit will be guessed at, differently, by
whoever runs the assessment next.

## Writing it

- **Every value derives from the model runs.** A benchmark compares several fits; typed
  numbers go stale between runs faster here than anywhere else.
- **Say whether each index is relative or absolute**, its effort denominator, and how zero
  catches were handled. Revising these is often the whole point of the benchmark. See
  [`../academic-style/references/ecology-fisheries.md`](../academic-style/references/ecology-fisheries.md).
- **Distinguish what the data show from what the model estimates.** See
  [`../academic-style/references/distinctions.md`](../academic-style/references/distinctions.md).
- **Add the AI disclosure**, as for every other type.

## Rendering

```bash
Rscript docs/render.R benchmark-report docx
```

## Done

Report which sections are drafted, which model comparisons are complete, whether the stock
annex is written, and what the workshop still has to supply.
