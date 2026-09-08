---
name: academic-advice-sheet
description: Write a fishing-opportunities advice sheet for ICES or the Institute of Marine Research — the short standardised public document carrying catch advice to managers, with the fixed section order, catch scenarios, reference points, and advice history, in the IMR or ICES Word template. Use when the user needs to produce or update catch advice.
metadata:
  version: "0.1.0"
license: MIT
---

# Advice sheet

Load [`../academic-style/SKILL.md`](../academic-style/SKILL.md) and
[`../academic-conventions/SKILL.md`](../academic-conventions/SKILL.md) first.

An advice sheet is the short public document that carries catch advice to managers. It is read
by fisheries managers, industry, and journalists, and quoted directly. **Two properties follow
from that:** the structure is fixed and readers navigate by it, and every number must be
correct, because an error here is a public one.

## Step 1 — Scaffold

```r
source("<academic-writing>/scaffold.R")
scaffold_document("config.yaml", "../stock-advice-2027", types = "advice-sheet")
```

The skeleton is `docs/advice-sheet/advice-sheet.qmd`. Both Word templates ship with it.

## Step 2 — Pick the template

| Body | Template | Filter |
|---|---|---|
| Institute of Marine Research | `assets/advice_template_imr.docx` | `assets/normal-style.lua` |
| ICES | `assets/advice_template_ices.docx` | none |

The IMR template expects body text in Word's *Normal* style; the Lua filter puts it there.
Remove the filter when rendering against the ICES template, or every paragraph is forced into
a style that template does not use.

The ICES sheet also carries a masthead — ecoregion, publication line, and the stock heading —
which is emitted from R rather than typed, because the wording is standardised and the
publication date changes at release. Where that is needed, leave `title:` empty and write the
masthead in a `#| results: asis` chunk.

## Step 3 — The section order

Do not reorder or rename these. Readers, and the advice database, navigate by them.

1. Advice on fishing opportunities
2. *(ICES)* Non-fisheries conservation considerations
3. Stock development over time
4. Catch scenarios
5. Basis of the advice
6. Quality of the assessment
7. Issues relevant for the advice
8. Reference points
9. Basis of the assessment
10. History of the advice, catch, and management
11. Summary of the assessment
12. Sources and references

**The advice goes in the first sentence of section 1**, with its basis named — MSY approach,
precautionary approach, or a management plan:

> Based on the MSY approach, catches in `` `r params$advice_year` `` should be no more than
> `` `r fmt(advice)` `` tonnes.

## Step 4 — Every number is inline R

Without exception. Derive the advised catch, the stock status against each reference point,
the change from last year's advice, and the whole catch-scenario table in one chunk from the
assessment output.

Two habits that prevent the errors this document type actually suffers:

- **`params:`** carry the assessment year, the advice year, the previous advice, and the most
  recent agreed TAC. Everything else derives from them.
- **Build parameterised captions as string objects** and reference them with
  `#| tbl-cap: !expr cap_catch_scenarios`, rather than calling `sprintf()` inline where a
  literal `%` has to be doubled.

Values that change at release — the publication line, the advice DOI, the download URL — sit
in a clearly marked block near the top, so the annual edit is one place.

## Writing it

- **Say whether the stock is above or below each reference point**, using the framework's own
  terms, and say what that implies for the advice.
- **State the basis of the advice explicitly.** A reader must be able to tell an MSY advice
  from a precautionary one without inferring it.
- **Quality of the assessment** is where the honest caveats go. Do not soften them; managers
  are entitled to know how much confidence the number carries.
- **Distinguish landings, catch, and removals**, and say whether discards and recreational
  catch are included.
- **Add the AI disclosure** under *Basis of the assessment*. Advice sheets have historically
  carried none. See
  [`../academic-style/references/ai-disclosure.md`](../academic-style/references/ai-disclosure.md).

## Rendering

```bash
Rscript docs/render.R advice-sheet docx
```

HTML previews from the Preview/Render button, styled with `assets/ices_advice.css`. The Word
post-processing unwraps Quarto's wrapper tables so the floats sit inline.

## Related

The assessment behind the advice is an
[`../academic-assessment-report/SKILL.md`](../academic-assessment-report/SKILL.md).

## Done

Report which sections are drafted, whether the numbers come from the current assessment run,
and which release-time values — publication date, DOI, download URL — still need filling in.
