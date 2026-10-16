# Plan: Rewrite the Estonia paper (tables only, EHR style, statistical appendix)
**Status:** COMPLETED (draft for author review; see session log 2026-10-16 for open author items) | **Date:** 2026-10-16
**Paper:** *New GDP series for interwar and Soviet Estonia: a Finnish miracle that never was* (Klimantas & Klesment), target: Economic History Review
**Supersedes (content-wise):** `2026-04-15_estonia-paper-plan.md` (kept as the content backbone; this plan changes form, style, length and adds the reviewer-driven material)

## Context
The April draft (`Paper/estonia/main.tex`, ~12.5k words, 9 tables + 9 figures) is complete in prose for §I–§VII but (a) relies on graphs, (b) is not yet in EHR house style, (c) does not yet answer the reviewer points collected in `Instructions/Instructions phase 3 reviewer comments.txt`, and (d) has no statistical appendix. New inputs: template papers (Kenny 2025, Klimantas 2023/2026, Ó Gráda, Roy 2026, Bromhead–Kenny), `Papers/` background folders, and the filtered `master_supporting_docs/estonia_paper_literature/` (991 source folders, per-page txt + APA `_bibinfo.txt`, `MANIFEST.csv`).

**User decisions (this session):** rewrite every section in EHR style, reusing verified facts; length matched to Kenny 2025; appendix = LaTeX appendix in the paper + Excel workbook.

## Fixed constraints (from instructions/rules)
- No figures at all (drop map F0 and F1–F8); every figure's information moves into a table or prose.
- No recalculation of the series; no 1938-weights replication (reviewer pt 6); no transfers/defence discussion (pt 7); no Latvia data for 1940–95; avoid the word "counterfactual" in titles/narrative; "Sources: see online appendix" for own estimates, Datasheets citations from `Datasheets/Sources.csv`.
- Oxford footnote style (biblatex-chicago notes); paraphrase, do not reuse wording from Klimantas 2023, Klimantas et al. 2023, Klimantas 2026; dissertation text may be reused. No internet searches: use `Papers/`, the filtered literature folder, `Dissertation latex files/`, `Datasheets/`.
- Python unavailable: R only (`C:\Program Files\R\R-4.5.0\bin\Rscript.exe`, not on PATH; readxl/openxlsx/dplyr/knitr installed). XeLaTeX + biber (the draft uses biblatex-chicago, not bibtex).

## Length and skeleton (target ≈12,000 words incl. footnotes, excl. references/appendix; Kenny 2025 ≈12k)
Kenny uses an unnumbered introduction, five numbered sections, no subsections; Klimantas 2026 has a methodological review and a stand-alone limitations block. Estonia version:

| Part | Words | Content (reviewer point addressed) |
|---|---|---|
| Abstract | 180 | Product, method, headline numbers (levels, growth, Finland ratio) |
| Introduction (unnumbered) | 1,100 | Historiography; the gap; Valge/Klesment/MPD; 3 numbered contributions; findings with numbers; roadmap |
| I Background and previous estimates | 1,100 | Short political-economic history (map removed); Valge 2003, Klesment 2008/2010, Norkus–Markevičiūtė 2021, MPD handling of Bolotin |
| II Sources and method | 3,000 | Output approach; **Soviet accounting debate**: Bergson/CIA, Maddison 1998, Harrison 1993, Becker/Schroeder, Vonyó, Zhuravskaya et al. 2024 (pts 9, 11); official-statistics caveat: distortion sits in aggregates/monetary data, physical series used (pt 10); **Bolotin benchmark quality vs Ponomarenko 2002** and why no new benchmark (pt 3); **archival sources used, classified/military products, quality of Nazi-period sources** (pt 5); 1938 interwar benchmark (Sweden PPP) and 1919–40 series; Soviet 1937–95 series; population; splicing |
| III The new series | 1,300 | Levels, sub-period growth, sectoral contributions, comparison with Valge/Klesment/MPD |
| IV Validation, limitations, sensitivity | 1,700 | **Strong case for single-benchmark extrapolation vs Gerschenkron/Paasche bias** (pt 1); **overlap precision 1937–40 and 1990–95 defended, incl. rouble→USD conversion** (pt 2); **explicit assessment of constant VA/output ratios (single deflation) with bias bounds** (pt 6); bias table |
| V Estonia in comparative perspective | 2,100 | ≤250-word theory frame (Gerschenkron, Abramovitz, Solow, North/Acemoglu); interwar; WWII; Soviet period **with USSR comparison** (Estonia absorbed far above Union average; trace relative position 1940→1989) (pt 4); **collectivisation read off agricultural volume index** (pt 4); **sectoral irregularities explained** (textile peak ~1974, construction dips ~1956/62/79, housing decline ~1986) using Pihlamägi 2013, Mertelsmann 2022, Kibita 2013, Klesment 2009 (pt 8); transition shock |
| VI A Finnish miracle that never was | 1,300 | Literature on Estonia–Finland "alter ego"; evidence from new series (1919/29/38 ratios), literacy, agriculture shares, trade, university students (Datasheets); verdict: interwar gap too large to treat Finland as a path Estonia would have followed |
| VII Conclusion | 500 | Product, three findings, MPD-ready, future work |

## Tables replacing the graphs (≈12 main + appendix)
Main text: **T1** benchmarks 1938 (Valge vs new) and 1990 (Bolotin) by sector [from existing `T1_benchmarks.tex`]; **T2** sources and method by sector and period (Kenny T3 / Roy T1 style, with appendix codes); **T3** overlaps 1937–40 and 1990–95 with Feinstein grades [merge existing T2+T3]; **T4** new series vs Valge, Klesment et al. 2010, MPD at selected years (replaces F2); **T5** growth by sub-period: Estonia, Finland, USSR, Western core (extends existing T5); **T6** sectoral growth and contributions by sub-period, incl. agriculture 1938–58 (replaces F4/F5); **T7** sensitivity and bias table (Klimantas 2023 T5 format); **T8** Estonia relative to Western core / USSR / Finland at benchmark years (replaces F3, F6); **T9** Estonia vs Finland benchmark years (existing T6); **T10** GDPpc PPP 1920–39 comparators at selected years (replaces F7); **T11** trade openness 1920–39 (replaces F8); **T12** structural comparators 1930s: literacy, agricultural employment, students (merge existing T7+T8). The two long annual tables (old T4a/T4b) move to the appendix.

## Statistical appendix
- **In the paper (LaTeX, `Paper/estonia/appendix.tex`, `\input` after the bibliography):** A1 benchmark construction (1938 Sweden price comparison, service value-added build-up, Bolotin 1990); A2 sector-by-sector procedures and source codes (Kenny-style app. 1; Klimantas 2023 app. 2), explicit on archives (Rahvusarhiiv, yearbooks *Eesti NSV rahvamajandus*) and German-occupation data quality; A3 population; A4 annual GDP per capita (Int$1990, Int$2011) and population 1913–2022; A5 annual sectoral volume indices 1919–1995 (from `Datasheets/Sectoral volume indices Baltics 1919-1995.csv`, Estonia columns); A6 source list.
- **Excel (`Data/` or deposit folder, built by R/openxlsx):** modelled on `newsources/Klimantas2026_Appendix_A_supplementary_data_and_sources.xlsx` (sheets 0 Description with citation/licence line, 1 Population, 2 Value-added, 3 GDPpc Int$1990 & 2011). **No "alternative weights" sheet** (no recalculation; none exists for Estonia).

## Evidence work needed before drafting (parallelisable)
1. **Ponomarenko 2002** (`Papers/Previous research papers/Ponomarenko 4.doc`, needs text extraction) and the CIA-methodology debate in the dissertation (`Dissertation latex files/klimantas2024dphil.tex`) plus `Papers/Methodology papers` (Maddison 1998, Harrison 1993, JEC 1982/1990, Gerschenkron 1957, Jonas & Sardy, Feinstein & Thomas, Broadberry–Burhop).
2. **Sector anomaly scan** in R over the Estonia sectoral indices (peaks, troughs, break years in textiles, construction, housing, agriculture) and mapping each to explanations in the literature folder.
3. **Estonia vs USSR/Finland/Western core** ratios from `Datasheets/GDPpc 1990usd.csv` (columns `USSR`, `Adjusted USSR`, `Finland`, `Western core`) and other Datasheets for T10–T12.
4. **Archival-source facts** for the Estonian series (what was taken from Rahvusarhiiv, classified products, German-period sources) from the dissertation and `Instructions/` files; confirm with authors if the dissertation is silent.

## Implementation steps (orchestrator loop applies after approval)
0. Save this plan (rename to `2026-10-16_estonia-paper-rewrite.md`), write the post-plan session log, add `[LEARN]` notes (R path, biber, Python-free).
1. **Data/R refactor (Article IV):** rewrite `scripts/R/tables.R` and `figures.R` so they use relative paths (no `setwd` to `C:/Users/...`), read `Data/Klimantas_2025_data.xlsx` and `Datasheets/*.csv` instead of hard-coded numbers, emit all tables to `Tables/estonia/`, and write a `numbers.tex` of computed macros so prose quotes machine-generated values. Retire `figures.R` and delete `Figures/estonia/` references from `main.tex`. Resolve known inconsistencies in the April draft (1995–2022 growth 4.1 vs 4.2 per cent; 1989–95 −5.8 vs −5.9; Western-core and Finland ratios) from the data.
2. Evidence work above.
3. Draft sections in order Introduction → I → II → IV → III → V → VI → VII → abstract, in `Paper/estonia/main.tex` (single file plus `appendix.tex`); cite from the literature folder; add new entries to `Paper/estonia/bibliography.bib` and mirror them in root `Bibliography_base.bib` (Article I; open question on which file is authoritative).
4. Build appendix tables and Excel workbook from the same R pipeline.
5. Compile (`TEXINPUTS` for preambles, XeLaTeX → biber → XeLaTeX ×2); fix overfull boxes, undefined citations, missing table sources.
6. Reviews: `domain-reviewer` (source fidelity, hedging of causal claims, index-number logic), `/proofread`, `/validate-bib`, `/review-paper` against EHR norms and the 11 reviewer points; `r-reviewer` on the scripts. Max 5 fix rounds; score with Article III rubric (≥80 commit, ≥90 draft for co-authors).

## Verification
- `Rscript scripts/R/tables.R` runs from the repo root on a clean checkout and regenerates every table and `numbers.tex`; no absolute paths.
- Full XeLaTeX+biber build with zero undefined citations/references, no `\includegraphics`, no figure environments, overfull hboxes <5pt.
- Word count within ±5% of the Kenny-matched budget; each reviewer point 1–6, 8–11 located in a named section (checklist in the session log; pt 7 intentionally omitted).
- Spot-check 20 numbers in the prose against the Excel workbook; confirm Excel equals the appendix tables.
- Table sources present for every table (`Sources: see online appendix` or Datasheets citations).

## Open points (flag, do not block)
- Bibliography authority: working `.bib` in `Paper/estonia/` vs root `Bibliography_base.bib`.
- If the dissertation does not document archival source details needed for pt 5, the authors must supply them.
- Excel workbook: built by R from `Data/`; the authors may still replace it with their own version (earlier instruction said they would create it).
