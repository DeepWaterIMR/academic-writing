# Project memory

Facts about **this project** that are not derivable from the code, the data, or the commit
history: decisions and why they were made, constraints, conventions the user asked for,
external resources. Agents write here; the user reads here when they want to know what an
agent was told.

One fact per file, with frontmatter:

```markdown
---
name: <short-kebab-case-slug>
description: <one line, used to decide relevance during recall>
metadata:
  type: project | decision | reference | feedback
  author: <agent or person>
  created: <YYYY-MM-DD>
---

<the fact, stated plainly>

**Why:** <the reason it is true, or the reason it was decided>

**How to apply:** <what to do differently because of it>

Related: [[other-memory-slug]]
```

Then add a one-line pointer to [`MEMORY.md`](MEMORY.md): `- [Title](file.md) — hook`.

Rules:

- **Absolute dates**, never "last week".
- **No data, no credentials, no private paths.**
- Do not record what the repository already says — file structure, past fixes, commit
  history. Record what a new agent could not work out for itself.
- Update the existing file rather than adding a near-duplicate; delete memories that turn
  out to be wrong.
