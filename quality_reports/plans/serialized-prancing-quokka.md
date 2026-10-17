# Plan: Paper Structure — Baltic GDP Reconstruction Article

**Status:** COMPLETED  
**Date:** 2026-04-03  
**Session goal:** Design the section-by-section structure of the journal article for Economic History Review approval, based on dissertation chapters 3–4 and Excel data.

---

## Context

The user is writing a publishable journal article (target: *Economic History Review*, ~10,000 words) based on their Oxford DPhil dissertation (Klimantas 2025). The paper's primary contribution is **new GDP per capita series** for Latvia (1940–1995) and Estonia (1919–1995) — filling a gap in the Maddison Project Database for the Soviet occupation period. A comparative analysis (~15% of the paper) benchmarks the new series against Finland and Western Europe.

**Scope constraints confirmed by user:**
- Latvia: 1940–1995 only (1919–1940 excluded from this paper)
- Estonia: 1919–1995 (interwar treated benchmark-focused, not full sectoral breakdown)
- Lithuania: excluded
- Comparative section: supporting (~15% of words), not a separate standalone contribution

**Key source materials read:**
- Dissertation chapters 3–4 (pp. 95–224): methodology, comparative results
- Data/Analysis 20251111.xlsx: 40-sheet workbook with complete GDP reconstruction, Maddison/WDI series, comparison countries, beta-convergence, sectoral data

---

## Proposed Paper Structure

### Abstract (~150 words)
New GDP per capita estimates for Latvia (1940–1995) and Estonia (1919–1995). Methodology summary. Key finding: both republics experienced rapid convergence toward Western levels during Soviet industrialization (1948–1968), reversal and stagnation thereafter (1968–1989), and deep transition recession before recovery. Series extend Maddison Project coverage and enable systematic comparison with Finland and Western Europe.

---

### 1. Introduction (~700 words)

**Purpose:** Establish the historiographical gap and frame the contribution.

**Content:**
- The Maddison Project covers Baltic GDP from 1995 onward (post-independence); the Soviet occupation period (1940–1991) is largely blank or relies on unreliable Soviet official statistics
- Existing estimates: CIA reconstruction methods (used by Maddison), Dohan, Harrison; none provide consistent series anchored to PPP benchmarks in the modern Maddison framework
- This paper: constructs Int$1990 and Int$2011 series for Latvia (1940–1995) and Estonia (1919–1995) using output-side benchmark extrapolation
- Preview of findings: initial WWII destruction, Soviet-era catch-up stalling post-1968, transition recession deeper in Latvia than Estonia
- Data availability: series deposited with journal

**Key citations:** Broadberry et al., Maddison Project Database v2023, CIA (1990 Bolotin Memo), Harrison (1994, 1998)

---

### 2. Sources and Methodology (~2,000 words)

**Purpose:** Justify the approach and document the construction transparently for replication.

**2.1 The benchmark extrapolation approach (~500 words)**
- Output-side method: GDP_t = GDP_benchmark × physical_index_t
- Why physical product indicators for Soviet period: price data unreliable; quantities more reliable from Soviet statistical yearbooks (*Narodnoe khozyaystvo*)
- Two benchmark years: (1) 1930s PPP benchmark from interwar national accounts; (2) 1990 PPP benchmark from Bolotin Memo / CIA estimates
- Chain-linking procedure at splice years
- Single deflation justified (no input price data available for Soviet period)

**2.2 Latvia: 1940–1995 (~600 words)**
- Starting point: existing interwar Latvian GDP estimates (brief mention; 1919–1940 not in scope)
- WWII gap: 1940–1944/46 — use physical index + demographic data to estimate wartime destruction
- Soviet period (1948–1989): physical product indicators by sector (industry, agriculture, construction, services); source documents — *Latvijas PSR Tautas saimniecība* yearbooks, Central Statistical Archive
- Quality grades (Feinstein scale): assign "firm" at both splice years; grade intermediate years
- 1990–1995 transition: spliced to official Latvian CSB national accounts

**2.3 Estonia: 1919–1995 (~600 words)**
- Interwar (1919–1938): benchmark-focused treatment. The 1938 PPP benchmark is the key methodological contribution; 1919–1938 growth index spliced onto it using existing interwar estimates (Valge, Ojamäe). This avoids re-doing the full sectoral interwar reconstruction already done in the dissertation.
- Soviet period (1948–1989): same physical indicator approach as Latvia; sources — *Eesti NSV Rahvamajandus* yearbooks
- Transition: spliced to Estonian Statistics
- Brief note on territorial scope: post-war Estonian SSR borders used throughout (consistent with Maddison MPD)

**2.4 Benchmarking and PPP conversion (~300 words)**
- 1938 PPP benchmark: League of Nations-derived relative price levels; cross-check with Maddison 2016 and MPD2023 implied benchmarks
- 1990 Bolotin Memo benchmark: adjusted CIA estimate, converted to Int$1990 via MPD conversion ratios
- Int$2011 series: converted using MPD ratio (tracked in Data/Analysis 20251111.xlsx, sheet "01 Stats final GDPs")

---

### 3. Latvia: GDP per Capita 1940–1995 (~2,200 words)

**Purpose:** Present and narrate the Latvian series; this is the paper's first core empirical section.

**Structure:**
- **3.1 WWII and immediate postwar (1940–1948):** ~400 words
  - Estimated GDP decline: ~28% per capita by 1944/46 (dissertation Table 4.6)
  - Recovery trajectory to 1948; deportations and demographic collapse context
  - Figure: GDP per capita index, 1938–1952 (Latvia)

- **3.2 Soviet industrialization (1948–1968):** ~600 words
  - Rapid catch-up: ~2.3% per year (Table 4.7 from dissertation)
  - Industrial branch breakdown (Table 4.8 for growth rates by sector)
  - Investment ratio: above-average Soviet investment in Latvia (dissertation Fig. 4.8)
  - Figure: GDP per capita in Int$1990, Latvia 1948–1968, with Western core reference

- **3.3 Stagnation and reversal (1968–1989):** ~600 words
  - 1968 as inflection: Moscow recentralization, sovnarkozy dismantled
  - Growth decelerates sharply; incomplete structural transformation (agriculture 19–22% of GDP in 1990, Table 4.9)
  - Relative to Western core: Latvia peaks at ~70% in late 1960s, declines to ~50% by 1989
  - Figure: Latvia GDP as % of Western core level, 1948–1989 (5-year moving average)

- **3.4 Transition and recovery (1989–1995):** ~400 words
  - Independence and transition recession: GDP per capita -28% from 1989 to 1993
  - Splice to official Latvian CSB data
  - Series endpoint: ~55% of EU27 average in 1995

- **3.5 Summary table:** Latvia GDP per capita in Int$1990 and Int$2011, decennial benchmarks

---

### 4. Estonia: GDP per Capita 1919–1995 (~2,200 words)

**Purpose:** Present and narrate the Estonian series; integrates the interwar benchmark as the distinctive methodological contribution for Estonia.

**Structure:**
- **4.1 Interwar Estonia (1919–1938):** ~400 words
  - Benchmark-focused treatment: 1938 PPP benchmark anchors the series
  - Growth index 1919–1938 from Valge/Ojamäe estimates; this paper contributes the PPP level
  - Result: Estonia in 1938 at ~78% of EU27 average (dissertation Table 4.12)
  - One figure: Estonia GDP per capita in Int$1990, 1919–1938

- **4.2 WWII and immediate postwar (1939–1948):** ~400 words
  - -29% per capita GDP decline by 1944/46 (similar to Latvia)
  - Estonian SSR territorial note; refugee/deportee population losses
  - Recovery to 1948 starting point for Soviet phase

- **4.3 Soviet period (1948–1989):** ~600 words
  - Very similar narrative to Latvia: rapid 1948–1968 growth (~2.4% p.a.), deceleration post-1968
  - Estonia slightly higher levels than Latvia throughout (more industrialized interwar starting point)
  - Key difference: Estonia's 1938 benchmark was higher than Latvia's → deeper relative fall during Soviet occupation
  - Figure: Estonia vs. Latvia GDP per capita, 1938–1989

- **4.4 Transition and recovery (1989–1995):** ~400 words
  - Estonia's transition recession: somewhat shallower than Latvia (institutional reform head start)
  - Splice to Estonian Statistics; endpoint ~60% EU27 in 1995

- **4.5 Summary table:** Estonia GDP per capita in Int$1990 and Int$2011, decennial benchmarks

---

### 5. Comparative Analysis (~1,300 words)

**Purpose:** Show what the new series contribute to the comparative economic history of the region. Supporting section (~15%), not a standalone contribution.

**Structure:**
- **5.1 Latvia and Estonia compared (~400 words)**
  - Estonia maintained a small but persistent advantage over Latvia in GDP per capita levels throughout 1940–1995
  - Convergence between the two during 1948–1968; divergence in transition (Estonia faster recovery)
  - Figure: Latvia and Estonia GDP per capita in Int$1990, 1938–1995

- **5.2 Benchmarking against Finland and Western Europe (~500 words)**
  - Both republics experienced rapid convergence toward Nordic/Western levels 1948–1968 (socialist industrialization)
  - Post-1968 reversal: both fell from ~65–70% of Finnish level to ~35–40% by 1989
  - The 1968 turning point visible in Figure 4.13 / 4.15 of dissertation: use the same structure
  - Figure: Latvia and Estonia as % of Finnish GDP per capita, 5-year moving average, 1919–1995

- **5.3 Placing the new series in the Maddison Project context (~400 words)**
  - How do the new series compare to existing Maddison 2016 and MPD2023 estimates where they overlap?
  - Series extend coverage from ~1990 back to 1940 (Latvia) / 1919 (Estonia)
  - Brief note on implications for longer-run Baltic catch-up research

---

### 6. Conclusion (~500 words)

**Content:**
- Summary: new estimates contribute transparent, reproducible series filling the Soviet occupation gap in Baltic economic history
- Key empirical finding: convergence was real but regime-dependent; the 1968 reversal is the central macroeconomic story of the Soviet Baltic republics
- Limitations: single deflation for Soviet period; uncertainty bounds not formally quantified (future work); no growth accounting decomposition
- Data availability: series deposited with journal; full source tables in Online Appendix

---

### Online Data Appendix (not counted in word limit)

- Table A1: Latvia GDP per capita 1940–1995 (annual, Int$1990 and Int$2011)
- Table A2: Estonia GDP per capita 1919–1995 (annual, Int$1990 and Int$2011)
- Table A3: Source indicators and quality grades (Feinstein scale) by year
- Table A4: Benchmark values and PPP conversion factors used

---

## Word Budget Summary

| Section | Target Words |
|---------|-------------|
| Abstract | 150 |
| 1. Introduction | 700 |
| 2. Sources and Methodology | 2,000 |
| 3. Latvia 1940–1995 | 2,200 |
| 4. Estonia 1919–1995 | 2,200 |
| 5. Comparative Analysis | 1,300 |
| 6. Conclusion | 500 |
| **Body total** | **9,050** |
| Footnotes (estimated) | ~600 |
| References (estimated) | ~400 |
| **Grand total** | **~10,050** |

---

## Figures and Tables (Planned)

| Item | Location | Content | Source in Data/ |
|------|----------|---------|----------------|
| Figure 1 | §3.1 | Latvia GDP index 1938–1952 | Sheet "01 Stats final GDPs" |
| Figure 2 | §3.2 | Latvia GDP in Int$1990, 1948–1968 vs. Western core | Sheet "MPD & WDI % nordic and eu" |
| Figure 3 | §3.3 | Latvia GDP as % Western core, 1948–1989 | Sheet "Moving avgs" |
| Figure 4 | §4.1 | Estonia GDP in Int$1990, 1919–1938 | Sheet "H Interwar lag" |
| Figure 5 | §4.3 | Estonia vs. Latvia GDP per capita, 1938–1989 | Sheet "01 Stats final GDPs" |
| Figure 6 | §5.1 | Latvia and Estonia GDP per capita, 1938–1995 | Sheet "01 Stats final GDPs" |
| Figure 7 | §5.2 | Latvia and Estonia as % Finland, 1919–1995 | Sheet "MPD & WDI % nordic and eu" |
| Table 1 | §3.5 | Latvia GDP per capita, decennial benchmarks | Sheet "01 Stats final GDPs" |
| Table 2 | §4.5 | Estonia GDP per capita, decennial benchmarks | Sheet "01 Stats final GDPs" |

---

## Open Questions Before Drafting

1. **Section ordering:** Should Methodology come before the country sections (as planned here), or should methodology be integrated into each country section? The separate methods section is standard for data reconstruction papers.

2. **Estonia interwar detail:** The plan gives ~400 words to 1919–1938 Estonia (§4.1). Is that the right level of detail, or should this be even shorter (e.g., ~200 words in a footnote/paragraph)?

3. **Data appendix:** Should the annual series appear as an online appendix only, or should decennial data be in the main text tables?

4. **Figures:** 7 figures is substantial for EHR. Should some be merged or moved to the appendix?

---

## Files to Create (Implementation Phase)

| File | Action |
|------|--------|
| `Paper/main.tex` | Create — article skeleton with section headers, `\label{}` for all sections |
| `Paper/preamble.tex` or `Preambles/article.tex` | Create — LaTeX preamble (to be discussed) |
| `scripts/R/figures.R` | Create — R script for all 7 figures (populated incrementally) |
| `scripts/R/tables.R` | Create — R script for summary tables |
| `Bibliography_base.bib` | Populate — key references as drafting begins |

---

## Verification (Post-Implementation)

1. `Paper/main.tex` compiles with xelatex without errors (all sections present, no missing `\input{}`)
2. Section word targets checked at end of each drafting session
3. Domain reviewer run on each completed section
4. All figures reproducible from `Data/` via `scripts/R/figures.R`
