# Project structure

One layout for every document type in this pack. `scaffold.R` creates it; keep to it when you
add to an existing project, and propose migrating a project that predates it rather than
maintaining two conventions.

```
<project>/
├── R/                  Scripts and functions
│   ├── 0_setup.R       Packages, config, theme, figure widths. Sourced by every document
│   ├── 1_data.R        …numbered by run order
│   ├── 2_analysis.R
│   ├── report_helpers.R    Function libraries stay un-numbered
│   └── docx_postprocess.R
├── docs/               Every document: .qmd sources and rendered output
│   ├── assets/         references.bib, *.csl, *.docx templates, *.tex partials,
│   │                   *.lua filters, and static figures the qmd includes
│   ├── render.R        Renders non-HTML formats and post-processes them
│   └── <type>/         One folder per document, e.g. manuscript/, cruise-report/
├── data/               All data
├── figures/            Output figure files
├── logs/               Scratch logs — screen sessions, long renders. Non-crucial
├── ai/                 Agent territory. Keep it small
│   ├── memory/         Project memory: MEMORY.md plus one fact per file
│   ├── tests/          Tests the agent writes
│   └── review/         Review notes and audit output
├── config/             GitHub, web, and test configuration
├── config.yaml         Project settings, read at run time by R/0_setup.R
├── AGENTS.md           Agent contract for this project
├── CLAUDE.md           Claude pointer to AGENTS.md
├── VERSION             version: and date:
├── .gitignore
└── .here               Marks the root for here::here() before Git is initialised
```

## What goes where

**`R/`** — everything executable. Number a script when it has a place in a run order, and give
the number a meaning: `0_` is setup, `1_` acquires and compiles data, `2_` onwards are
analysis steps. Files that only define functions are libraries, not steps, and stay
un-numbered. Every function gets Roxygen2 documentation.

**`docs/`** — sources and output together, one subfolder per document. Anything a `.qmd` reads
but does not generate lives in `docs/assets/`: the bibliography, the CSL style, Word reference
documents, LaTeX partials, Lua filters, logos, and photographs.

**`data/`** — the data. Subdivide it as the project needs (`data/source/`, `data/output/`),
and keep a `README.md` in each subfolder saying where the contents came from, because the
contents themselves are not committed.

**`figures/`** — figure files written out for use elsewhere. Figures a document generates and
embeds do not need to be here.

**`logs/`** — temporary storage. Anything in here can be deleted without loss.

**`ai/`** — the agent's own space; the user should not have to work in it. Project memory in
`ai/memory/` (read `MEMORY.md` first, one fact per file, link related facts), tests in
`ai/tests/`, review output in `ai/review/`. Keep the total small: it is read into context
often.

**`website/`** — not scaffolded. Create it only when the user asks for a project website (a
Quarto site, a GitHub Pages source, or the assets for either); most writing projects do not
need one.

**`config/`** — GitHub Actions, linter settings, and anything else configuring tooling rather
than the analysis. Analysis settings belong in `config.yaml`.

**`config.yaml`** — the single source of project settings, read at run time by `R/0_setup.R`.
Edit settings here, not in the documents.

## VERSION

```
version: 0.1.0
date: 2026-09-08
```

Start at `0.1.0`. The pre-commit hook bumps the patch level and refreshes the date on every
commit. To bump the minor or major level, edit the file by hand before committing — the hook
keeps a hand-set version and only refreshes the date. Enable the hook once per clone:

```bash
git config core.hooksPath .githooks
```

## `.here`

A single-line marker file so `here::here()` resolves before Git is initialised, and in
projects that never become repositories.

## Migrating an older project

Move files rather than copying them, so nothing is maintained twice, and do it in one commit
so the diff is legible. The paths that usually need updating afterwards:

- `knitr::opts_knit$set(root.dir = ...)` and `here::here()` calls in each `.qmd`;
- `bibliography:` and `csl:` in every YAML header;
- `reference-doc:` and `include-in-header:` paths;
- `source()` calls between scripts;
- the `.gitignore`, which anchors its directory rules to the repository root.
