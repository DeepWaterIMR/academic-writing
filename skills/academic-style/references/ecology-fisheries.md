# Field conventions: ecology and fisheries science

Conventions specific to these fields, on top of the general rules in
[`../SKILL.md`](../SKILL.md).

## Species names

Give the **vernacular name and the formal (Latin) name together at first mention**, then the
vernacular or the abbreviated binomial thereafter:

> Beaked redfish, *Sebastes mentella*, was the most abundant species. … *S. mentella*
> dominated the catches north of 72°N.

- Italicise genus and species. Do not italicise the family, the authority, or anything above
  genus.
- Some journals require the naming authority at first mention: *Cyprinus carpio* L. 1758;
  *Oncorhynchus mykiss* (Walbaum). Check the journal; add it consistently or not at all.
- Some journals want the family too: *Asian sea bass (Lates calcarifer, Centropomidae)*.
- **Use the currently accepted name, and never mix current and superseded designations.**
  *Salmo gairdneri* and *Oncorhynchus mykiss* are one species; *serotonin* and *5-HT* are one
  compound. Treating them as two is a factual error, not a style slip.
- The exception is the reference list, where titles are reproduced verbatim including outdated
  names. See [`citations.md`](citations.md).
- Follow the American Fisheries Society names list where a project or journal specifies it.

**Common names are ambiguous across countries.** "Catfish" is *Ictalurus punctatus* in the
United States and *Clarias gariepinus* in much of Africa; the British "bullhead" (*Cottus
gobio*) is unrelated to the American one (*Ameiurus* spp.). This is exactly why the binomial
goes in at first mention.

## Four ways a word choice becomes a factual error

Real examples, all from fisheries manuscripts:

1. **The wrong qualifier.** *"Sturgeons, in common with other teleosts…"* — sturgeons are not
   teleosts, and not all teleosts have the trait being described. *Other* should have been
   *some*.
2. **An ambiguous common name.** In a paper about brown trout, *"the brook trout … whereas the
   lake trout…"* reads as two other species. Write *"the brown trout caught in the brook …
   whereas those living in the lake…"*.
3. **The non-sequitur.** Results reported for tilapia, conclusion drawn about goldfish —
   usually a cut-and-paste survivor. Check that every conclusion names the animal the data
   came from.
4. **Unrecognised synonyms.** Two names for one species or one compound, discussed as if they
   were two things.

## Stocks, areas, and management

- Give the **ICES subarea or division** in the standard notation and say what it covers on
  first use: *"Subareas 1 and 2 (Northeast Arctic)"*.
- Distinguish the **management unit** from the **biological population**. A stock boundary is
  administrative unless demonstrated otherwise. See [`distinctions.md`](distinctions.md).
- Distinguish **assessment year**, **advice year**, **survey year**, and **year class**.
  Never let one label stand in for another in a table header.
- Reference points (*F*~MSY~, *B*~lim~, *B*~pa~, MSY *B*~trigger~) have precise definitions in
  the advisory framework. Use them as defined; do not invent an intermediate.
- Landings, catch, and removals are not the same quantity. Say whether discards, recreational
  catch, and bycatch are included.

## Surveys, gear, and effort

- Name the **survey time series** and the **gear**, and say what changed if either changed
  during the period covered. Gear changes are catchability changes.
- **Effort must be explicit.** Swept area, towing time, distance, soak time, number of hooks —
  say which, with the unit. A catch rate without a stated effort denominator is not
  interpretable.
- **CPUE and survey indices are relative** unless catchability has been estimated. Say so, and
  do not compare series that do not share a catchability. Where CPUE has been standardised,
  say what it was standardised for; see the
  [NOAA summary of good practice](https://www.fisheries.noaa.gov/resource/peer-reviewed-research/catch-unit-effort-modelling-stock-assessment-summary-good-practices).
- State how **zero catches** were handled. A station with no fish is data; dropping it changes
  the estimand.
- Report **sample sizes at the level the analysis uses** — stations, hauls, individuals — and
  say when individuals were subsampled and how they were raised.

## Units and quantities in this field

- Density: individuals or kg per unit area (`n nmi⁻²`, `kg km⁻²`) or per unit volume. Say
  which, and keep it consistent with the swept-area or volume calculation.
- Positions in decimal degrees with a stated datum, or in degrees and decimal minutes —
  consistently, and never mixed.
- Depths in metres, positive downwards, and say whether they are bottom depth or gear depth.
- Lengths: say total, fork, standard, or carapace length, and the rounding rule (measured to
  the centimetre below, typically).
- Temperature in °C with the measurement depth given.
- Give the coordinate reference system for anything spatial, by EPSG code.

## Reporting models and analyses

- Name the model family, the response, the offset or effort term, the random-effect structure,
  and the software version — enough that the fit could be reproduced.
- Report parameter estimates with uncertainty, not point values alone.
- Say what was *not* done: covariates considered and dropped, years excluded, and why.
- A model prediction is not an observation, and suitable habitat is not realized distribution.
  See [`distinctions.md`](distinctions.md).

## Further reading on writing in these fields

- [ICES Journal of Marine Science — General Instructions](https://academic.oup.com/icesjms/pages/General_Instructions),
  the default target style for this pack (85 mm single-column and 170 mm double-column
  figures).
- [How to get published in the ICES Journal of Marine Science](https://www.ices.dk/Science/publications/Documents/How%20to%20get%20published%20in%20the%20ICES%20Journal%20of%20Marine%20Science.pdf)
  and the [reviewer guidelines](https://www.ices.dk/Science/publications/Documents/IJMS%20Reviewer%20Guidelines.pdf).
- [Journal of Ecology — Guide to Scientific Writing](https://besjournals.onlinelibrary.wiley.com/hub/journal/13652745/journal-resources/guide-to-scientific-writing).
- [Marine and Coastal Fisheries — General Instructions](https://academic.oup.com/mcf/pages/general-instructions).

## Animal ethics

Where the work involved animals, the ethics statement is settled at the planning stage, not at
writing. Apply the **3Rs** — replacement, reduction, refinement — and use the smallest number
of animals that keeps the study valid; too few animals is also an ethical failure, because it
wastes them. Report the approving body and the permit, and cite the power analysis or the
comparable published studies that set the sample size.
