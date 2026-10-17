# Plan: Estonia paper, mention the 1962–3 Soviet agricultural crisis

**Date:** 2026-10-17
**Status:** APPROVED (explicit user request; executed autonomously)
**Origin:** `quality_reports/2026-10-17_estonia_followups.md`, item 1

## Goal
Add a sourced, hedged passage to the Estonia paper explaining the 1962 check in the series (crop index −19 per cent, income per head +0.6 per cent) as the Estonian instance of the Union-wide agricultural crisis of 1962–3, citing the three sources the author placed in `Papers/1962 crisis/`.

## Files
1. `Paper/estonia/bibliography_additions.bib` — add `purre1964`, `belkharoev2024`, `andreenkov2021` (copied from `Paper/latvia/bibliography_latvia.bib`, author initials matched to the Estonia bib's `purre1965`).
2. `Paper/estonia/sections/03_results.tex` — one sentence in the 1950–68 paragraph flagging 1962 as the only interruption, cross-referencing Section 5.
3. `Paper/estonia/sections/05_implications.tex` — new paragraph after the 1950–68 industrialisation paragraph: the Estonian numbers, the Union-wide causes and policy response (Belkharoev 17–19; Andreenkov 111–13), the Estonian evidence (Purre 34–5, 55), hedge on season vs policy, contrast with Union hunger.

## Numbers used (from `Tables/estonia/A1_series.tex`, `A2_sectoral_a.tex`, `A2_sectoral_b.tex`)
- Crops 134.2 → 109.1 (−18.7 %), 1963 132.2, 1964 152.7
- Primary 115.5 → 104.9 (−9.2 %), 1963 115.5, 1964 125.7
- Livestock 1961–4: 99.3, 99.1, 97.6, 98.4 (1938 = 100)
- GDP index 222.8 → 227.2 (+2.0 %); GDP pc 5,513 → 5,547 (+0.6 %); 1960/1961/1963/1964 pc growth 6.2/3.7/5.3/5.3
- Industry 582.0 → 623.3 (+7.1 %)

## Verification
- XeLaTeX → biber → XeLaTeX ×2 in `Paper/estonia/`; 0 undefined citations, no new overfull boxes.
- Session log entry appended; memory TODO cleared.
