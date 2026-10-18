# Plan: replace the Latvia paper's figures with tables

**Status:** COMPLETED (2026-10-18). Deviations from the plan:
- graphicx is kept, because T9 uses `\resizebox`.
- The prose now says Latvia lies *on* the socialist line (residual +0.01) rather than above it.
- A `\clearpage` was added before A3.

Verification results:
- PDF: 68 pages, clean log.
- Word: 0 images, 286 citation fields.

## Context
The user wants no figures in either paper; each figure becomes a table. The Estonia paper has no figures, so only the Latvia paper (`Paper/latvia/`) changes. It has four figures, all drawn by base R in `scripts/R/latvia_tables.R` §14:

| Figure | Label | Section file | Content |
|---|---|---|---|
| F1_levels | fig:levels | sections/05_baltic.tex | GDP per capita in Int$1990 (log scale), 1913–2023: LV, LT, EE, Finland, Western core, USSR |
| F2_relative | fig:relative | 05_baltic.tex | % of Western core (5-year moving average): LV, LT, EE, W. periphery, ECE |
| F3_beta | fig:beta | 05_baltic.tex | β-convergence scatters for 1913–38, 1938–89 and 1989–2019, with fitted lines |
| F4_sectoral | fig:sectoral | sections/04_latvia.tex | sectoral value-added indices, 1938 = 100: GDP, primary, industry, construction, market services, public services, 1919–95 |

Existing tables already overlap with some figures:
- T8 (tab:relative) gives % of Western core at selected years.
- T6 gives sectoral growth rates; A2 gives annual sectoral indices.

The new tables are designed to add what the figures showed and those tables don't.

## New tables (generated in latvia_tables.R with the existing `tex_table()` / `write_tex()` helpers)
1. **T13_levels.tex (replaces F1, tab:levels).**
   - GDP per capita in Int$1990 at the T8 years (`rel_years`: 1913, 1929, 1938, 1950, 1968, 1973, 1989, 1995, 2008, 2019, 2023).
   - Columns: Latvia, Lithuania, Estonia, Finland, Western core, USSR / former USSR.
   - Formatted with `fmt()`. The notes are carried over from the figure.
2. **T14_relative_avg.tex (replaces F2, tab:relativeavg).**
   - % of the Western core as period averages, which plays the role of the figure's smoothing and avoids repeating T8's single years.
   - Periods: 1919–28, 1929–38, 1946–55, 1956–67, 1968–79, 1980–89, 1990–94, 1995–2007, 2008–23.
   - Columns: LV, LT, EE, W. periphery, ECE.
   - Years missing a comparator are skipped, as `ma5` does now.
3. **T15_beta.tex (replaces F3, tab:beta), regression results.** One column each for:
   - (a) 1913–38;
   - (b) 1938–89 for all economies, socialist only and capitalist only;
   - (c) 1989–2019.

   Rows:
   - slope (SE), intercept, N, R², residual SD, Western-core growth;
   - growth of Latvia, Lithuania and Estonia, with the residual from that column's line.

   The subgroup regressions are already fitted for the drawn lines; their coefficients will now be reported. `beta_panel()` becomes a data-only function, `beta_fit()`, that returns these numbers. The existing `beta*`/`bres*` macros stay unchanged.
4. **A3_beta_data.tex (appendix longtable, tab:betadata), the scatter data itself.**
   - Rows: every economy in the regressions.
   - For each period: log initial income and growth, flagged socialist or capitalist.
   - The prose claims that came from reading the scatter (e.g. "four of the ten … outgrew the Western core", "behind Poland, Romania, Albania and Hungary") stay checkable against this table.
5. **T16_sectoral_idx.tex (replaces F4, tab:sectoralidx).**
   - Indices (1938 = 100) at 1919, 1929, 1938, 1945, 1950, 1955, 1960, 1968, 1975, 1980, 1985, 1989, 1991, 1995.
   - Columns: GDP, primary, industry, construction, market services, public services.
   - Market services is the aggregate A2 lacks.

File names T13–T16 avoid renumbering files. The printed table numbers follow the order of appearance automatically via `\ref`.

## Edits
- **scripts/R/latvia_tables.R**
  - Delete §14 (all `pdf()` plotting) and `fig_dir`.
  - Add the table builders above.
  - Update the header (Outputs: no figures).
- **Paper/latvia/sections/04_latvia.tex**
  - Replace the figure float with `\input{../../Tables/latvia/T16_sectoral_idx.tex}`.
  - Change "Figure~\ref{fig:sectoral} the indices themselves" to "Table~\ref{tab:sectoralidx} their levels at selected years".
- **Paper/latvia/sections/05_baltic.tex**
  - Swap the three figure floats for `\input` of T13, T14 and T15.
  - Change "Figures~\ref{fig:levels} and~\ref{fig:relative}" to Tables.
  - In "Figure~\ref{fig:beta} tests …" and the following paragraph, rewrite the visual language (panel, fitted line slopes, lies above the line, "the figure note gives standard errors") into table terms: column, slope, positive/negative residual, "Table~\ref{tab:beta} gives standard errors; the country data are in Table~\ref{tab:betadata}".
  - Substance and numbers are unchanged.
- **Paper/latvia/sections/appendix.tex**
  - Add `\input` of A3.
  - Change "used in the tables and figures" to "used in the tables".
- **Paper/latvia/main.tex**
  - Drop `graphicx`, the figure `\captionsetup`, `\figurename` and `\graphicspath`.
- **Figures/latvia/F1–F4.pdf:** delete with `git rm`, since nothing uses them any longer.
- **Word pipeline**
  - In `scripts/word/bib_lib.js`, remove `figures: 'Figures/latvia'` from the latvia config.
  - The figure code in build_docx.ps1 and prep_tex.js stays, but is unused.
  - Rebuild `Paper/latvia/Latvia_GDP_paper.docx` with the portable pandoc.

## Verification
1. Run `Rscript scripts/R/latvia_tables.R` (full Rscript path per memory). It must finish with no errors, all `stopifnot` checks passing and the `def()` macros unchanged; diff numbers.tex against git to confirm.
2. Compile `Paper/latvia/main.tex` with XeLaTeX, biber, then XeLaTeX twice. Check for no undefined references or citations and no `fig:` labels. Grep the log for overfull boxes over 5pt in the new tables; if one appears, shrink it with `\scriptsize` or `colsep`.
3. `grep -rn "figure\|Figure~\|includegraphics" Paper/latvia Paper/estonia` should find no figure environments or references.
4. Read the new table pages in the PDF to check they are readable.
5. Rebuild the Word file. It should have no images, and the new tables should be present with live citations still working.
6. No commit unless asked.
