# Substance Review, round 3 (final draft): "New GDP series for interwar and Soviet Estonia"

**Date:** 2026-10-16 | **Reviewer:** domain-reviewer agent (read-only; saved by the orchestrator) | **Status:** APPLIED 2026-10-16 — all items except M2 and M6 (author input needed), m12 (Harrison 3.8 per cent unverifiable here), m14 (1990 branch-weight source not documented in the dissertation text), m17 (border basis of the 1937–40 yearbook figures unverifiable here)
**Overall:** 1 critical, 8 major, 14 minor. Nothing overturns the findings; the critical item is a table-vs-appendix inconsistency, the majors are logical gaps in the two rewritten arguments (overlap test; Western-periphery yardstick) and two claims that contradict Table 5.

**Orchestrator verification:** C1 confirmed by recomputation (8,425 × GDP index / index 1990 × population ratio): 1991 reproduces (7,504 vs 7,506 in Table 3) but 1992–5 give 5,314 / 4,733 / 4,799 / 4,658 against 5,400 / 4,916 / 4,973 / 4,989 in the table, i.e. implied differences of −14.2 / −24.0 / −22.9 / −34.8 per cent rather than −12.4 / −19.4 / −18.6 / −25.8. M1 confirmed from Table 5 (1919–29 2.8 vs 1929–38 2.7 per cent a year); the wording was introduced by proofreading item 9 and must be reverted.

## 1. Referee-point coverage

| Pt | Where | Grade | Still missing |
|---|---|---|---|
| 1 Single 1990 benchmark / Gerschenkron | 02:31; 04:13, 19–21 | STRONG | Add one sentence tying panel (b) to panel (a): Bolotin's level is 3 % *above* the independent 2011-based estimate, so the 1937–40 agreement cannot be a low level offsetting understated growth (M3). |
| 2 Overlaps; rouble→USD | 04:9–15, T3; 02:27 | ADEQUATE | T3 panel (b) 1992–5 levels do not reproduce (C1); the WB-vs-MPD growth choice for 1990–2010, on which the Bolotin validation rests, is asserted not justified (M2). |
| 3 Bolotin quality; Ponomarenko | 02:15, 27–29 | ADEQUATE | Why rouble value-added shares including turnover taxes/subsidies are acceptable weights when the CIA used adjusted factor cost (M6); "first year … SNA definition" needs checking (m9). |
| 4 USSR comparison; collectivisation; Finland | 05:27, 31, T8; §VI | STRONG | — |
| 5 Archival sources; classified; Nazi period | 02:35, 51, T2 | STRONG | — |
| 6 Fixed VA ratios | 04:25–27, T7, 37 | ADEQUATE | Combined-bias arithmetic at 04:37 wrong: 0.86 × 0.90 = 0.77, "nearly a quarter" not "about a fifth" (m1). |
| 8 Sectoral irregularities | 05:33 | ADEQUATE | Textile drop of 13 % over 1972–5 (A2: 944 → 816, regained 1986) unmentioned (m10); housing sentence still implies causation from completions (m11). |
| 9 Zhuravskaya | main:141; 02:15 | STRONG | — |
| 10 Official statistics | 02:17 | STRONG | — |
| 11 CIA debate | 02:15 | ADEQUATE | Verify "3.8 per cent" Khanin/CIA coincidence against Harrison 1993 p. 159 (m12); Rosefielde still open. |

Western-periphery figures in §VI/§VII confirmed against the CSV: Finland 1968–89 3.58, core 2.40, Nordics 2.52, periphery 3.04, Estonia 0.95; shortfall 1.5 / 2.1 / 2.6 pp. Spain 3.68 and Portugal 3.67 "grew as fast as Finland"; Greece 3.16 did not (m5).

## 2. Substantive losses from the trim / proofread

- **M1** `03_results.tex:13` "The 1930s were the fastest phase of interwar growth" contradicts T5 (1919–29 2.8 vs 1929–38 2.7) and T6. Replace: "The recovery after 1933 was the fastest phase of interwar growth: income per head rose by more than 4 per cent a year between 1933 and 1938, with construction growing by \sgr{Construction}{1929}{1938} per cent a year over 1929--38 as a whole, industry by … and housing by …".
- **M4** `07_conclusion.tex:9` "faster than in Finland or Western Europe" — T5 gives the Western periphery 5.2. Replace "Western Europe" with "the Western core". `main.tex:139` should add ", though not than the Western periphery".
- m2 Composition of "Western core" and "ECE" appears nowhere in the paper; add country lists to the T5 note.
- No referee answer weakened by the trim; no number lost its source.

## 3. Internal consistency

- **C1** `T3_overlaps.tex` panel (b) and `04_limitations.tex:15` ("12 per cent in 1992 and 26 per cent by 1995"): Soviet-period levels for 1992–5 do not reproduce from A1–A2 (see verification above). The percentage-difference CSV is an earlier vintage of the 1992–5 indices. Fix: compute panel (b) directly from the appendix index and population (the modern series for 1992–5 is the final series), update the prose percentages.
- **M5** `06_finland.tex:13` and `07_conclusion.tex:11`: the cost of the system is comparator-dependent. Against the periphery Estonia's shortfall was already 1.3 pp a year in 1950–68 (3.9 vs 5.2) and 2.1 pp in 1968–89; only against the core is 1950–68 a period of no shortfall. Proposed: "Measured against the core, the cost is confined to 1968--89; measured against the periphery it was already 1.3 points a year in 1950--68 and widened to 2.1 thereafter. On either yardstick it is concentrated in, though not confined to, the last two decades, and on either it is smaller than the Finnish comparison implies." Conclusion: "locates most of them in".
- m3 `05:17` literacy "second only to Latvia's in the European periphery" — T11 has Ireland 97.5 and Czechoslovakia 96.0. Replace with "higher than in any country of eastern or southern Europe except Latvia and Czechoslovakia, and above Finland's".
- m4 `03:17` "only textiles, other light industry, livestock, transport and trade continued to grow" — finance, health and education also rose; qualify "among the material sectors".
- m5 `06:13` "its Iberian and Greek members … grew as fast as Finland, while Ireland grew more slowly" → "its Iberian members grew as fast as Finland, Greece and Ireland somewhat more slowly".
- m6 `03:21` "between a quarter and a third below" — T4 1980 = −33.6; "by a quarter to a third".
- m7 `07:9` "back … to the share" — 68 vs 70; "close to the share".
- m8 `05:33` housing "2 per cent a year since the 1950s" — A2 gives 2.6; "between 2 and 3".
- All other quoted numbers verified (list in agent output: Finland ratios, Western-core and USSR ratios, log gaps, Sweden 54.8 %, Valge, N&M, 1924 movements, 1938–50 decomposition, livestock, primary ranges, crop falls, trough, regain year, 1995–2022, T3 panel (a), T4 differences, Bolotin USSR 6,275).

## 4. Source fidelity and method

- **M2** `04:15`, `02:59`: "growth rates … chained to its NMP-based late-Soviet level" is not a justification for rejecting the MPD's 1990–2010 path, yet the Bolotin validation depends on it. Add: source of the MPD's 1990–2010 Estonian growth and why WB national-accounts rates are preferred; the 1990 level the unmodified MPD path gives and where the 32 % gap arises; the MPD 2023 value for 2011 that was backcast.
- **M3** `04:13`: add after "which is not observed": "Nor can the agreement be the product of a low benchmark offsetting understated growth: the 1990 level is, if anything, 3 per cent above the independent 2011-based estimate (Table 3, panel b), which would push the backcast levels up, not down." Optionally: a late base understates growth most in 1950–68, so early weights would sharpen the 1950–68/1968–89 contrast.
- **M6** `02:27`, T1 note, T7 "−0.5": 1990 rouble prices were administered with turnover tax on light industry/food and subsidies on agriculture; Bergson's adjusted-factor-cost standard (which the paper cites as its model) removes this. Give the derivation of −0.5 or widen it and say why factor-cost weights were not used.
- m9 `02:27` "first year … SNA definition" → "one of the first years for which republican GNP on an SNA-type definition was compiled, and the first with purchasing-power parities".
- m12 verify 3.8 % Khanin/CIA (Harrison 1993 p. 159).
- m13 `04:19` fn: Gerschenkron 1957 is the JASA discussion; the machinery study is Gerschenkron 1951 (RAND) — rephrase "showed".
- m14 `02:41`, T2: state where the eleven 1990 branch weights come from (Bolotin has one industry figure).
- m15 `02:59`: state that series either side of 1940 and 1991 keep their own levels (averaging shifts only the splice year).
- m16 `02:25`: acknowledge the 1938 PPP is consumer-price only (no investment/government prices).
- m17 ESSR yearbooks report 1937–40 within post-war borders while the interwar series is in republic borders; mention in 04:13.
- m18 `02:15` NMP is net by construction; double counting is in gross output: "and its gross-output measures double-counted intermediate transactions".
- m19 `02:29` a republic-price benchmark would alter the level and, through the sectoral shares, the weights, not the volume indices.
- m1 `04:37` "about a fifth" → "nearly a quarter"; state the rule behind the 6 % interwar margin.

## 5. Causal claims and hedging

- "counterfactual" appears only describing the White Book. Compliant.
- **M7** `06:13` "because it isolates the effect of institutions on two economies with similar endowments of human capital" contradicts the paper's own argument that resources and markets differed. Replace: "because the two economies had similar endowments of human capital, though not of natural resources or markets, so that part of their divergence can be read as institutional."
- M5 (above) also needs hedging: "a more defensible yardstick for that cost is …".
- m20 `05:27` "The cost was a lost decade" → "The cost of war and collectivisation together".
- m21 `05:15` "The timing follows the exchange rate" → "The timing is consistent with the exchange-rate explanation".
- m22 `06:9`, `main:139`: the 1919 parity rests on Finland's civil-war trough; add "Finland the more severely in 1918".

## 6. Verdict

Ready for the co-author once (1) C1 is fixed and the 04:15 percentages updated; (2) M2 + M3 make the overlap argument airtight; (3) M1 + M4 + M5 + M7 align the narrative with Table 5. M6 (factor-cost weights) before submission, since referee point 1 will return to weighting.
