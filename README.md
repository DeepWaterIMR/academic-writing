<!-- badges / logo go here once available -->

# ✍️ academic-writing — Write scientific documents with AI agents

<!-- version -->**Version 0.1.8** (2026-09-08)<!-- /version -->

**Teach your AI agent to write like a scientist — one style, one set of technical conventions, and six ready document templates.**

academic-writing is a knowledge pack that turns a general coding agent (Claude Code, Codex, Cursor, Mistral, a local model, …) into a competent, *supervised* co-author for academic writing in **ecology and fisheries science**. It carries:

1. **A writing style** — accountability, tense, hedging, numbers, units, species names, figure and table wording. Editor-independent: it applies in Quarto, Word, LaTeX, or a plain text box.
2. **Technical conventions** — reproducible Quarto and R: project structure, YAML, BibTeX, ICES figure widths, inline R instead of hard-coded numbers, local Git, rendering to HTML, Word, and PDF.
3. **Six document templates** — manuscript, data report, cruise report, assessment report, advice sheet, benchmark report. Each is a skill plus a runnable `.qmd` skeleton.

> **You are the author.** The pack encodes the [ICMJE Recommendations](https://www.icmje.org/icmje-recommendations.pdf): a language model is never an author, its use is disclosed in the methods, and the humans remain accountable for every word. It is not a trained model — your text never enters any model's weights. The agent simply *reads this repo* while it helps you.

## 🚀 Quickstart

1. **Install it.** Type this to your agent:

   ```
   install https://github.com/DeepWaterIMR/academic-writing
   ```

   It clones the repo and copies the skills into your agent's global skills folder, once per machine. See [`skills/academic-writing-install`](skills/academic-writing-install/SKILL.md).

2. **Start a document:**

   ```
   Let's write a manuscript about beaked redfish distribution in the Barents Sea,
   using academic-writing.
   ```

   The agent agrees the argument and the figures with you, scaffolds a project, and starts writing.

3. **Or just fix some prose.** The style skill works on its own, in any editor:

   ```
   This paragraph reads like a chatbot wrote it. Fix it using academic-style.
   ```

> **Manual install:** clone the repo and open your agent in the folder, or point its instructions at `<clone>/skills/`. Nothing here needs a network connection at use time.

## 🗂️ What's inside

| Folder | Contents |
|---|---|
| `skills/` | Twelve skills. `academic-style` and `academic-conventions` are the foundation; six are document types; the rest install, update, review, and set up the toolchain |
| `project-template/` | The project skeleton a scaffolded project gets, with the shared R helpers and the six `.qmd` skeletons |
| `examples/` | A filled-in `config.yaml` to copy |
| `scaffold.R` | `scaffold_document()` — creates a project from `config.yaml` |
| `config/` | `validate-skills.R`, the structural and privacy check |

## 🧭 The skills

| Skill | What it does |
|---|---|
| [`academic-style`](skills/academic-style/SKILL.md) | How the prose must read. Ten rules, plus eight reference files on IMRaD structure, sentences, distinctions, citations, floats, field conventions, AI disclosure, and checklists |
| [`academic-conventions`](skills/academic-conventions/SKILL.md) | How the document is built. Project structure, YAML, bibliography and CSL, packages, rendering, Git |
| [`academic-manuscript`](skills/academic-manuscript/SKILL.md) | A paper for journal submission |
| [`academic-data-report`](skills/academic-data-report/SKILL.md) | An internal reproducible analysis, every chunk visible but folded |
| [`academic-cruise-report`](skills/academic-cruise-report/SKILL.md) | A survey metadata report, with Word output for the institute web-report system |
| [`academic-assessment-report`](skills/academic-assessment-report/SKILL.md) | A stock assessment chapter for ICES, AFWG, JRN-AFWG, or IMR |
| [`academic-advice-sheet`](skills/academic-advice-sheet/SKILL.md) | A fishing-opportunities advice sheet, IMR or ICES |
| [`academic-benchmark-report`](skills/academic-benchmark-report/SKILL.md) | A full revision of an assessment method, and its stock annex |
| [`scientific-quarto-review`](skills/scientific-quarto-review/SKILL.md) | Review and audit an existing `.qmd` or `.Rmd` |
| [`academic-toolchain-setup`](skills/academic-toolchain-setup/SKILL.md) | Install Git, R, Quarto, Rtools, TinyTeX. Windows first |
| [`academic-writing-install`](skills/academic-writing-install/SKILL.md) · [`academic-writing-update`](skills/academic-writing-update/SKILL.md) | Set the pack up, and keep it current |

## 🔒 Privacy and scope

This repo is **public and contains instructions and document templates only — never data**. No research records, no private paths, no coordinates. Real data lives only in the project folder the agent generates for you, where `data/`, `logs/`, and `figures/` are git-ignored.

Documents are written locally, committed to a **local** Git repository with **no remote by default**, and never pushed without you asking.

## 🧰 Siblings

academic-writing is deliberately general-purpose. Domain machinery lives elsewhere:

- [**BAIT**](https://github.com/DeepWaterIMR/BAIT) — IMR Biotic data access, privacy, maps, life history.
- [**index-template**](https://github.com/DeepWaterIMR/index-template) — sdmTMB spatiotemporal survey indices.

Install whichever you need alongside; the skills stay out of each other's way.

## 🚨 You are still in charge

The agent drafts, checks, and formats. It does not decide what is true. Every claim traces to code, a displayed result, or a verified source; anything it cannot verify comes back to you marked `[VERIFY]` rather than smoothed over. Read what it wrote before you sign it.

## 🙋 Contributing

See [`CONTRIBUTING.md`](CONTRIBUTING.md). Run `Rscript config/validate-skills.R` before opening a pull request.

## 📄 Licence

MIT, except the bundled institutional templates and citation style, which keep their own terms — see [`LICENSE`](LICENSE).
