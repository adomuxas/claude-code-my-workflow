# Plan: apply the final-review fixes (wording, consistency, citations)

**Status:** COMPLETED (2026-10-22). Reports: `quality_reports/2026-10-22_{latvia,estonia}_review_fixes.md`. Left for author: Latvia item 1 (the "Author check" boxes) and the out-of-scope list.

**Rule:** follow the dissertation in all calculations; never compute new figures. Every number comes from the existing tables or macros, the workbook (`Data/`) or the dissertation (`Dissertation latex files/klimantas2024dphil.tex`). Diagnostic arithmetic is allowed only to check a claim. Where the dissertation and the sources don't settle an item, leave it and report it.

**Sources:**
- `quality_reports/paper_review_latvia.md`
- `quality_reports/paper_review_estonia.md`
- `quality_reports/2026-10-22_latvia_domain_review_final.md`
- `quality_reports/2026-10-22_estonia_domain_review_final.md`

## Latvia (`Paper/latvia/`, `scripts/R/latvia_tables.R`)
1. Resolve the two `\authorcheck` boxes (03_method:21, 05_baltic:31) from the dissertation; if it can't settle them, keep them and report.
2. 05:37: the order of the regained-1938 years (Latvia 1948).
3. The 2024 claims (05:59, 05:75): check them against the workbook series used in the paper.
4. Splice year: 1992 with 1991 averaged (dissertation ~l.2490), consistent in 03:67 and in the appendix.
5. MPD 1990 growth "5 per cent again" vs Table 5; the three accounts of the MPD gap (02:9, 03:67, 03:75) made consistent with the dissertation.
6. 1962 fall: text vs macro (04:19, 05:45).
7. Remove Albania from the socialist list in the T15 note.
8. Leftover chart prose from the figure-to-table conversion (05:45, 05:67).
9. "almost every peripheral economy outgrew the core" (05:67): check against A3 and correct.
10. Hedging: β-regression wording (05:67, 06:11); "well above"; "without parallel"; "comparable to the Second World War"; "They had been close in 1913".
11. The years with Lithuania above Latvia: add 2008 if the table shows it.
12. Cross-references that print "Section II" against unnumbered headings; the France row of T13; the T2 lists vs the text: check, and fix if they are real errors.

## Estonia (`Paper/estonia/`, `scripts/R/tables.R`)
1. Harrison `[144, 159]` → `[144, 146]` (02_method:15).
2. "1962 the only interruption" vs the 1953 fall (03_results:17, 05:31).
3. 1962 Union harvest "83 → 63 million tons" → "by almost a quarter"; add the Purre p.54 citation for the price rises.
4. Hedge "the Estonian instance of the agricultural crisis"; "about 5 per cent a year" refers to total GDP.
5. Lithuanian heavy-industry share 53 vs 55: use the dissertation's figure.
6. Greece and Slovenia cited to Table 8, which lacks them (05:37).
7. 06_finland:13: the "confined" / "not confined" contradiction.
8. m14: cite Bolotin p.190, table 5 for the 1990 branch weights in 02_method:41 and the T2 note.
9. Clark ratio "too high by a sixth" (06:9): check against the tables.

## Not in scope (author's decisions; report only)
- The comparator data basis.
- Sensitivity runs.
- The USSR basis in 1938.
- Sample choices for the β regressions.
- m17 (borders of the 1937–40 yearbook figures; not settled in the dissertation).
- Documentation of the price comparisons.
- Paper length.

## Verification
- Recompile both papers (xelatex → biber → xelatex ×2): clean logs.
- Rerun the R scripts if a script changed.
- Rebuild the Word files.
- Commit → PR → merge.
