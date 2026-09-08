# Citing sources and building a reference list

## Verify before you cite

**Every citation needs a resolvable link to the primary source** — a DOI where one exists,
otherwise a stable URL. Confirm that the reference exists *in the form written*: authors,
year, title, and venue, not just a plausible author-and-year pair.

If you cannot verify it, mark it `[VERIFY: ...]` in the text and tell the author. Never emit a
citation you have not checked. A fabricated reference is the most damaging thing a language
model can put in a scientific document, and it is the easiest to detect after publication.

**Do not cite work you have not read.** Where the information is central and the original is
unobtainable, cite the secondary source explicitly: *"Smith (1974), cited in Ellis (1986),
recorded six fish species in the area."*

## In-text citations

Author–year (Harvard) is the default in ecology and fisheries; follow the journal if it says
otherwise.

- Surnames only in the text. Initials belong in the reference list.
- Two authors: both names. Three or more: first author + *et al.*
- Same author, same year: `1992a`, `1992b`, used consistently in text and list.
- **Order multiple sources by year, not alphabetically**: `(Smith and Jobling, 1997; Jobling
  and Smith, 1999)`, not the reverse.
- Personal communications and unpublished material need the author's permission and *more*
  detail than a published source, because they never reach the reference list:
  `(B. A. Hardy, University of Welboro, personal communication, 2000)`. Avoid them where you
  can.
- Direct quotation always carries quotation marks and an attribution. Extensive quotation
  needs copyright permission.

## Do not create myths

Citing changes evidential status if you are careless. Compare:

> Original: *"…suggest that it would be more advantageous for mammals to maintain tighter
> regulation…"*

> Citation: *"Jobling et al. (2002) reported that mammals maintain tighter control…"*

A tentative suggestion has become a reported fact, and the next author will cite *you* for it.
**Preserve the source's hedging when you cite it.** See the epistemic verb ladder in
[`../SKILL.md`](../SKILL.md).

## Citation overkill

Packing a statement with every source you found does not demonstrate scholarship. Select the
most relevant. Where a good review or book chapter summarises ten primary papers, cite the
review — or the key paper plus *"(Author, year, and references therein)"*.

Cataloguing is the related failure in prose: *"X found this, Y reported that"* is a list, not
an argument. See [`imrad.md`](imrad.md).

## Reference list

There is no single correct format. **Consistency is the requirement** — pick the journal's
style, or the project's, and hold to it everywhere.

- Alphabetical by first author's surname; within an author, chronological, earliest first.
- Two authors: alphabetical by the second surname. Three or more: by year, which matches the
  *et al.* used in the text.
- Give author names in the same form in the list as in the text — never *dos Santos* in one
  place and *Dos Santos* in the other.
- **Reproduce source titles verbatim**, even when they contain an outdated species name, use
  the other variety of English, or contain a typographical error. The title is what it is.
- **Write journal titles in full** unless the journal explicitly requires abbreviations.
  Abbreviating by hand is an easy way to introduce errors.
- Every text citation appears in the list, and every list entry is cited in the text. Check
  this in both directions before submitting.

## In Quarto

References go in a BibTeX file — `docs/assets/references.bib` by default — and the citation
style in a CSL file. For software citations, take the BibTeX from `citation("pkg")` and
`citation()` for base R rather than writing an entry by hand; the maintainers' entry is the
correct one. See [`../../academic-conventions/SKILL.md`](../../academic-conventions/SKILL.md).

Keep a `[VERIFY]` marker in the prose, not in the `.bib` file, so it cannot silently render
into a bibliography.
