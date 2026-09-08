# Git in a writing project

## Local by default

Every project is a Git repository. **It has no remote unless the user adds one, and you never
push.** Adding a remote and publishing are the user's decisions, and a writing project often
contains material that is not ready or not permitted to leave the machine.

```bash
git init
git config core.hooksPath .githooks   # if the project ships the version hook
```

Commit with the user's own identity, from their global `git config`. Do not set a per-project
identity, and do not commit as yourself.

## Committing

Commit as the work progresses rather than in one lump at the end: a scaffold, a data step, a
draft section, a figure change. Small commits make a bad edit easy to find and undo, which
matters more in a document than in code, because prose has no test suite.

Write the message so the author can read it in a year: what changed and why, not which files
you touched. Reference the section or the figure by name.

Before committing:

- confirm the document still renders;
- confirm no data file, credential, or absolute path is staged;
- run `git status --short` and look at what you are about to include.

## `.gitignore`

The pattern below keeps the folder skeleton in the repository while ignoring the contents, so
a fresh clone has somewhere to put things:

```gitignore
# This project holds CODE, DOCS, and MEMORY — never raw data or private paths.

# --- Data, outputs, logs ---
data/*
!data/source/
data/source/*
!data/source/README.md
!data/output/
data/output/*
!data/output/README.md
logs/*
!logs/README.md
figures/*
!figures/README.md

# --- Raw data extensions (safety net) ---
*.rds
*.rda
*.RData
*.duckdb
*.csv
*.tsv
*.xlsx
*.xls
*.gpkg
*.shp
*.shx
*.dbf
*.prj
*.parquet

# --- Rendered output ---
*.html
*.pdf
*.docx
/*_files/
**/*_files/
.quarto/
*.quarto_ipynb

# --- Shipped assets are content, not output ---
!docs/assets/**

# --- R / RStudio ---
.Rproj.user/
.Rhistory
.RData
.Ruserdata
*.Rproj

# --- OS / editor ---
.DS_Store
Thumbs.db
.vscode/
.idea/
```

Two things worth understanding rather than copying:

- **Anchor directory rules to the repository root** with a leading slash where you mean only
  the top-level folder. `data/` ignores every `data` folder anywhere; `/data/` ignores one.
- **Rendered output is ignored, shipped assets are not.** `*.docx` catches rendered Word
  documents, and the `!docs/assets/**` negation keeps the reference templates. If a template
  refuses to stage, that ordering is why.

Never loosen the data rules to make one file commit. Move the file instead, or force-add it
deliberately and say so in the commit message.

## Versioning

`VERSION` holds a version and a date:

```
version: 0.1.0
date: 2026-09-08
```

The `.githooks/pre-commit` hook bumps the patch level and refreshes the date on every commit,
and leaves a hand-set version alone so the author can bump the minor or major level. The
version is what a reader cites when they refer to "the report as of March", so it belongs in
the document's own version line too — `date: today` with `published-title: "Version"`.

## When Git is missing

Hand off to [`../../academic-toolchain-setup/SKILL.md`](../../academic-toolchain-setup/SKILL.md).
Most users of this pack are on Windows, where Git is not installed by default.

## What not to do

- Do not push, and do not add a remote, without being asked.
- Do not rewrite published history — no `rebase`, no `--amend`, no `push --force` on anything
  the user may have shared.
- Do not commit data because the ignore rules got in the way.
- Do not commit a rendered document unless the project deliberately tracks output; it makes
  every diff unreadable.
