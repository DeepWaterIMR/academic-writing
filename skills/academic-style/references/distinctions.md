# Distinctions that must not be blurred

Each pair or set below names things that are genuinely different. Collapsing them changes what
the document claims. Preserve them in prose, captions, table headers, and variable names
alike.

## Evidence status

**observed** · **measured** · **estimated** · **modelled** · **inferred** · **hypothesized**

A modelled value is not an observation. An estimate carries uncertainty that a measurement
reports differently. An inference is a step away from both. Say which one a number is,
especially in a Results section that mixes them.

## Association and causation

A correlation, a fitted slope, and a difference between groups are associations. Causal
language — *drives, causes, leads to, results in, because of* — requires either an experiment
or an argument you have actually made. See the note on trend lines in
[`figures-tables.md`](figures-tables.md): drawing the line is itself a claim.

## Quantities

**occurrence** · **abundance** · **biomass** · **density** · **distribution**

- *Occurrence* is presence or absence.
- *Abundance* is a number of individuals; *biomass* is a mass. They respond differently to
  size structure and can move in opposite directions.
- *Density* is either per unit area or per unit volume — say which, and keep the unit
  consistent with the swept-area or volume-filtered calculation behind it.
- *Distribution* is where the quantity is, not how much of it there is.

## Habitat

**Suitable habitat** is what a model says the environment permits. **Realized distribution**
is where the animals actually are. Predictions from a habitat model give the first, not the
second, and the difference matters wherever the species is not at equilibrium with its
environment.

## Populations and management

**Management units** are administrative; **biological populations** are demographic. Stock
boundaries in an assessment are management units unless demonstrated otherwise, and a result
about one is not automatically a result about the other.

## Scale of the index

**Relative** indices track change; **absolute** quantities estimate a level. A survey index is
relative unless catchability has been estimated. Never let a relative index be read as a
biomass estimate, and never compare a relative index across series that do not share a
catchability.

Similarly: a proportion or a percentage is not a count. Wording that treats relative values as
absolute quantities is the single most common route to a wrong conclusion in a results
section.

## Uncertainty

**Standard deviation** describes spread in the data; **standard error** describes precision of
an estimate; a **confidence interval** and a **credible interval** answer different questions.
State which one an error bar shows, every time. See [`figures-tables.md`](figures-tables.md).

## Statistical and biological significance

A *p*-value below a threshold says an effect is detectable, not that it is important. Report
the effect size and its uncertainty, and say what magnitude would matter.

## Time

**Year class** (cohort), **year of capture**, and **assessment year** are three different
years. **Survey year** and **advice year** are two more. Label them and never let one stand
for another in a table header.
