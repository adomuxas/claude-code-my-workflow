# Latvia paper: review fixes applied (2026-10-22)

**Plan:** `quality_reports/plans/2026-10-22_review-fixes.md`, Latvia items 1–12.

**Rule:** follow the dissertation; no new figures. Every number below comes from `Tables/latvia/*`, `Data/Klimantas_2025_data.xlsx`, `Data/Analysis 20251111.xlsx` or the thesis. Arithmetic was used only to check claims.

| # | Item | Status | Change (file:line) | Evidence |
|---|---|---|---|---|
| 1 | `\authorcheck` boxes | **Left for author** | none (03_method:21, 05_baltic:31) | The thesis benchmark table (`klimantas2024dphil.tex` l.1153) carries the same 3,190.8 with no explanation. The thesis structure table (l.3715–45) has no agricultural-employment column, so the cell sources can't be settled. |
| 2 | Order of the regained-1938 years | Fixed | 05_baltic:37 "in 1946, `\lvREGAINthirtyeight{}` and 1948 respectively, two years before" → "in `\lvREGAINthirtyeight{}`, 1946 and 1948 respectively, two years or more before" | Workbook per-capita series: LV 1948, EE 1946, LT 1948; Western core 1950 (first post-1945 year at or above 1938). |
| 3 | 2024 claims | Fixed | abstract; 01_intro:6; 05_baltic:17, :59, :75 (×2). "is now the poorest" / "poorest in 2024" → "the poorest in every year from 2010 to 2023 (in 2024 Estonia fell marginally below it)" or similar | Workbook 2024: LV 17,725, EE 17,677, LT 19,582. Latvia is lowest of the three in every year 2010–23, but not in 2024. "Estonia below its 2019 level in 2024" holds (17,677 < 17,883). |
| 4 | Splice year | Fixed | appendix:9 "by the modern series from 1991" → "from 1992, 1991 being the average of the two". 03_method:67: the modern (official) series records the *deeper* 1992 fall, the Soviet-period series the shallower one; direction corrected, same citations | Thesis l.2490 (spliced at 1991 by averaging); T3: modern 7,205 → 4,959 (−31%), Soviet-period 7,385 → 6,280 (−15%). |
| 5 | Accounts of the MPD gap | Fixed | 03_method:67: "since the two share the 2011 anchor, the whole of that difference lies in the growth … not in the level" → the 1990 level is Maddison's, built on Bolotin's 1991 ratios and retained in MPD 2023; it shows up as slower 1990–2010 growth; growth rates converge with the World Bank's only from 2011 (cites thesis p.57). 03_method:75: "5 per cent in 1989 and again in 1990" → "… and further in 1990" | Thesis l.1136–8, printed p.57 (PDF p.75). MPD sheet: 1988 9,332 → 1989 9,825 (+5.3%) → 1990 9,916 (+0.9%). |
| 6 | 1962 fall | Fixed | 04_latvia:19 "3.5" → "3.6"; 05_baltic:45 "3.5 per cent in Latvia and 1 per cent in Lithuania" → "3.6 … 0.7" | Workbook 1961–62: LV −3.56%, LT −0.67%, EE +0.60%. |
| 7 | Albania in T15 note | Fixed | `latvia_tables.R` T15 note: Albania removed from the column (b) list | A3: no (b) data for Albania; (b) n = 10 without it. |
| 8 | Figure-conversion leftovers | No change needed | — | No "Figure"/chart references remain. "Line" refers to the fitted regression line; 05:45 describes data, not a chart. |
| 9 | "almost every peripheral economy outgrew the core" | Fixed | 05_baltic:67 → "most East-Central European economies outgrew the core, but of the Western periphery only Ireland, Spain and Portugal did" | A3 (c): core 1.57; Finland 1.31, Greece 1.32, Iceland 1.37, Italy 1.11 below; Ireland 4.21, Spain 2.17, Portugal 1.78 above. "Every member of the Western periphery outgrew the core" in 1938–89 holds. |
| 10 | Hedging | Fixed | 05_baltic:67: (c) "restores a single downward-sloping line" → "a single, weakly downward-sloping line … not significant at conventional levels"; Baltic residuals "within one residual standard deviation"; "frontrunners" → "among the frontrunners"; interwar "Lithuania fell well below" → "below"; "Latvia furthest" → "furthest of the three"; "except Yugoslavia" → "…, which lies on it"; closing sentence hedged. 06_conclusion:11: same hedge, "without parallel" → "among the heaviest". 05_baltic:33: "They had been close in 1913" → "In 1913 Latvia had stood above Finland". 05_baltic:53: WWII comparison → "comparable to …, and in Latvia and Estonia deeper (Table `tab:war`)" | T15 (c): slope −0.56 (0.34), R² 0.06, residual s.d. 1.1; residuals LT +0.75, EE +0.32, LV +0.05. Diagnostic re-run of A3: (b) Poland −0.96, Hungary −0.87, Latvia −0.61, Yugoslavia +0.02; (a) Lithuania −0.31 (s.d. 0.6). pctfin 1913 = 112. T10/T12: WWII per capita LT −48, LV −28, EE −29; transition LT −36, LV −45, EE −34. |
| 11 | Years with Lithuania above Latvia | Fixed | 05_baltic:59 "1992--9" → "1992--9 and again in 2003 and 2008" | Workbook: LT > LV in 1992–99, 2003, 2008, then from 2010. |
| 12a | "Section II" with unnumbered headings | Fixed | main.tex:96 `\titleformat{\section}`: label `{}` → `{\thesection.}` with 0.5em; headings now print "I. THE BALTIC DATA GAP …" | Cross-references printed Roman numerals that headings didn't show. |
| 12b | France row of the war table | No change needed | — | The note says each column runs to its own trough (`latvia_tables.R` §10), so the columns need not reconcile. |
| 12c | T2 lists vs text | Fixed | `latvia_tables.R` T2: "in 11 branches" → "in 10 of the 11 branches (petroleum refining did not exist in Latvia …)"; censuses now "1920, 1925, 1930, 1935, 1959, 1970, 1979 and 1989" | 03_method:39 and :53. |

## Verification
- `latvia_tables.R` reran (exit 0). Only `T2_sources.tex`, `T15_beta.tex` and the appendix xlsx changed.
- Paper compiled (xelatex → biber → xelatex ×2): 69 pages (+1 from the numbered headings and the added text), 0 undefined references or citations, 0 errors, 0 overfull boxes over 5pt.
- Rendered PDF spot-checked: section numerals, regain-year order, the 2010–23 wording, the hedged β text and the thesis citation (Klimantas 2025, 57).
- Word not rebuilt; nothing committed.

## Left for the author
- Item 1: both `\authorcheck` boxes (the industry uplift of +301.9m roubles; the sources and years of the agricultural-employment cells).
- Out of scope: the comparator basis, the USSR basis in 1938, β sample robustness, and "slower than any economy of the communist bloc" (no table supports it).
