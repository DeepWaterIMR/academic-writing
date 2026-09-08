# Structuring a scientific document

IMRaD answers four questions in order: **what problem was studied** (Introduction), **how was
it studied** (Materials and methods), **what was found** (Results), **what does it mean**
(Discussion). Every section has one job. Sections complement each other; they do not repeat
each other.

## Write in a different order than you read

1. **Select and arrange the figures and tables first.** They are the skeleton of the Results,
   and deciding them first prevents the Results from becoming a list of everything measured.
2. **Materials and methods** next. It is the easiest section and it fixes the vocabulary the
   rest of the document will use.
3. **Results.**
4. **Introduction and Discussion together.** They are two halves of one argument — the gap you
   claim in the Introduction is the gap you must close in the Discussion, and text moves
   between them constantly.
5. **Abstract last.** It cannot summarise a document that does not exist yet.

## Title

A label, not a sentence; 8–12 words is usually right.

- Open with a word or phrase central to the problem — the opening words decide which audience
  finds it.
- State what was studied **and give an indication of the result**.
- **Banned openings**: *The effect of…*, *The influence of…* (they promise a direction and
  then withhold it), *Some aspects of…*, *Observations on…* (they say nothing). All of them
  push the key information to the end.
- Too short and vague is as bad as too long: *"Studies on the herring, Clupea harengus"* tells
  the reader nothing.

Worked example, worst to best:

1. *Some observations on the influences of dietary carotenoids on the spawning coloration of
   Arctic charr* — long, imprecise, result buried.
2. *Spawning coloration of Arctic charr is enhanced by diets rich in carotenoids* — states the
   result, leads with the response.
3. *Dietary carotenoids enhance spawning coloration in Arctic charr* — shortest, and leads
   with the driver. Choose 2 or 3 by which audience you want.

## Keywords

**Do not repeat words already in the title.** Search engines index title and keywords
together, so a repeated word wastes one of your slots. Use synonyms, narrower terms, and
adjacent concepts. Avoid abbreviations and jargon nobody would search for.

## Abstract

IMRaD in miniature, typically 200–300 words (check the journal): **background → problem and
methods → results → conclusion**. Include quantitative information — the numbers are what make
it worth reading. Close with what the findings imply.

The commonest failure is not highlighting the main findings or saying why they matter. The
second commonest is an abstract whose methods, results, or conclusions disagree with the main
text.

Avoid background that does not support this study.

## Introduction

Three or four paragraphs. Longer than that is almost always verbosity.

Structure: **broad scientific or applied problem → what is known → the limitation or gap in
existing data or understanding → the focal system → the unresolved question → an explicit
statement of aims**, culminating in a testable hypothesis or objective.

The reader must be able to understand and evaluate your results **without going to read your
references first**.

Templates that work:

- *"We know A and B; if we change C and D we expect X and Y."*
- *"Given observation A, the literature leads us to expect C when we apply treatment B."*

Framings that do not:

- *"We applied treatment A to species B to see what happened."*
- *"It seemed of interest to examine the phenomenon, so we did an experiment."*
- *"There are no reports in the literature on this, so we looked at it."*

These lack focus, and a document that starts without focus will present and discuss almost
anything within the general topic, usually in a haphazard order.

## Materials and methods

A cook-book, in the order the work was actually done: **experimental or survey design →
practical execution (field sampling, rearing, protocols) → treatment of samples → data
analysis**.

The test: *could another person read this and repeat the work, obtaining the same or very
similar results?* Nothing else decides how much detail is enough.

- **No results and no discussion here.**
- Do not restate a standard method — cite its source.
- Do not describe a method whose results you never report.
- Report the software here: base R, every package that influenced the results, and the AI
  disclosure. See [`ai-disclosure.md`](ai-disclosure.md).
- A table belongs here whenever readers need a large block of quantitative setup (compositions,
  station lists, model settings).

## Results

Findings only, in a logical sequence that follows the order of the aims. Usually the shortest
section.

The figures and tables carry the data. **The text's job is to link them and to point out the
main trends** — not to restate them. Reporting most of what is already in a figure is the
commonest failing in this section.

Report **direction, magnitude, contrast, and uncertainty**, with a precise cross-reference at
the end of the sentence. Distinguish what was observed from what was estimated. Do not
interpret every result as you report it.

Four failure modes:

- **Duplication** — the same result in the text and in a float.
- **Redundancy** — the same information expressed several ways (weight gain, % weight gain,
  and specific growth rate). Pick one.
- **Imprecision** — results given as proportions or percentages but worded as if they were
  absolute quantities. This is where wrong conclusions get made.
- **Peripheral data** — results not relevant to the stated aims. They distract from the
  findings; if genuinely noteworthy, publish them separately.

## Discussion

Open with the main finding. Then: mechanisms → agreement and disagreement with previous work →
assumptions → limitations, **with the likely direction of bias** → implications → the testable
questions that follow. Close by relating the findings to the aims stated in the Introduction.

Do: pinpoint exceptions and unexpected findings; highlight unsettled points; summarise the
evidence for each conclusion you draw; characterise speculation *as* speculation.

Do not:

- **Repeat the Results.** Discuss them.
- **Catalogue.** *"X found this, Y reported that, Z suggested the other"* is a list, not an
  argument, and it buries your own findings at the end. Put previous findings into context
  around your result.
- **Overkill the citations.** Ten primary papers where one good review exists is padding. Cite
  the review, or *"(Author, year, and references therein)"*.
- **Hide behind ink.** Verbosity around an uncertain point does not make it certain. State the
  uncertainty.
- **Overstate or undersell.** Both are failures of calibration.
- **Speculate past your data.** Once you have said what the data mean, stop.

## Conclusions

Where the document has a separate Conclusions section: state the scientific contribution and
the most important unresolved questions or practical implications. Do not copy the abstract,
do not repeat other sections, and do not make statements the findings do not support.

## Do not cite the obvious

Long-established facts need no reference. Statements that are not self-evident need either an
explanation or a source.
