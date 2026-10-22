# Estonia paper: review fixes (2026-10-22)

Plan: `quality_reports/plans/2026-10-22_review-fixes.md` (Estonia items 1–9).

**Rule:** no new figures. Every number comes from the tables and macros, the workbook, the dissertation or a source page that was opened.

| # | Item | Status | Location | Change | Evidence |
|---|---|---|---|---|---|
| 1 | Harrison page | Fixed | `02_method.tex:15` | `[144, 159]` → `[144, 146]` | Harrison 1993 (Papers/Methodology papers): p.144 "both give 3.8% … 1950–87 (Table 1)"; Table 1 on p.146 shows CIA 3.8, Khanin 3.8. Pages rendered and read. |
| 2 | "only interruption" vs 1953 | Fixed | `03_results.tex:17`; `05_implications.tex:31` | "The only interruption came in 1962" → "Apart from a pause in 1953, the only interruption came in 1962"; "interrupted once" → "seriously interrupted only once" | Workbook (`Klimantas_2025_data.xlsx`): income per head 1952 3,758 → 1953 3,747 (−0.3%). |
| 3 | 1962 harvest; Purre citation | Fixed | `05_implications.tex:31` | "from 83 million tons in 1962 to 63 million" → "by almost a quarter". Footnote adds "on the price rises, `\autocite[54]{purre1964}`, quoting *Pravda*, 1 June 1962". | Belkharoev 2024 p.18 (rendered): "Валовый сбор зерна (в весе после доработки) … 1962 г. – 83,1 млн тонн … 1963 г. – 62,8", i.e. cleaned weight, not the usual gross basis. Purre p.54 quotes the Pravda decree (35% purchase prices; meat 30%, butter 25%); the page is identified from the footer numbering. `purre1964` is already in `bibliography_additions.bib`. |
| 4 | Causal hedge; "about 5 per cent" | Fixed | `03_results.tex:17`; `05_implications.tex:31` | "the Estonian instance of the … crisis" → "coinciding with" (03) and "The check coincided with, and anticipated, …" (05). "against about 5 per cent a year in the surrounding years" → "well below the pace of the surrounding years". | The same paragraph says Estonia's harvest failed a year before the Union's. The 5 per cent fit total GDP, not income per head (1961: 3.7% per head, 4.8% total), so the number was dropped rather than replaced. |
| 5 | Lithuanian heavy-industry share | Fixed | `05_implications.tex:41` | "53 in Lithuania" → "55 in Lithuania" | Dissertation l.3646: "heavy industries constituted 41% of Estonian, 48% of Latvian, and 55% of Lithuanian industrial value-added"; the Latvia paper also gives 55. |
| 6 | Greece and Slovenia cited to Table 8 | Fixed | `05_implications.tex:37` | Footnote added: "Greece and Slovenia: `\autocite{mpd2023}`." | `tab:relative` has no Greece or Slovenia column. The datasheet (MPD 2023) for 1989 has Greece 10,111 > Estonia 8,958; Slovenia 12,445 is the highest socialist economy, and Estonia is next. |
| 7 | "confined" vs "not confined" | Fixed | `06_finland.tex:13` | "concentrated in, though not confined to, the last two decades" → "concentrated in the last two decades" | The preceding sentence says that against the core the cost is confined to 1968–89. |
| 8 | m14: source of the branch weights | Fixed | `02_method.tex:41`; `scripts/R/tables.R:421` → `Tables/estonia/T2_sources.tex` | Method: the 1990 Estonian industrial value-added by branch, in dollars, is converted back to roubles at the branch-specific conversion ratios; footnote "Branch structure: `\autocite[190, table 5]{bolotin1992}`". T2 row: "branch weights from the 1990 benchmark (`\cite[190, table 5]{bolotin1992}`)". | Bolotin 1992 p.190 (rendered): Table 5 gives industrial value added by branch for each republic in dollars, plus dollar conversion ratios. This matches the existing §V footnote (05:41) and the dissertation l.1940. Rerunning `tables.R` changed only T2. |
| 9 | Clark "too high by a sixth" | Fixed | `06_finland.tex:9` | "Clark's 90 per cent, which Valge adopted …, is thus too high by a sixth" → "Clark's 90 per cent for 1925–34, … is thus too high: on the present series Estonia stood at between `\pctfin{1928}` and `\pctfin{1925}` per cent of the Finnish level in those years" (76–88) | Clark's ratio refers to 1925–34 (dissertation l.4559). The old sentence compared it with 1938 (75). The new range uses the existing `eePCTfin` macros; nothing was computed. |

**Not touched (author's decisions, outside the plan):**
- m17 (borders of the 1937–40 yearbook figures).
- The referee's methodological points MC1–MC8 (overlap logic, 1938 end-year sensitivity, 1950 level, documentation of the benchmarks, MPD vintages, the interwar industry proxy, tax bound).

## Verification
- `scripts/R/tables.R` reran (exit 0); only `T2_sources.tex` changed.
- Compiled inside `Paper/estonia` with xelatex → biber → xelatex ×2: 72 pages, 0 undefined references or citations, 0 errors, 0 overfull boxes over 5pt. Biber shows only the known warnings (duplicate keys, month fields).
- All edits checked in the PDF text.
- Word was not rebuilt and nothing was committed.
