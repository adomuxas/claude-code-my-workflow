# R Code Review: scripts/R/tables.R (Estonia paper pipeline)

**Date:** 2026-10-16 | **Reviewer:** r-reviewer agent (read-only) | **Score before fixes:** 86/100 | **Critical:** 0 | **Major:** 6 | **Minor:** 14

## Verified correct (no change needed)
- No `setwd()`, no absolute paths; `file.exists()` guard; output dirs created recursively; Excel sheets read by name (Article IV passes).
- CAGR, ratio-to-comparator, overlap recovery (both panels of Table 3), T4 differences, T1 per-capita conversion all re-derived by hand against the generated `.tex` files; year spans have no off-by-one.
- All 120 macro call sites in `Paper/estonia/**/*.tex` resolve to a generated `\csname`; no NA/NaN/Inf leaks.
- Workbook sheets 1–3 are written from the same objects as appendix tables A1/A2; description sheet carries the citation and use line.

## Findings and disposition

| # | Sev. | Finding | Disposition (this session) |
|---|---|---|---|
| M1 | Major | No guard against duplicate `\def` in `numbers.tex`; `eeTGR1989x1991` defined twice | **Fixed:** `unique()` on the span list + hard stop on duplicate macro names before writing |
| M2 | Major | `\providecommand` for short public names (`\ee`, `\gr`, `\pop`, `\cum`) fails silently on a clash | **Fixed:** all public macros now `\newcommand` |
| M3 | Major | Overlap levels in Table 3 / workbook sheet 5 are back-solved from 1-dp rounded percentage differences (`Data/estonia_overlaps.csv` holds only `diff_pct`) | **Open for the authors:** supply the two underlying series (1938-based and 1990-based, 1937–40; 1990-based and adjusted MPD, 1990–95) so the CSV holds levels and the script derives the differences |
| M4 | Major | GDP columns selected by position; only Estonia cross-checked against Datasheets | **Fixed:** Lithuania and Latvia now also cross-checked; count guard prevents a vacuous pass on an all-NA column (also closes Minor 3) |
| M5 | Major | Name-based comparator lookups (trade, literacy, university students, sectoral GDP) degrade silently to `---` | **Fixed:** `stopifnot` membership checks; explicit allow-list of the eight countries known to lack 1930 student data |
| M6 | Major | Hard-coded constants: 1.594 typed three times; 1938 taxes (17.2) absent from `Data/`; 8425.0 duplicated; "35 %" services share typed | **Fixed:** single `INT11_PER_INT90` interpolated into notes and workbook; taxes row added to `Data/estonia_benchmarks_1938_1990.csv`; 1990 benchmark read from the series (asserted = 8425.0); services share computed (prints 34 %; prose changed to "about one-third") |
| m1 | Minor | A1 rule after 1913 spans the right-hand block | **Fixed:** `\cmidrule(r){1-4}` |
| m4 | Minor | `fmtg`/`fmtsg` could print `$-$0.0` | **Fixed:** sign tested after rounding |
| m7 | Minor | `\pctlv{1940..1994}` macros defined although Table 8 masks them | **Fixed:** same mask applied to the macros |
| m13 | Minor | Header lacks author/date; MPD citation year mismatch | **Fixed:** header line added; constant comment cites Bolt & van Zanden 2021 as the A1 note does |
| m14 | Minor | Workbook Benchmarks sheet lacks Table 1 totals; no provenance | **Fixed:** totals/tax/per-capita rows added; description sheet records script, R version, date |
| m2 | Minor | Hand-counted `append(after=)` midrule positions | Not applied (cosmetic; positions verified correct) |
| m5, m6 | Minor | Duplicated span/ratio code | Not applied (refactor only) |
| m8–m12 | Minor | Naming, console messages, section order, macro namespace, long lines | Not applied (style only) |

**Verification after fixes:** `Rscript scripts/R/tables.R` runs clean from the repo root with every new assertion passing; generated outputs differ from the committed ones only in the intended places (A1 rule, Table 7 services share 35→34, `\newcommand` lines, one duplicate `\def` and the masked Latvia macros removed, workbook additions).
