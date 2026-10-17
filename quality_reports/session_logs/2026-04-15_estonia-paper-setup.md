---
date: 2026-04-15
session: Estonia paper — initial setup
status: IN PROGRESS
---

## Goal
Set up the two-paper structure for the Baltic GDP reconstruction project and complete all pre-writing preparation for the Estonian GDP paper.

## What was decided
- Split original single paper into two: Estonian GDP 1919–1995 and Latvian GDP (1919 extension + 1940–1995)
- Work sequentially: Estonia first, Latvia second
- Both papers in a single repo (`Paper/estonia/`, `Paper/latvia/`)

## What was done this session
1. Fixed Python hook error — `python3` on Windows resolves to Microsoft Store alias; changed all hooks in `settings.json` to use `python`
2. Read and confirmed Phase 1 and Phase 2 instructions from `Instructions/`
3. Created folder structure: `Dissertation latex files/`, `Papers/` (6 subfolders), `Datasheets/`, `Instructions/`
4. Verified all source folders are populated (dissertation .tex + .bib, ~200 PDFs across 6 paper folders, 14 CSVs + Sources.csv)
5. Drafted and approved contents outline for Estonian paper (7 sections)
6. Drafted and approved tables and figures plan (T1–T8, F1–F8, Map)
7. Saved approved plan to `quality_reports/plans/2026-04-15_estonia-paper-plan.md`
8. Read Estonian-specific dissertation chapters: 1938 benchmark appendix, all sectoral estimation sections, cross-checks and quality assessment section, full GDP per capita data table
9. Created `Paper/estonia/main.tex` — full skeleton with section structure, writing briefs in comments, table/figure placeholders, custom commands, Chicago notes citations
10. Copied dissertation bibliography to `Paper/estonia/bibliography.bib`
11. Created `Figures/estonia/` directory
12. Confirmed clean XeLaTeX compile (4 pages, no errors)

## Key context for next session

### Paper identity
- Title: *New GDP series for interwar and Soviet Estonia: a Finnish miracle that never was*
- Authors: Klimantas (ISM) & Klesment (Tartu)
- Target: Economic History Review
- Citation style: Oxford footnote (biblatex-chicago notes)

### Three methodological dimensions
1. New 1938 benchmark (replaces Valge 2003 PPP conversion)
2. Recalculated 1919–1940 interwar series using new benchmark
3. Soviet-period series 1937–1995 anchored to Bolotin (1990) — **principal contribution**

### Key numbers to remember
- Estonian 1938 GDP per capita: **2,684.9 Int$1990** (Valge implied ~2,745)
- PPP method: Fisher ratio vs. Sweden = 1.79 SEK/EEK → Estonia at 54.8% of Sweden
- Interwar splice (1940): difference −0.3% — "firm"
- Soviet splice (1991): difference −0.7% — "firm"
- 1990s splice problematic (differences up to −25.8% by 1995) but splice point well-chosen at 1991

### Writing rules
- Draw heavily on dissertation (copy/paste fine — unpublished)
- Paraphrase (not copy) from: Klimantas 2023 Lithuanian, Klimantas et al. 2023 Latvia, Klimantas 2026 Soviet Lithuania
- No Latvia data 1940–1995 (reserved for separate paper)
- No internet literature searches — only use Papers/ folders
- Data attribution: "Sources: see online appendix"
- Avoid "counterfactual" in section titles and narrative

### Files
- Plan: `quality_reports/plans/2026-04-15_estonia-paper-plan.md`
- Paper skeleton: `Paper/estonia/main.tex`
- Bibliography: `Paper/estonia/bibliography.bib`
- Dissertation: `Dissertation latex files/klimantas2024dphil.tex`

## Next step
Begin writing the paper section by section. User to decide which section to start with.

## Open questions
- None blocking
