# Plan: Latvia Soviet-period GDP series and Baltic comparative paper (JEH style)
**Status:** DRAFT COMPLETE, review round 1 applied (build clean, score 95) (user brief 2026-10-17; executed autonomously) | **Date:** 2026-10-17
**Paper:** *Baltic growth puzzle: the first Latvian Soviet-period series and a Baltic comparative growth analysis, 1919–2025*
**Authors:** Adomas Klimantas, Stephen Broadberry, Martin Klesment, Gatis Krūmiņš | **Target:** Journal of Economic History
**Companion papers:** Klimantas 2026 (Cliometrica, Lithuania 1940–95); Klimantas & Klesment (Estonia 1919–95, working paper under review)

## User brief (verbatim essentials)
- Same family as the Estonia and Lithuania papers; draw heavily (text may be reused) on the dissertation (`Dissertation latex files/klimantas2024dphil.tex`); paraphrase wording shared with the three published papers.
- Latvian estimation spans the Soviet period only (1937–95), anchored to the published interwar series (Klimantas et al. 2024, 1920–39, extended to 1919/1940) and to adjusted MPD after 1991; provide the final 1913/1919–2024(25) series.
- JEH style (templates: Broadberry & Korchmina 2024, Pfister 2022, Palma & Reis 2019 in `Papers/Template papers`): author–date citations, substantive footnotes, unnumbered CAPS section headings, tables with Notes/Sources, reference list.
- Structure: why the series are needed → estimation 1937–95, anchoring, final series → brief Latvian analysis (LT and EE papers already analyse those countries; cite the Estonia paper as a working paper under review) → the grand Baltic comparative analysis under three regimes (interwar capitalism, Soviet socialism, modern independence), taken largely from the dissertation's Chapter 4.
- Filter the relevant sources (`newsources/` → `master_supporting_docs/latvia_paper_literature/` with MANIFEST.csv). No internet searches.

## Deliverables
1. `Paper/latvia/main.tex` + `sections/*.tex` (XeLaTeX + biber, biblatex-chicago author–date), `Paper/latvia/bibliography*.bib`.
2. `scripts/R/latvia_tables.R`: reads `Data/Klimantas_2025_data.xlsx`, `Datasheets/*.csv`, `Data/latvia_*.csv`; writes `Tables/latvia/*.tex`, `Figures/latvia/*.pdf`, `Tables/latvia/numbers.tex`, `Paper/latvia/supplementary/Latvia_online_data_appendix.xlsx`.
3. Filtered literature folder + manifest; session log; this plan.

## Skeleton (target ≈12,000 words excl. references/appendix)
| Part | Words | Content |
|---|---|---|
| Abstract | 150 | Product, method, headline comparative findings |
| Introduction | 1,200 | The Baltic growth puzzle (three literate, egalitarian economies that never left the periphery; Latvia from richest to poorest Baltic state); the data gap; three contributions; findings; roadmap |
| I The data gap and previous estimates | 1,000 | MPD/NMP problems; Bolotin; Latvian estimates (Aizsilnieks, Rosés–Wolf, Norkus–Markevičiūtė, Norkus et al. 2022, Klimantas et al. 2024); nothing for 1940–95 |
| II Estimating Latvian GDP, 1937–95 | 3,000 | Output approach; Soviet statistics and the CIA tradition (condensed); 1990 benchmark (T1); sources and indices by sector (T2); population and borders; war years; 1919/1940 extension; splicing and overlaps (T3); final series (T4 selected years; A1 annual); limitations and sensitivity (T5) |
| III Latvia under Soviet rule | 1,300 | Sectoral growth by sub-period (T6, F4); WWII, recovery, collectivisation, 1948–68 boom, 1962 dip, 1968/1975 turning points, 1974–82 harvest depression, decline from 1987, transition |
| IV The Baltic growth puzzle | 4,200 | Framework (Gerschenkron/Abramovitz–David/Crafts–Toniolo); growth rates by regime (T7, F1, F2); WWI/WWII impact (T8); interwar capitalism (structure T9, trade); Soviet socialism (collectivisation T10, industrial mix, 1968, specialisation/investment, vs USSR); modern independence (transition T11, tigers, divergence since 2019, Nordic yardstick, population effect); beta-convergence (F3); sources of catch-up and decline |
| V Conclusion | 600 | |
| Appendix | — | A1 annual GDP pc + population 1913/1919–2024; A2 Latvian sectoral indices 1919–95 |

## Steps
0. Save plan + post-plan session log. 1. Filter literature; launch two extraction agents (Soviet-period Latvia; interwar/transition/modern Latvia). 2. R pipeline, tables, figures, numbers.tex, workbook. 3. Draft sections. 4. Build (xelatex → biber → xelatex ×2), fix errors. 5. domain-reviewer + proofreader; apply fixes; rebuild. 6. Session log, memory notes.

## Verification
- `Rscript scripts/R/latvia_tables.R` from repo root regenerates every table/figure; no absolute paths.
- Clean build, 0 undefined citations/references, overfull hboxes < 5pt; every table/figure sourced; word count within ±10% of 12,000.
- Reviewer-point material from the Lithuanian referee (single late benchmark, overlaps, Bolotin quality, archival sources, single deflation, Zhuravskaya et al., CIA debate) present in §II, condensed.

## Open points for the authors
- RESOLVED 2026-10-17: paper limited to 2024; title changed to 1919--2024.
- Affiliations of Broadberry and Krūmiņš entered as Oxford/Nuffield and Vidzeme University of Applied Sciences; confirm.
- Author answers 2026-10-17: Abrene share unverified -> hedged in Section 2 + limitations with the Maddison Project one-third rule (Bolt & van Zanden 2014, 629); 1962 crop collapse is real (Union-wide 1962-3 crisis; sources in `Papers/1962 crisis/`, cited); workbook vintage kept; word count and affiliations accepted as is. Estonia paper must mention the 1962 crisis too: see `quality_reports/2026-10-17_estonia_followups.md`.
