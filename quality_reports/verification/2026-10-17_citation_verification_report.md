# Citation verification: Latvia and Estonia papers

**Date:** 2026-10-17
**Plan:** `quality_reports/plans/2026-10-17_citation-verification-both-papers.md`

## Method
- Every citation instance in both papers was extracted mechanically (`latvia_citations.tsv`, `estonia_citations.tsv`) and mapped to source folders in `newsources/` (`*_key_folders.tsv`; the verifiers corrected several wrong automatic matches by hand).
- Eight independent, read-only verifier agents (shared brief: `VERIFIER_INSTRUCTIONS.md`) opened every cited page file and graded each instance against the sentence in the .tex file, and checked every cited bibliography entry against the source's `_bibinfo.txt`. Reports: `latvia_batch00-04_report.md`, `estonia_batch00-02_report.md`.
- Two fixer agents applied the fixes, re-opening each cited page before any change to a fact, figure, date or page. Logs: `latvia_fixes_applied.md`, `estonia_fixes_applied.md`.
- The orchestrator corrected two further attributions in the Estonia paper (Norkus–Markevičiūtė 1938 gap: their own estimate is about 11 per cent below the benchmark, not 5; Table 11 source note no longer credits Morys alone for agricultural employment, and a footnote gives the contemporary 60 per cent figure of the 1938 RIIA survey) and regenerated the Estonia tables.

## Grades before fixing

| Grade | Latvia | Estonia |
|---|---|---|
| Supported | 163 | 83 |
| Partial | 93 | 43 |
| Not supported | 2 | 6 |
| Wrong page | 3 | 6 |
| Page missing from corpus copy | 2 | 1 |
| Source not in corpus (unchecked) | 89 | 101 |
| **Total instances** | **352** | **240** |

## After fixing
- All not-supported and wrong-page instances fixed in both papers.
- All partial instances for which a verifier proposed a change were applied after re-checking the page; partial instances judged acceptable were left.
- Bibliography: 34 Latvia entries and 26 Estonia entries corrected (page ranges, author/editor, entry types, series numbers, publishers); duplicates merged (`ehbaltics` → `koll_2025_reinterpretation`; `wbtransitionest` → `wb1993estonia`); `baltistates_smith_estonia` replaced by the correct Smith 2001 entry.
- No fix was rejected after re-checking, except where a page is not in the corpus.
- Builds: Latvia 67 pp., Estonia 70 pp.; XeLaTeX + biber clean, 0 errors, 0 overfull boxes, 0 undefined citations. Two pre-existing duplicate bib keys (`growth_caruana_in_broadberry`, `denison1967`) are uncited and harmless.

## Still unverified
- 190 citation instances (89 Latvia, 101 Estonia) point to works not in `newsources/` (e.g. Maddison 1998 and 2006, Harrison 1993, Bolotin 1992, Ponomarenko 2002, CIA/JEC reports, Thomas & Feinstein, Adlys 1988, Corum 2013, Mel'tiukhov). Their page references remain unchecked.
- Pages checked only against another edition: Kasekamp 2017 (corpus has 2010), Mertelsmann 2024 (`olaf_stalin`; corpus has the 2022 manuscript), Klimantas et al. 2024 (online-first pagination).

## For the authors
See the "For the authors" sections of the two fix logs. Most important:
1. Estonia: the 1938 benchmark uses Valge's housing value-added at 1936 prices (29.0 m kroon) while other sectors are at current prices (Valge's current-price figure is 32.0 m).
2. Estonia: the 63 per cent agricultural employment share for 1934 (Table 11) could not be traced to a corpus source; the RIIA 1938 survey and Kahk–Tarvel give 60 per cent.
3. Latvia: machine-building in 1995 — the thesis says "less than one-tenth" of former output; the paper now follows Šiliņš (about a quarter, two largest branches).
4. Latvia: Klimantas et al. say agriculture's share of interwar GDP stayed at 33–36 per cent, against the paper's statement that it rose.
5. Latvia: unsourced statements left in place: incorporation into all-Union planning in 1946; the 80,000 garrison of 1990; the "first ten states" national-income claim (rests on `norkuslatvia1935`, not in corpus).
