# R Code Review: scripts/R/latvia_tables.R
**Date:** 2026-10-17
**Reviewer:** r-reviewer agent (report returned inline; the agent had no write tool). Condensed by the orchestrator; status column added after fixes.

| Severity | Finding | Status |
|---|---|---|
| CRITICAL | Beta-convergence sample double-counts nested entities (USSR + Russia/Baltics; Yugoslavia + successors; Czechoslovakia + CZ/SK) in `eu_countries`/`beta_data()` | FIXED: `beta_sample(y0)` excludes successor states before 1989 and the aggregates from 1989; duplicate check added; figure note updated |
| MAJOR | `"Latvia.1"` fallback in `check_same` is dead code (duplicate names preserved by `check.names = FALSE`) | FIXED: `g_col(name, which_copy)`; every duplicate copy is checked |
| MAJOR | Table 1 rows can vanish silently on a label mismatch | FIXED: `pick1()` stops on 0 or >1 matches |
| MAJOR | Lithuania WWI row labelled "recomputed" but not recomputed | FIXED: WWI recomputed for all three (Lithuania WWI now −36/−60/−38) |
| MAJOR | Table 10 note mentions a USSR WWII row that does not exist | FIXED: note rewritten |
| MAJOR | WWII trough window 1939–46 vs label "1944–6" | FIXED: window 1944–6 |
| MAJOR | `bench35` hard-coded | FIXED: taken from the series with a tolerance check |
| MAJOR | `fmtp` can print "-0" or a hyphen-minus | FIXED: rounds first, prints `$-$` |
| MAJOR | `\csname` dispatchers expand to nothing if undefined | FIXED: `\ifcsname … \else \errmessage` |
| MAJOR | `def()` can emit "NA" | FIXED: stops on NA; `allow_missing` for legitimately absent comparator years |
| MAJOR | Verify 1938 = 100 for all sectors | FIXED: `stopifnot` on every non-commerce index |
| MAJOR | Deportation figures hard-coded in R | FIXED: `Data/baltic_deportations.csv` |
| MINOR | Overtaking-year searches restricted to 1951–90 / silent `max()` on empty sets | FIXED: `last_year_where()` stops on an empty set; the years in which Latvia was not the richest Baltic economy are asserted explicitly |
| MINOR | Datasheets copy of the Baltic aggregate differs from the workbook-weighted one (max 1.3 per cent) | NOTED: the paper uses the workbook-weighted aggregate; message printed at run time |
| MINOR | `with_gap()` no-op; dead `tot()`/`war_calc()` helpers | FIXED |
| MINOR | Remaining style items (line length in table-note strings, roxygen headers on small helpers) | Not applied |
