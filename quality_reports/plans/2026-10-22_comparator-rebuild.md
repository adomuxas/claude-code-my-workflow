# Plan: rebuild the comparator GDP series after 1990 (both papers)

**Status:** CANCELLED (2026-10-22). The user ruled: "follow the dissertation in all calculations. Don't calculate anything yourself."

## Why cancelled: what the dissertation does
- **Comparators.** `Datasheets/GDPpc 1990usd.csv` is the dissertation's own comparator data (`Data/Analysis 20251111.xlsx`, sheet `MPD2023`). The dissertation (`klimantas2024dphil.tex`, ~l.2488) follows Bolt and van Zanden: MPD 2023 on the 1990 benchmark before 1991, the 2011 benchmark afterwards, converted at 1.594. The WDI adjustment for 1990–2010 (~l.6039) is applied to the **Baltic states only**. So the fast growth of Norway, Switzerland and others over 1990–2010 is part of the dissertation's method, not a pipeline error. Whether to change that is the author's call.
- **Safeguard result.** The Baltic series follow WDI growth year by year, but on an older WDI vintage. Latvia is within 3.5% of WDI 2024. Lithuania is spliced at 1993 with the thesis's own 1991–92 estimates (dissertation ~l.2490).
- **A real deviation from the dissertation: the Nordic aggregate.**
  - The dissertation's Nordic comparisons **exclude Norway** ("Norway is omitted due to its post-1990 explosive growth driven by oil rents", ~l.4061, 4083) and use the workbook series `NoNoNordics (Denmark, Finland, Iceland, Sweden)` (sheet `Regional peers`).
  - Both papers use the datasheet's Nordics column, which includes Norway.
  - The dissertation's conclusion is "only Lithuania has improved its relative position compared with 1913, rising from 56% to 66% of the Nordic average". This reproduces from the workbook (55.6% → 66.0%, 5-year averages). The Latvia paper instead says no Baltic state regained its 1913 Nordic position.
- **Proposed replacement task** (awaiting user approval): switch both papers' Nordic comparisons to the dissertation's NoNoNordics series, taken from the workbook as is, and align the affected sentences with the dissertation.

---
*Original plan below (not carried out).*

## Problem (verified)
`Datasheets/GDPpc 1990usd.csv` is read by `scripts/R/tables.R` (Estonia) and `scripts/R/latvia_tables.R` (Latvia). It holds the comparator series: about 47 countries plus the Western core, Western periphery, ECE, Nordics and EU27 aggregates. It equals the `MPD2023` sheet of `Data/Analysis 20251111.xlsx` (GDPpc 2011$ / 1.594).

Its 1990 levels are on the old Maddison 1990 Geary–Khamis (GK) basis; Norway's 1990 level of 18,465 × 1.594 = 29,434 is in the sheet. Its growth over **1990–2010** is not real growth. Compared with WDI 2024 real GDP per head (constant 2021 PPP, sheet `WDI2024 constant`), annual growth 1990–2010:

| | Datasheet | WDI real | | Datasheet | WDI real |
|---|---|---|---|---|---|
| Norway | 5.0 | 1.9 | Romania | 5.5 | 2.1 |
| Switzerland | 2.6 | 0.8 | Hungary | 3.4 | 1.4 |
| Russia | 2.9 | 0.6 | Germany | 2.4 | 1.3 |
| Spain | 2.6 | 1.5 | Czech Rep. | 3.1 | 1.7 |

After 2010 the datasheet tracks WDI closely (Norway 0.9 vs 0.6, Sweden 0.7 vs 0.7). The excess growth is concentrated in 1990–2010, and it varies by country. It looks like the move from the 1990-GK levels to the MPD2023 2011$ levels was spread over 1990–2010.

The Baltic series in both papers already use **1990–2010 growth from WDI 2024** (table notes in `tables.R`; dissertation table E.5). So the comparators are on a different basis from the Baltics. This inflates the post-1989 growth of most comparators and lowers Baltic relative levels.

## Fix: treat the comparators the way the Baltics are treated
For each country, keep the series unchanged up to 1990. Over 1990–2010 replace its growth with WDI 2024 real per-capita growth. Keep the datasheet's (MPD2023) year-on-year growth after 2010, chained onto the new 2010 level.

- **Countries missing from WDI in 1990** (Serbia, Montenegro; WDI series that start later): use WDI growth from its first year, and MPD growth before that. Each case is listed in a log.
- **Bosnia:** WDI shows 8.4%/yr over 1990–2010, driven by the post-war rebound. Use it like any other country, but flag it, because Bosnia is in the β-convergence sample.
- **Aggregates** (Western core, Western periphery, ECE, Nordics, EU27):
  - Keep each aggregate's published level up to 1990.
  - After 1990, chain it on the growth of the population-weighted mean of its corrected members, with populations from the `MPD2023` sheet. The memberships are those in the table notes.
  - The current aggregates are population-weighted: in 2019 the recomputed Western core is 27,652, exactly the sheet value.
- **USSR / former USSR** (Latvia T13, "Adjusted USSR"): its members are corrected the same way. The former-USSR aggregate is rebuilt from the corrected successor states. Exactly how it is defined now will be checked in step 1.

## Implementation
1. **New script `scripts/R/comparators.R`**, relative paths only.
   - It reads the datasheet, `WDI2024 constant` and the `MPD2023` populations.
   - It writes `Datasheets/GDPpc 1990usd adjusted.csv` (same layout) and a log, `quality_reports/verification/2026-10-22_comparator_rebuild_log.md`. The log gives old vs new 1990–2019 growth per country, the fallback cases, and checks that every value up to 1990 is unchanged.
   - The original datasheet stays untouched as the raw input.
2. **`tables.R` and `latvia_tables.R`** read the adjusted file; a one-line change in each.
3. **Update table notes** in both scripts: "comparators after 1990: MPD2023 levels with 1990–2010 growth from WDI 2024 (\cite{wdi2024}), as for the Baltic states."
4. **Rerun both scripts** and diff every `Tables/estonia/*.tex` and `Tables/latvia/*.tex` before and after. Affected tables are expected to be:
   - Latvia: T7, T8, T13, T14, T15(c) and A3.
   - Estonia: the comparison tables with Western core, Nordics and Finland after 1990.
   - Tables up to 1990 should not change.
5. **Text pass.** Find every prose claim about post-1989 comparisons and update the numbers and wording to the new tables. These include:
   - the regained-1913-position claims;
   - "behind Poland, Romania, Albania and Hungary";
   - the 1989–2019 β-convergence panel and its residuals;
   - the 2019/2023 shares of the Western core and Nordics;
   - the Estonia–Finland gap today.

   Numbers set by macros update automatically; hard-coded numbers are found by grepping the old values.
6. **Recompile both papers** (xelatex → biber → xelatex ×2): clean logs, no undefined references.
7. **Rebuild both Word files** (`scripts/word/build_docx.ps1`).
8. **Run a domain-reviewer agent** on the changed passages only.
9. **Commit** on branch `fix/comparator-rebuild` → PR → merge.

## Out of scope (separate tasks)
- The other review points: hedging, `\authorcheck` boxes, the USSR basis in 1938, m14/m17 and similar.
- Text that the new numbers no longer support will be corrected in step 5, which may touch a few of these points where they overlap (e.g. "none regained 1913").

## Risks
- Some conclusions may change. For example, Lithuania may now clearly exceed its 1913 Nordic position, and the 1989–2019 β slope may change sign or size. Step 5 rewrites the affected sentences, and any change in a substantive conclusion will be reported to the user, not quietly rephrased.
- The WDI 2024 vintage (constant 2021 PPP) differs from the 2017-PPP WDI that may have been used for the Baltic 1990–2010 growth. The check: rerunning the Baltic chain with this WDI sheet must reproduce the Baltic series in `Klimantas_2025_data.xlsx` within 0.5%. If not, the plan pauses and I report back.
