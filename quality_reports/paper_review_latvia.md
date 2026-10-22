# Referee Report: "Baltic Growth Puzzle: The First Latvian Soviet-Period Series and a Baltic Comparative Growth Analysis, 1919–2024"

**Date:** 2026-10-22
**Reviewer:** review-paper skill
**File:** `Paper/latvia/main.tex` (sections `00_abstract`–`06_conclusion`, `appendix`; tables `Tables/latvia/*.tex`; compiled `Paper/latvia/main.pdf`, 68 pp., built 2026-10-18 23:04)

How I checked this: I read every section file and every table source. I resolved all 140 `numbers.tex` macros used in the text to their printed values and checked each one against the tables. I recomputed growth rates, ratios and overlap differences from Tables 4, 5, 9–11 and A1–A4, and re-ran the four β-regressions of Table 17 in R from the Table A4 data. The paper's coefficients, standard errors, R² and residuals reproduce exactly. I extracted the PDF text to see how cross-references and the author-check boxes render. Table numbers below are the *rendered* numbers, with the source file in brackets: T13_levels = Table 11, T14_relative_avg = Table 12, T15_beta = Table 17, T16_sectoral_idx = Table 8, A3_beta_data = Table A4.

---

## Summary Assessment

**Overall recommendation: Revise & Resubmit (major revision)**

The paper fills a real gap. It gives the first physical-output-based GDP series for Soviet Latvia and, with the companion Lithuanian and Estonian series, the first comparison of the three Baltic economies on national accounts rather than proxies across 1913–2024. The archival effort is substantial: 129 product series, wartime Ostland statistics, and RGAE transport returns. The best feature is the 1937–40 overlap with an independently benchmarked interwar series. The headline growth facts are arithmetically consistent across the text, Tables 4, 9, 10, 11 and A1: a 1950–68 boom, near-stagnation in 1968–89 (0.7 per cent a year), and a 45 per cent transition trough. Maddison Project users will want this series.

The manuscript is not yet ready for a journal of the EEH/EHR/Cliometrica tier, for four kinds of reasons:

1. **Presentation.** Two unresolved yellow "Author check" boxes are printed in the PDF (pp. 11 and 35). Both flag unreconciled numbers in the benchmark table and the structure table.
2. **Internal contradictions in the splice and benchmark narrative.**
   - The text says the modern series shows a *shallower* 1991–2 decline than the Soviet-period series. Table 4 shows it is far *deeper*.
   - The text gives three incompatible explanations for the Maddison Project's 24 per cent excess in 1990.
   - The text says MPD income rose "5 per cent ... again in 1990". Table 5 shows +0.9 per cent.
3. **Fragile rankings.** Several comparative claims rest on gaps much smaller than the error bands the paper itself reports. The "deepest contraction", "now the poorest" and "Estonia overtook in 1989" claims all depend on 1–3 per cent margins or on the splice choice.
4. **Over-interpreted regressions.** The β-convergence regressions are read too strongly. Two of five slopes are insignificant (p ≈ 0.11). The interwar slope disappears when four micro-economies are dropped, and the 1989–2019 slope nearly doubles when the CIS states are dropped. The "exceeded/met the expectation" verdicts in the conclusion rest on residuals of 0.05–0.75 points against a residual s.d. of 1.14.

The causal language about socialism, social capability and inheritance also runs ahead of a descriptive design that the authors themselves describe as non-causal (05_baltic.tex:67).

None of this is fatal. The series looks sound; the problems are in how the reconstruction is defended and how the comparison is interpreted. A revision should:

- resolve the author checks and the splice contradiction;
- report sensitivity of the 1990 level and weights to the service-sector allocation and parity;
- give a sector-contribution decomposition of 1968–89 growth;
- make the regression section robust, or reframe it as purely descriptive with prediction intervals;
- hedge the rankings and the causal claims.

The paper also runs to about 16,000 words of body text, above most journal limits. Sections III and V.6 could be cut.

---

## Strengths

1. **A genuinely new series** for a missing case. It completes the Baltic Soviet-period accounts and is ready for MPD use (Table A1, 1913 and 1919–2024, in Int$1990 and Int$2011, with population).
2. **A strong validation design.** Two series with no shared sources, weights or benchmark agree within 3.5 per cent over 1937–40 (Table 4a). The paper is explicit about Feinstein grades and about what the overlap can and cannot test (03_method.tex:65, 83, 85).
3. **Mostly sound measurement choices.** Reliance on physical quantities is well argued and well sourced (Harrison/Khanin, Ponomarenko, CIA). The one value series (trade turnover) is flagged honestly (03_method.tex:15).
4. **Transparent computation.** Every number in the text is macro-generated from the R pipeline (`numbers.tex`). All 140 macro calls resolve and agree with the tables, and the regressions reproduce exactly from Table A4. That is exemplary reproducibility.
5. **Rich and well-referenced historical narrative.** Sovietisation, collectivisation, sovnarkhoz, the 1962 food crisis and the transition are well covered, with good use of recent Latvian historiography (Krūmiņš et al.), which non-Baltic readers rarely see.
6. **A careful correction of the record** on Maddison Project levels (Table 5) and on the Rosés–Wolf interwar figures, including the gold-standard footnote (02_gap.tex:9).

---

## Major Concerns

### MC1. Unresolved author-check boxes are printed in the manuscript
- **Dimension:** Presentation / Identification
- **Issue:** Two `\authorcheck` boxes render in the PDF.
  - **03_method.tex:21 (p. 11).** The 1990 industry value in Table 1, 3,190.8 m roubles, is 301.9 m above what Bolotin's $5.2 bn at a parity of 1.80 implies (2,888.9). The uplift is undocumented and also present in the Lithuanian and Estonian benchmarks. It raises industry's weight from about 26.0 to 28.0 per cent. My rough calculation from Tables 1 and A2: reverting to Bolotin's figure would raise the backcast 1938 level by about 1.4 per cent, moving the 1938 overlap gap from +3.2 towards about +4.6 per cent. That is still "firm", but closer to the 5 per cent line the paper leans on.
  - **05_baltic.tex:31 (p. 35).** Four of the agricultural-employment cells in Table 14 (USSR, Bulgaria, Hungary, Greece) do not match the cited source, Morys, and Ivanov is not cited for them.
  - In addition, the Int$1990 per-capita benchmark (7,965) cannot be reproduced from Table 1. Bolotin's sector parities applied to the rouble values give $21.50 bn. On the paper's mid-year population of 2,663.2 thousand that is 8,073 per head, not 7,965. The Table 1 note sends readers to the online appendix.
- **Suggestion:** Either justify the industry uplift in the text and in the Table 1 note, or revert to Bolotin's figure. Re-run the overlap after whichever choice is made. Report Bolotin's dollar total and the population used. Reconcile and cite every Table 14 cell. Remove the boxes.
- **Location:** 03_method.tex:21; 05_baltic.tex:31; Table 1 (T1_benchmarks.tex:14, 33, 38); Table 14 (T9_structure.tex:13–30).

### MC2. The 1990–5 splice narrative contradicts Table 4, and the "deepest contraction" ranking depends on it
- **Dimension:** Identification / internal consistency
- **Issue:**
  - **What the text says (03_method.tex:67):** after 1991 the gap widens because the Soviet-period series "misses the new private activities", while the modern series "records a shallower decline, in line with the view that official data overstated the early-transition fall".
  - **What Table 4 shows:** the opposite. From 1991 to 1992 the modern series falls 31 per cent (7,205 → 4,959) and the Soviet-period series 15 per cent (7,385 → 6,280). A positive difference in panel (b) means the 1990-based series is the *higher* one. So the cited literature (Kyn; IMF) supports the Soviet-period series, yet the modern series is preferred from 1992 without a stated reason.
  - **Why it matters:** On the Soviet-period series, the 1989–93 fall would be about 36 per cent (5,625/8,772), the same as Lithuania (36) and Estonia (34). The claims that Latvia's fall was "the deepest of the three Baltic contractions" (01_intro.tex:13; 05_baltic.tex:53; 06_conclusion.tex:9) therefore depend on the splice choice.
  - **Related point:** the alternative estimates in Table 16 for Åslund and Hamilton–de Vries are built with this paper's own 1989/90–91 ratios (T12 note), so they are not independent of it.
- **Suggestion:**
  - Correct the description of which series falls faster.
  - State the actual reason for preferring the modern series. Consistency with post-1995 national accounts is a defensible reason.
  - Report the trough for each Baltic state under both splice choices, and hedge the ranking.
  - State how the companion Lithuanian and Estonian series were spliced. Comparability of the troughs requires the same rule.
- **Location:** 03_method.tex:67; Table 4 panel (b) (T3_overlaps.tex:19–24); Table 16 (T12_transition.tex); 01_intro.tex:13; 05_baltic.tex:53.

### MC3. The benchmark level and weights are sensitive to the service allocation and parity, and this is not shown
- **Dimension:** Identification (benchmark validity, PPP conversion, weighting)
- **Issue:**
  - **Weights:** The paper concedes that services take 47 per cent of rouble GDP in the benchmark against 34 per cent in the World Bank's 1990 data (03_method.tex:25). That 13-point difference is a weight error of more than a third. Table 6 nevertheless bounds "incorrect service-sector evaluation" at ±10 per cent of the indicator, or ±4 per cent of GDP.
  - **Level:** Non-market services converted at 3.30 $/rouble supply about 46 per cent of the dollar total (2,969.6 m roubles × 3.30 = $9.8 bn of $21.5 bn). For example, a parity of 2.0 for those sectors would cut the 1990 level by about 18 per cent.
  - **Consequence:** The 1937–40 overlap is the only check on this. If the service parity and the extrapolation both err, the overlap can still come out close by offsetting errors. The paper acknowledges offsetting errors in general (03_method.tex:65) but not this specific channel.
- **Suggestion:**
  - Re-run the series with services reweighted to the World Bank 1990 shares, and report the effect on sub-period growth rates (Tables 7 and 9) and on the 1937–40 overlap.
  - Report the 1990 dollar level under alternative service parities, for instance the Lithuanian and Estonian implied ratios or ICP-type ranges.
  - Add these rows to Table 6.
- **Location:** 03_method.tex:19, 25; Table 1; Table 6 (T5_sensitivity.tex:18).

### MC4. Late-Soviet growth leans heavily on value-based and imputed services; give a sector decomposition
- **Dimension:** Identification (index construction)
- **Issue:**
  - **Decomposition:** I used the 1990 weights in Table 1 and the indices in Tables A2–A3, and the contributions sum to the GDP index change within rounding. On that basis, 1968–89 GDP growth is about 25 per cent from trade, 5 per cent from finance and 24 per cent from transport. Trade rests on turnover at comparable prices. Finance is employment scaled by trade turnover per worker. Industry contributes 17 per cent and agriculture 14 per cent. So roughly 30 per cent of the stagnation-era growth comes from the one value series the paper says is biased by hidden inflation.
  - **Transport anomaly:** The transport index falls 39 per cent in a single year, 1989–90 (1,294.3 → 791.7, Table A3). That is implausible for 1990, and it matters because 1990 is the weight year.
  - **Science:** Science is weighted separately in Table 1 (1.8 per cent of GDP) but has no index column in Table A3 and is not mentioned in the sector notes.
  - **Effect on conclusions:** Over-statement of trade would lower 1968–89 growth further, so it strengthens the stagnation story. But it also raises the backcast levels, which feeds into the overlap.
- **Suggestion:**
  - Add a contributions-to-growth table by sub-period.
  - Show 1968–89 growth with trade deflated for hidden inflation, for example at Howard's rates.
  - Explain or correct the 1990 transport break.
  - Document where science sits.
- **Location:** 03_method.tex:15, 45; Tables A2–A3 (A2_sectoral_b.tex:87–88); Table 6 (T5_sensitivity.tex:21).

### MC5. The overlap's power as a test is overstated
- **Dimension:** Identification (splicing, validation)
- **Issue:**
  - **The 0.1-point argument:** 03_method.tex:65 says that a net growth understatement of "as little as 0.1 percentage point a year over 1940–90 would place it 5 per cent above in every overlap year, which is not observed". Adding a 5 per cent shift to the observed differences (+1.7, +3.2, −1.9, −0.7) gives +6.8, +8.4, +3.1 and +4.3, so not "every year". More importantly, the argument treats both benchmarks as exact. The 1935 price comparison with Sweden and Lithuania and Bolotin's union-wide PPPs each carry level uncertainty far larger than 5 per cent, so the overlap bounds extrapolation error only up to benchmark error.
  - **Shared and borrowed inputs:** The 1943–5 linkage is borrowed from Lithuanian ratios, transport in 1941–4 is assumed to move with the rest of the economy, and services are interpolated (03_method.tex:31, 43, 49). Part of the backcast path through the war is imputed rather than measured.
  - **Choices made with the overlap in view:** Several construction choices were evidently available while the overlap was visible: the industry uplift (MC1), the garrison interpolation, and the WB-versus-MPD 1990–2010 growth (MC6).
  - **Sign inconsistency:** The text says the Swedish fixed-weight bias is "a bound on its magnitude rather than evidence of its direction" (03_method.tex:83), but Table 6 enters it one-sided as −14.
- **Suggestion:**
  - Restate the overlap as a joint test of benchmarks plus extrapolation.
  - Give an explicit benchmark-error band.
  - Say which construction choices were fixed before the overlap was computed.
  - Make the sign of the fixed-weight bias in Table 6 match the text, i.e. ±14 if the direction is unknown.
- **Location:** 03_method.tex:49, 65, 83; Table 6 (T5_sensitivity.tex:20).

### MC6. Three inconsistent explanations of the MPD 1990 gap, and a misstatement of MPD's 1990 growth
- **Dimension:** Argument consistency / accuracy
- **Issue:**
  - **Three explanations:**
    - 02_gap.tex:9 and 03_method.tex:25: the MPD 1990 level "descends from" Bolotin's 1991 ratios, i.e. a level effect.
    - 03_method.tex:67: since the MPD and modern series share the 2011 anchor, "the whole of that difference lies in the growth attributed to the 1990s, not in the level".
    - 03_method.tex:75: "the discrepancy is not in the benchmark alone but in the growth attributed to the late 1980s".

    These cannot all be the main explanation.
  - **Misstated growth:** 03_method.tex:75 says MPD records Latvian income "rising by 5 per cent in 1989 and again in 1990". Table 5 gives MPD 1989 = 9,825 and 1990 = 9,916, which is +0.9 per cent in 1990.
  - **Circularity risk:** The 1990–1 validation of the benchmark rests on choosing World Bank over MPD growth for 1990–2010. Once the series that agrees with Bolotin has been selected, the agreement is not independent evidence.
- **Suggestion:**
  - Give one coherent account of how MPD 2023 builds Latvian 1990 (2011 ICP anchor plus Maddison's backward growth) and decompose the 24 per cent gap into its parts.
  - Correct the 1990 growth statement.
  - Justify the WB choice on grounds independent of the overlap, such as revisions to the Latvian national accounts.
- **Location:** 02_gap.tex:9; 03_method.tex:25, 61, 67, 75; Table 5 (T4_previous.tex:20–21).

### MC7. The β-convergence regressions are over-interpreted and not robust
- **Dimension:** Econometric specification
- **Issue:** I replicated Table 17 exactly from Table A4.
  - **Insignificant slopes:** The interwar slope −0.32 has SE 0.20 (p = 0.11), and the 1989–2019 slope −0.56 has SE 0.34 (p = 0.11, R² = 0.06). HC1 robust standard errors are similar: 0.19 and 0.33.
  - **Interwar sensitivity:** Dropping Luxembourg, Malta, Cyprus and Iceland makes the interwar slope −0.13 (p = 0.62). Without them, the "gently negative" interwar slope is zero. The same exclusion halves the Cold War pooled slope, to −0.30.
  - **Post-1989 sensitivity:** Excluding the seven CIS successor states (Armenia, Azerbaijan, Belarus, Georgia, Moldova, Russia, Ukraine) makes the 1989–2019 slope −0.94 (SE 0.26, R² 0.27). The Baltic residuals then become: Latvia −0.29, Estonia −0.01, Lithuania +0.38. "Latvia met it, Estonia exceeded it" becomes "Latvia fell below it, Estonia met it".
  - **Size of the residuals:** In the full sample, the 95 per cent prediction interval for each Baltic state is about ±2.3 points. All three residuals (+0.05, +0.32, +0.75) are well inside it.
  - **Interwar Lithuania:** Its residual of −0.31 is half a residual s.d., which does not support "fell well below it" (05_baltic.tex:67).
  - **Sample composition:** Including the Caucasus but not Central Asia in "Europe" is arbitrary. The Cold War sample includes the USSR aggregate together with its three Baltic members (double counting). The periods also overlap with large war shocks, which the paper notes.
  - **Note error:** The Table 17 note lists Albania among the socialist economies in column (b), but Albania is not in the 1938–89 sample. N = 10 is correct only without it.
- **Suggestion:**
  - Report robust SEs and prediction intervals.
  - Show the regressions with and without microstates and CIS states, and with population weights.
  - Drop the USSR aggregate or the Baltic states from (b).
  - Express the Baltic results as rank or position statements with their uncertainty.
  - Remove the "exceeded/met the expectation" ranking from the conclusion (06_conclusion.tex:11) unless it survives these checks.
  - Correct the Table 17 note.
- **Location:** Table 17 (T15_beta.tex:13–30); Table A4; 05_baltic.tex:63, 67; 06_conclusion.tex:11.

### MC8. Causal and superlative claims stronger than a descriptive design supports
- **Dimension:** Identification (hedging of causal claims)
- **Issue:** The paper says itself that "the regressions are descriptive, not causal" (05_baltic.tex:67) and that growth accounting is impossible (05_baltic.tex:71). It nonetheless asserts the following:
  - **Regimes, not societies (01_intro.tex:15):** the failure to converge "therefore points to the regimes and the external environment rather than to the societies".
  - **Social capability (06_conclusion.tex:13):** "The Baltic states did not fail to converge for want of social capability". The paper itself argues that the institutional component of social capability was destroyed (05_baltic.tex:7).
  - **Mechanisms (05_baltic.tex:73):** "driven by the four automatic mechanisms at once", with no input data.
  - **Inherited lead (01_intro.tex:13; 05_baltic.tex:43):** the lead over the USSR "was inherited rather than created by Soviet investment". The paper's own footnote says Latvian investment *per head* exceeded the Soviet average for much of the period, including 1946–60.
  - **Living standards (05_baltic.tex:49):** "the claim that living standards stagnated under Soviet rule is unfounded". This is output per head, not living standards. The paper's own evidence on consumption lags and Riga living space (04_latvia.tex:15 fn.; 05_baltic.tex:49) points the other way.
  - **Demographic cost (06_conclusion.tex:11):** "a demographic cost without parallel in post-socialist Europe". This is unsupported. Estonia lost 15 per cent; Bosnia, Moldova and Bulgaria are comparable to or worse than Lithuania and Latvia.
- **Suggestion:** Rephrase each claim as "consistent with" or "suggests", or support it with evidence. Separate output per head from living standards explicitly. Either document the demographic superlative against comparator countries or drop it.
- **Location:** as listed.

### MC9. The headline framing is inconsistent with the paper's own numbers
- **Dimension:** Argument structure
- **Issue:**
  - **"None converged" (abstract):** "none of the three converged on Western Europe before 1990" and "catch-up came only after 1995". Yet:
    - Table 9 shows Lithuania outgrowing the Western core over 1938–89 (2.7 against 2.4);
    - 05_baltic.tex:67 says Lithuania "outgrew the Western core";
    - Table 10 shows Estonia and Lithuania slightly *higher* relative to the core in 1989 than in 1913 (52 against 51; 45 against 41);
    - 05_baltic.tex:71 describes "three episodes of catch-up", and 06_conclusion.tex:11 calls 1950–68 "two decades of genuine catch-up".
  - **"Only sustained convergence" (01_intro.tex:13):** the 1995–2007 episode is called "the only sustained convergence the region has known", but 1950–68 (18 years, 49 → 62 per cent of the core) also qualifies.
  - **"Richest" and "poorest" (abstract; 05_baltic.tex:75):** Latvia is "now the poorest" by 1.3 per cent in 2023 (17,603 against Estonia's 17,837, Table 11). In the Soviet years it was "the richest" by 1.5–5 per cent (1950: 3,722 against 3,667; 1968: 7,544 against 7,348). Estonia "overtook in 1989" by 2 per cent (8,958 against 8,772).
  - **Rankings against the error bands:** The paper's stated error bands are 4–14 per cent and up to about 25 per cent in early years. The claim that "no plausible combination of the biases ... would alter its ranking among the three Baltic economies in 1938 or 1989" (03_method.tex:85) holds only if the biases are common to all three series. That assumption is unstated and may be reasonable given shared methods and PPPs.
- **Suggestion:**
  - Restate the puzzle precisely: no *lasting* convergence, with relative position in 1989 roughly that of 1913.
  - Hedge rank statements that depend on gaps of 1–3 per cent.
  - Make the common-bias assumption explicit.
- **Location:** 00_abstract.tex:1; 01_intro.tex:13; 03_method.tex:85; 05_baltic.tex:17, 49, 75; 06_conclusion.tex:11.

### MC10. Comparator construction: a break in the USSR series, and mixed PPP vintages
- **Dimension:** Identification (PPP conversion, comparators)
- **Issue:**
  - **Break in the USSR series:** The USSR column in Table 11 is Maddison's level in 1913 and 1938 but rescaled to Bolotin from 1946 (factor ≈ 0.91; Table 10 note). Two consequences:
    - Table 11 implies USSR growth of 1.5 per cent a year in 1938–50 and 2.2 in 1938–89, while Table 9 reports 2.4 and 2.4.
    - Latvia's position relative to the USSR, 144 per cent in 1938 against 159 in 1968, is partly an artefact. On a consistent basis 1938 would be about 158, i.e. no gain over 1938–68. (Macros used: `\pctussr{1938}` = 144, `\pctussr{1913}` = 167.)
  - **Mixed PPP vintages:** Baltic levels are anchored on a 1935 price comparison and on 1990 Bolotin PPPs. All comparators are MPD 2011-ICP levels backcast and divided by 1.594. Relative levels in 1913 and 1938 (e.g. 59 per cent of the core) therefore mix PPP vintages. This is the well-known source of level drift in long-run comparisons (cf. Prados de la Escosura).
- **Suggestion:**
  - Rescale the USSR series consistently for all years, or show 1938 on both bases.
  - Discuss the PPP-vintage issue and give the relative levels for 1913 and 1938 under the MPD-native Latvian level as a bound.
- **Location:** Table 10 (T8_relative.tex:15, 30); Table 11 (T13_levels.tex:12–14, 29); Table 9 USSR column; 05_baltic.tex:43.

---

## Minor Concerns

- **mc1. Rendered-number mismatches in the text:**
  - 1962 contraction: A1 gives 5,668 → 5,466, i.e. −3.6 per cent; the text says 3.5 per cent (04_latvia.tex:19; 05_baltic.tex:45).
  - "Pre-war peak": primary output peaked in 1939 (102.5, Table A2), so "twenty-nine years after the pre-war peak" should be 28, or should say "after 1938" (05_baltic.tex:39).
- **mc2. Mis-ordered "respectively" list.** 05_baltic.tex:37 gives per-capita recovery years "1946, `\lvREGAINthirtyeight`(=1948) and 1948" for Latvia, Estonia and Lithuania. That reads as Latvia = 1946, which contradicts 04_latvia.tex:15 and Table A1 (Latvia 1948). The first two values appear to be swapped.
- **mc3. Redundant phrase.** "With a smaller population, income per head regained its 1938 level in 1948" (04_latvia.tex:15): GDP also regained it in 1948, so the "smaller population" phrase adds nothing.
- **mc4. Growth that did not stop.** "It stopped when the pre-war level was regained" (05_baltic.tex:25): Latvia regained its 1913 level in 1930, and growth continued at 3.1 per cent a year over 1929–38.
- **mc5. Branch count.** Table 2 says "129 physical product series in 11 branches" (T2_sources.tex:13). The text and Table 3 say ten of eleven, since petroleum refining is zero (03_method.tex:39).
- **mc6. Census list.** Table 2 lists the censuses of 1935, 1959, 1970, 1979 and 1989 (T2_sources.tex:21); the text adds 1920, 1925 and 1930 (03_method.tex:53).
- **mc7. Splice year stated three ways.**
  - Appendix text: the modern series supersedes "from 1991" (appendix.tex:22).
  - A2 note: "from 1992 (1991 being the average)" (A2_sectoral_a.tex note).
  - A1 note: WDI growth for "1992–2010", against "1990–2010" in 03_method.tex:61 and the Table 4 note.
- **mc8. France row of Table 13 is internally impossible** as printed: population −7, GDP −25, per capita −31 (T10_war.tex:14). A per-capita fall larger than the GDP fall requires population growth at the per-capita trough. Check the source year or the border treatment (Alsace-Lorraine).
- **mc9. Table 14 implausible cells.**
  - Greece c.1937 services at 20 per cent (54/26/20) looks implausible (T9_structure.tex:26).
  - The header says "Share of GDP" while the note says gross value-added.
  - The `\resizebox` shrinks the table below footnote size; consider landscape.
- **mc10. Table 6 "Bias" column.** Entries of −147 and +59 are labelled per cent "maximum error in the indicator". Explain the −147 (UK service productivity growth) or move it to the note; it reads as an error larger than 100 per cent.
- **mc11. Table 5, 1913 row.** The row is trivially identical to Norkus and Markevičiūtė ("2,361 (+0.0)"). Mark it as "taken from" rather than present it as a comparison.
- **mc12. Mixed interwar sources.** 1913–38 growth for Latvia combines Norkus–Markevičiūtė's indirect 1913 level with this paper's 1938. On their own series, 1913–38 growth would be 0.7 per cent a year rather than 1.1 (2,836/2,361, Table 5). The "interwar non-convergence" verdict (49 → 49 per cent of the core) is sensitive to this; say so.
- **mc13. Leftovers from the figure conversion** (see also Specific Comments):
  - Scatter-plot language in 05_baltic.tex:67: "lie close to the line", "Latvia lies on it and Estonia above it", "the fitted line lies below". Prefer residual language that refers to Table 17's residual column.
  - 05_baltic.tex:45: "Growth rates in all three economies turned down in the late 1960s and, after a respite in the early 1970s, fell until the end of the decade; convergence ... turned negative in Latvia and Estonia in 1968–9 ... Lithuania ... maintained a positive catch-up record until 1975 and briefly again in the early 1980s" describes a rolling-rate chart that no longer exists. No table supports it, and the annual Lithuanian and Estonian series are not in the paper.
  - I found no remaining "Figure" or "chart" references; the `\ref`s all point to tables.
- **mc14. Unnumbered headings with numbered cross-references.** Headings are unnumbered (`\titleformat{\section}{...}{}{0em}`), but cross-references render as "Section II" and "Section III" (pp. 23, 26, 44, 61). Readers cannot locate them. Number the headings or refer by title.
- **mc15. Clashing appendix labels.** The online-appendix sections A.1–A.7 (Table 2) clash with the printed Tables A1–A4. Rename one set, e.g. "online appendix §OA1".
- **mc16. Unverifiable superlative.** "Slower than any economy of the communist bloc for which a series exists" (01_intro.tex:13; 04_latvia.tex:21; 05_baltic.tex:45) cannot be checked from any table. Add 1968–89 growth by country to Table 9 or to an appendix table.
- **mc17. Uncited relevant literature.** Easterly & Fischer (1995) and Ofer (1987) are in `bibliography.bib` but uncited; both are central to the post-1970 Soviet slowdown. Quah (1993) / Friedman (1992) on the "Galton's fallacy" critique of β-regressions should be cited alongside Table 17. Prados de la Escosura (2000) should be cited on PPP vintages. Neither σ-convergence nor dispersion is reported.
- **mc18. Length.** About 16,000 words of body text, above the EEH/EHR norm. The literature survey in 05_baltic.tex:7 and the long historiographical passages in 02_gap.tex:11 can be cut substantially.
- **mc19. Build log out of date.** `main.log` and `build*.log` predate the current PDF (17:24 / 00:51 against 23:04). I could not check the latest build for overfull boxes or undefined references. The extracted text shows no "??".

---

## Referee Objections

1. **"How do you know the 1990 dollar level is right, rather than the overlap being a coincidence of offsetting errors?"**
   - *Why it matters:* Every relative-level claim (Tables 10–12) and every pre-1990 comparison rests on Bolotin's union-wide PPPs. Non-market services at 3.30 $/rouble make up almost half the dollar total.
   - *How to address:* Show the level under alternative service parities and weights (MC3). Give the overlap result for each. Present Lithuania, Latvia and Estonia jointly: if all three overlaps pass under the same parity, offsetting errors become much less likely.

2. **"Why prefer the series with the deeper 1992 fall while citing literature that says official data overstated it?"**
   - *Why it matters:* The transition trough, the Baltic ranking of contractions and the 1989-recovery dates all follow from this choice.
   - *How to address:* Correct 03_method.tex:67 and justify the choice independently of the outcome. Report the results under both splices (MC2).

3. **"Your convergence verdicts flip when Moldova, Georgia and Ukraine are dropped, and the interwar slope is zero without the microstates. What survives?"**
   - *Why it matters:* The conclusion's third and fourth findings are stated as regression results.
   - *How to address:* Run robustness checks with prediction intervals. Report the Baltic residuals as ranges. If the verdicts do not survive, reframe them in terms of growth relative to the core and periphery (Tables 9–10), which carry the argument well on their own (MC7).

4. **"Is the Latvia–Estonia ranking in the Soviet period, and today, measurable at all?"**
   - *Why it matters:* "Richest until 1988", "Estonia overtook in 1989" and "now the poorest" are headline claims resting on 1–5 per cent gaps between series built by the same team with the same PPPs.
   - *How to address:* State the common-bias argument explicitly. Show that Latvia-specific biases (garrison, military production, trade) would not reverse the ranking. Otherwise hedge (MC9).

5. **"Is the Soviet record here output or welfare?"**
   - *Why it matters:* The conclusion about living standards (05_baltic.tex:49) and the "inherited, not created" reading invite welfare interpretations the output series cannot bear. Military production is excluded, but the garrison is counted in public services, so the treatment of defence is asymmetric.
   - *How to address:* Separate output per head from consumption explicitly. Discuss the defence asymmetry (unrecorded military industry against an imputed garrison) and its likely sign for Latvia in particular (MC8).

---

## Specific Comments

### Abstract (00_abstract.tex:1)
- "None of the three converged ... before 1990" and "catch-up came only after 1995" conflict with Table 9 (Lithuania, 1938–89), Table 10, and the paper's own "three episodes of catch-up" (MC9).
- "Is now the poorest": the margin is 1.3 per cent in 2023. Hedge it.
- At 158 words the abstract is slightly over the 150-word target.

### Introduction (01_intro.tex)
- **:7** "About half that of Finland and three-fifths that of the Western periphery" in 1990 checks out against Tables 10–11 (Baltics 48, periphery 78).
- **:9** "Too high by between a sixth and a third" refers to the companion papers. For Latvia the figure is 24 per cent in 1990 but *below* in 1973–85 (Table 5). Say so here, since that is Latvia's distinctive finding.
- **:13** All macros check out (3.1, 49, 4.0, 62, 0.7, 159/136, 45, 8.5, 2010/2018, 112 → 86).
  - "The only sustained convergence the region has known": see MC9.
  - "The lead was inherited rather than created by Soviet investment": see MC8 and MC10.
  - "The belief that the Baltic states stood level with Finland before the war": in 1913 Latvia was 12 per cent *above* Finland. Specify "before the Second World War".
- **:15** "Therefore points to the regimes ... rather than to the societies" is unhedged (MC8).

### Data gap (02_gap.tex)
- **:7** Repetition within one sentence: "published estimates of national income, for the mid-1930s ... computed and published national income for the 1930s". Merge.
- **:9** Provenance of the MPD 1990 level; see MC6.
- **:11** "Two neighbouring countries, Sweden and Lithuania": Sweden is a neighbour only by sea. Write "two comparator countries".
  - The paragraph is a single 600-word sentence chain. Split it.

### Methods (03_method.tex)
- **:15** The sentence defining the indicator approach (Thomas–Feinstein / Fabricant) is hard to parse. Split it.
- **:19** "Between Lithuania's 7,475 and Estonia's 8,425" is fine. Add Bolotin's dollar total and population (MC1).
- **:21** Author-check box (MC1).
- **:25** The 47 against 34 per cent service share needs actual sensitivity results (MC3).
- **:39** "Ten of the eleven branches" conflicts with Table 2 (mc5).
- **:49** The wartime linkage borrowed from Lithuania should be flagged as reducing the independence of the overlap (MC5).
- **:53** The census list differs from Table 2 (mc6). The 24 per cent population fall (1939–45) checks against Table A1 (1,987.6 → 1,518.6).
- **:57** The 1919 figure 37 per cent below 1913 checks (1,481 / 2,361).
- **:65** The 0.1 pp/yr argument is arithmetically loose and ignores benchmark error (MC5). The 1940 average "moves the figure by less than half a per cent" checks (−0.35 per cent).
- **:67** "Records a shallower decline" is reversed relative to Table 4 (MC2).
- **:75** "Rising by 5 per cent in 1989 and again in 1990" is contradicted by Table 5 (+0.9 per cent in 1990) (MC6).
- **:83** "Taken as a bound on its magnitude rather than ... its direction" conflicts with the one-sided −14 in Table 6 (MC5).
- **:85** The interwar margins (4 and 8 per cent) and the "about one point a year" arithmetic check. The ranking-robustness claim needs the common-bias assumption stated (MC9).

### Latvia (04_latvia.tex)
- **:13** The −28 per cent income per head and two-fifths output fall (1938–44) check against Table A1.
- **:15** mc3. Exceeding 1938 "by a fifth by 1950" checks (3,722 / 3,099).
- **:17** Primary output regained in 1967, after crops (1961) and livestock (1966). This happens because crops fell back in 1962. Explain that "regained" means first attained, or use "regained durably".
- **:19** 3.5 should read 3.6 per cent (mc1). Heavy industry at 11.9 per cent (1948–69) cannot be checked from the tables: Tables 7 and A2 start their branch columns in 1938 and do not report 1948.
- **:21** "Slower than any recorded for the communist bloc" (mc16). The peak in 1986 and −2.4 per cent a year to 1989 check (9,438 → 8,772).
- **:23** "Industry by about two-thirds in three years": Table A2 gives −52 per cent for 1989–92 (762.6 → 365.7) and −70 per cent for 1990–93 (693.6 → 211.4). The claim fits only the 1990–93 window, while the sentence is framed from 1989. Name the years. Also note that these are Soviet-period indices, which the final series replaces after 1991.

### Baltic comparison (05_baltic.tex)
- **:7** Four tables in succession (Tables 9–12) before any discussion. Consider merging Tables 10 and 12, or moving Table 12 to the appendix.
- **:17** The "eighteen percentage points" (49 → 67) and the Nordic figures (81 → 52) check.
- **:25** "It stopped when the pre-war level was regained" (mc4).
- **:27** Faulty parallelism: "reflecting heavily subsidised agriculture ... and of the contraction of financial and public services". Delete "of".
- **:31** Author-check box (MC1).
- **:33** "They had been close in 1913, Latvia at 112 per cent": "close" understates a 12 per cent lead. Write "above Finland".
- **:37** The "respectively" list is mis-ordered (mc2).
- **:39** "Twenty-nine years after the pre-war peak" (mc1).
- **:43** The 144 → 159 → 136 USSR comparison is affected by the comparator break (MC10). The investment footnote undercuts "inherited rather than created" (MC8).
- **:45** Leftover description of a rolling-growth chart with no supporting table (mc13). 3.5 should read 3.6 per cent (mc1).
- **:47** "Did not fall in that decade" holds for 1979–89 (8,737 → 8,772) but not for 1980–89 (8,867 → 8,772). Keep the 1979 start explicit.
- **:49** "The claim that living standards stagnated under Soviet rule is unfounded" (MC8). Greece overtaking all three by 1989 checks (10,111 against at most 8,958, Table A4).
- **:53** "Well below the Maddison Project's for Lithuania" is ambiguous; write "a shallower fall than". The ranking depends on the splice (MC2).
- **:59** "Fell by 17 per cent between 2007 and 2010, 12.8 per cent of it in 2009 alone" should read "12.8 per cent in 2009 alone". Both numbers check (13,312 → 11,067; 13,015 → 11,345). "About three-quarters of the EU average against about 90 per cent in 1938" is not in any table; add the source or a table row.
- **:63** "Whose end-points are the peak years of pre-war capitalism, interwar capitalism, state socialism and modern capitalism" lists four end-points for three periods. That is correct but confusing; rephrase.
- **:67** Visual "line" language (mc13). "Lithuania fell well below it" overstates a −0.31 residual (MC7). "Latvia furthest": among the Baltic three, yes; Poland (−0.96) and Hungary (−0.87) fell further. Say "furthest of the three".
- **:73** "Driven by the four automatic mechanisms at once" is unhedged (MC8). The final sentence is properly hedged; extend that tone throughout.
- **:75** "Poorest in 2024": Table 11 ends in 2023. Use 2023 or add 2024 for all three.

### Conclusion (06_conclusion.tex)
- **:7** "A quarter too high" checks (+24.5 per cent). "Within 2 per cent in three of the four" checks.
- **:9** "Lost a quarter of its population" checks (Table 13: −23; text −24).
- **:11** The third and fourth conclusions overlap and both rest on non-robust residuals (MC7). "Demographic cost without parallel" is unsupported (MC8).
- **:13** "Did not fail to converge for want of social capability" is unhedged (MC8). The research agenda at the end is good.

### Tables
- **Table 1:** author check; the per-capita dollar figure cannot be reproduced; state the population.
- **Table 2:** branch count; census list.
- **Table 4:** the grades and differences all check.
- **Table 6:** sign of the fixed-weight bias; the −147 entry.
- **Table 7 (T6):** all spot-checked rates match Table 8 / A2 within rounding.
- **Table 8 (T16):** "Other services" and science are in neither the market nor the public group. Say so in the note.
- **Tables 9–11:** all spot-checked rates and ratios recompute.
- **Table 9:** the USSR column is unscaled Maddison while Table 11 is rescaled from 1946 (MC10).
- **Table 13:** France row (mc8).
- **Table 14:** author check; Greece; header.
- **Table 16:** the alternative estimates use this paper's 1989–90/91 ratios; say so in the text.
- **Table 17:** Albania in the note; add robustness (MC7).
- **Table A1:** the 1940 and 1991 averages check (2,996; 7,295).
- **Table A3:** the 1989–90 transport break; no science column (MC4).
- **Table A4:** consistent with Table 17.

---

## Summary Statistics

| Dimension | Rating (1–5) | Comment |
|---|---|---|
| Argument structure | 3 | Clear arc, but the headline "no convergence before 1990" conflicts with the paper's own catch-up episodes; rankings over-stated |
| Identification / methodology | 3 | Strong overlap design and sourcing; undocumented industry uplift, splice contradiction, untested service weighting and parity, overlap power overstated |
| Econometric specification | 2 | Regressions reproduce, but two slopes are insignificant, results are sample-sensitive, residual verdicts are within noise, and the note has an error |
| Literature positioning | 4 | Broad and current, especially Baltic and Soviet historiography; misses Easterly–Fischer, Ofer (in bib, uncited), Quah on β, and the PPP-vintage literature |
| Writing quality | 4 | Elegant, but very long sentences and paragraphs; a few grammar slips; about 16k words |
| Presentation | 2 | Author-check boxes printed; unnumbered headings with "Section II" references; figure-conversion leftovers; several note and table inconsistencies |
| **Overall** | **3** | **Revise & Resubmit.** A valuable new series whose defence and comparative interpretation need tightening |
