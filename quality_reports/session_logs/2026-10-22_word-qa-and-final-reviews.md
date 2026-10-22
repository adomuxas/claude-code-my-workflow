# Session log: Word QA, repo housekeeping, final reviews (2026-10-22)

## Goal
- Report the status of both papers.
- Finish the Word-export QA.
- Clean up the repo.
- Run final pre-submission reviews.

## Done
- **Word finalization verified** (plan `2026-10-19_word-finalize-qa.md`, now COMPLETED):
  - Field and source counts are unchanged.
  - Estonia footnotes are all short notes.
  - Year letters match biblatex.
  - Symbol counts match the PDFs.
  - Both papers have a REFERENCES heading.
  - A visual spot-check of pages exported from Word passed.
  - Merged as PR #7.
- **Repo housekeeping:**
  - Local source-material folders added to `.gitignore`.
  - CLAUDE.md, the domain-reviewer agent, the constitutional-governance rule and the ocr-book skill committed.
  - Merged as PR #8.
- **Quality score:** `scripts/quality_score.py` runs via `py`, but it only reads `main.tex` (no `\input`), ignores `\autocite` and checks the wrong `.bib`, so its 100/100 is meaningless. A manual rubric check from the build logs found:
  - 0 undefined citations;
  - 0 overfull boxes over 5pt;
  - all 15 Estonia and 22 Latvia tables present, each with an R source.
- **Final reviews:** four reviews were run, two per paper. The reports are in `quality_reports/`:
  - `paper_review_estonia.md`: referee review, R&R, 3.5/5.
  - `paper_review_latvia.md`: referee review, R&R, 3/5.
  - `2026-10-22_estonia_domain_review_final.md`: minor revisions; m12 page fix, m14 partly resolved, m17 open.
  - `2026-10-22_latvia_domain_review_final.md`: major revisions.

## Key finding (verified)
`Datasheets/GDPpc 1990usd.csv`: comparator growth after 1990 is implausible.
- Norway goes from 18,465 to 53,397 over 1990–2019, 3.7%/yr against about 1.7% in reality.
- Switzerland grows 2.1%/yr against about 0.8%.

Both `latvia_tables.R` and `tables.R` read this file, and Norway and Switzerland enter the Western-core and Nordic aggregates. Both papers are affected.

## Open / next
1. Rebuild the post-1990 comparators from real growth and regenerate the tables. This needs a plan and user approval.
2. Latvia:
   - Two `\authorcheck` boxes still render.
   - Text and number contradictions (regain years at 05:37, the 2024 row, the 1991/1992 splice).
   - The USSR basis switch in 1938.
   - β-convergence hedging.
3. Estonia:
   - m14 and m17 (m17 may need the user to check the ESSR yearbook borders).
   - Harrison page reference.
   - 1953 dip.
   - The 1962 harvest figures.
4. Methodological objections (sensitivity runs, documentation of the price comparisons) are judgement calls for the user.
5. Ignore the Estonia referee's "no figures" remark: the user ruled out figures.
- 2026-10-22: comparator-rebuild plan approved by the user; implementation started.
- 2026-10-22: the safeguard check failed: the Baltic 1990-2010 series follow an older WDI vintage (Latvia up to 3.5% off, Lithuania spliced at 1993). User ruling: "follow the dissertation in all calculations. Don't calculate anything yourself" (saved to memory). The rebuild is CANCELLED: the comparators are the dissertation's own MPD 2023 data, with the 1990/2011 benchmarks per Bolt & van Zanden, and WDI adjustment applied to the Baltics only. The real deviation found: the dissertation's Nordic aggregate excludes Norway (workbook series NoNoNordics), the papers include it. Proposed replacement task awaiting approval.
- 2026-10-22: user approved the Nordic fix (NoNoNordics from workbook).
- 2026-10-22: Nordic fix done. Both R scripts now read the dissertation's NoNoNordics series (workbook sheet 'Regional peers'); the table notes say Norway is omitted, as in the thesis.
  - Changed: Estonia T5; Latvia T7 and T8; the Nordic macros. No other macro changed.
  - T8: Lithuania 56→66% of the Nordic average (1913→2023), matching the dissertation; Latvia 80→61, Estonia 70→61.
  - Text: Latvia §5:59 and the conclusion now say "only Lithuania has improved on its 1913 position". All other Nordic claims re-checked and still hold (1950–68 faster than the Nordics; Finland 1968–89 exceptional).
  - Both PDFs recompiled clean (72/68 pp). Word rebuilt with portable pandoc 3.6.4 (Estonia 178, Latvia 287 citation fields; +1 each for the new note citation).
- 2026-10-22: review fixes applied (plan 2026-10-22_review-fixes.md), one pass per paper; reports in quality_reports/2026-10-22_{latvia,estonia}_review_fixes.md.
  - Estonia: all 9 items fixed, including m12 (Harrison p.146) and m14 (Bolotin p.190 table 5).
  - Latvia: 11 of 12 fixed. The two \authorcheck boxes are left for the author, because the dissertation doesn't resolve them.
  - Latvia section headings now print numerals, to match the "Section II" cross-references.
  - 2024: Estonia (17,677) is just below Latvia (17,725), so the "Latvia poorest" claims now cover 2010–23.
  - PDFs clean (Estonia 72 pp, Latvia 69 pp); Word rebuilt.
