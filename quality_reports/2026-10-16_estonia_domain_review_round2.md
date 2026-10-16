# Substance Review (round 2): Estonia GDP paper — "New GDP series for interwar and Soviet Estonia"
**Date:** 2026-10-16  **Reviewer:** domain-reviewer agent (read-only; saved by the orchestrator)
**Files:** `Paper/estonia/main.tex`, `Paper/estonia/sections/02_method.tex … appendix.tex`, `Tables/estonia/*.tex`, `Tables/estonia/numbers.tex`

**Overall:** MAJOR ISSUES (2 critical, 9 major, 14 minor). Not re-reported: the three "Open for the authors" items and the round-1 fixes in the session log.

---

## 1. Referee-point coverage

| Pt | Where answered | Grade | What is missing (if not STRONG) |
|---|---|---|---|
| 1 Single 1990 benchmark / Gerschenkron | §IV.2 (04_limitations.tex:17-21); §II.2 last para (02_method.tex:31); overlap §IV.1 | ADEQUATE | §IV.1:13 says fixed-VA-weight and late-base-year errors "would cancel" because the latter is an "overstatement", but §IV.2:19 (correctly) says late weights *understate* growth — the two biases push the 1940 level the same way, so the overlap is a stronger test than the paper claims, and the paper currently contradicts itself. The "upper bound" (§IV.2:21) is asserted from the CIA 1970→1982 rebasing, not derived. |
| 2 Overlaps 1937-40, 1990-95; rouble→USD | §IV.1 (04:9-15), T3, §II.5 | ADEQUATE | Price basis of the 1990 *weights* not stated: Table 1 shows rouble shares; at Bolotin's sectoral PPPs the dollar shares would be very different. One sentence resolves it. |
| 3 Bolotin's quality; Ponomarenko; prior Soviet accounts | §II.1 (02:15), §II.2 "Three features" (02:29) | ADEQUATE | Missing: what Bolotin's parities rest on and why a Union-wide PPP is acceptable for the highest-income republic. |
| 4 USSR comparison; collectivisation; Finland as comparator | §V.2 (05:27-31), T8, §VI | STRONG | — (but see Critical 3.1). |
| 5 Archival sources; classified output; Nazi-period data | §II.3 (02:35, 02:51), T2 | STRONG | Minor 3.9. |
| 6 Constant VA/output ratios | §IV.3 (04:25-27), T7 | WEAK | Sign given three ways (§IV.1 "understatement", §IV.3 "uncertain", T7 "−14"); 14 per cent bound not derived; "up to 14 per cent" (04:37) inconsistent with T7 where two same-signed entries exceed 14. |
| 8 Sectoral irregularities | §V.2 last para (05:33) | ADEQUATE | Housing explanation internally inconsistent: a stock index cannot fall while 5,200+ dwellings a year are completed; the decline is an artefact of the proxy. |
| 9 Zhuravskaya et al. 2024 | Intro, §II.1 | STRONG | — |
| 10 Official Soviet statistics caveat | §II.1 (02:17) | STRONG | Author asked for Vonyó 2017 (`vonyo2017`) alongside Maddison 1998; only `vonyoinmorys2021` is cited. |
| 11 CIA methodology debate | §II.1 (02:15) | ADEQUATE | Rosefielde and the 1990-91 JEC/AEI reassessment should be named, even in a footnote. |

## 2. Internal consistency

- **CRITICAL 2.1** `03_results.tex:21`: 1924 "sectoral indices move by between −1 and +4 per cent" contradicts A2 (construction 61.7→18.4, forestry +16%, commerce −5%). The −1% GDP change is driven by the construction swing; the 1923 construction value looks like a data error in domestic cement use.
- **MAJOR 2.2** Territorial basis: `02_method.tex:55` (interwar = republic borders; later = present-day) vs `appendix.tex:9` and A1 note ("all series within present-day borders").
- **MAJOR 2.3** `05_implications.tex:27`: population fall 1939–45 attributed wholly to war, deportation and flight, although §II.4 says ≈6% was transferred to the RSFSR in 1944–5.
- **MAJOR 2.4** `02_method.tex:59`: 1919 "linked backwards to the 1913 benchmark … by their estimate of the change between the two years" — Norkus & Markevičiūtė have no 1919 estimate; the 1913 level is theirs directly.
- MINOR 2.5 main.tex:163 "4.4 per cent" vs 03:21 "about 4.5" for 1950–78. 2.6 "throughout 1960–90" vs T4 1990 = −23.5. 2.7 sovnarkhoz "output double in seven years" vs own index +80% 1957–64. 2.8 "matches the CIA's finding … 6.3 per cent" vs new series ≈3.8% 1961–9. 2.9 "crop output … never grew again" (fluctuates). 2.10 "recovery after 1933 among the fastest in Europe" not shown in a table. 2.11 Estonian share "from more than 90" in 1950 (was ≈97% in 1945, well below 90 by 1950). 2.12 T4 uses `mpd2020` while comparators use `mpd2023`.

## 3. Source fidelity and method

- **CRITICAL 3.1** `06_finland.tex:13` and `07_conclusion.tex:11`: "the Western periphery of 1950–89, Ireland, Greece, Portugal, did not grow as Finland did" — from `Datasheets/GDPpc 1990usd.csv`, Greece, Portugal and Spain outgrew Finland over 1950–89 (4.2–4.4 vs 3.6 % p.a.); the periphery aggregate grew 5.1 % p.a. in 1950–68 (faster than Estonia's 3.9) and 3.0 in 1968–89. Only Ireland fits. Defensible: Finland's 1968–89 growth was exceptional relative to the Western core (2.4) and Nordics (2.5); the shortfall against core/periphery is 1.5–2.1 pp a year rather than 2.7.
- **MAJOR 3.2** Sign of the Gerschenkron effect stated inconsistently (04:13 vs 04:19).
- **MAJOR 3.3** "Upper bound" from the CIA 1970→1982 rebasing is asserted, not derived (04:21).
- **MAJOR 3.4** Price basis of the 1990 weights (rouble vs dollar shares) not stated (02:27).
- **MAJOR 3.5** Fixed-VA bias: sign and derivation of the 14 per cent (04:27, 04:37, T7).
- **MAJOR 3.6** KPV growth-rate explanation (03:21) uses wrong index-number logic (a weighted geometric mean does not favour fast growers); real reasons are coverage (non-material sphere omitted) and NMP weights.
- **MAJOR 3.7** Plausibility of 1938–50 (2.6 % p.a.; 1950 at 86 % of Finland) not addressed; part of the answer is population −8.5 %, industry ×1.8, and the 1990 anchoring.
- **MAJOR 3.8** Housing decline after 1986 is an artefact of the construction-and-population proxy (05:33).
- MINOR 3.9 T2 transport "assumed to move with GDP" vs 02:51 "interpolated". 3.10 A2 finance 1944 = 9.0, administration 1944→45 93→173. 3.11 "first year for which Soviet statisticians produced accounts on the SNA definition" → republican accounts. 3.12 rouble service share vs "Bolotin's high dollar ratio" conflated. 3.13 Finnish literacy 84.1 definition. 3.14 Valge's 502 per head does not reproduce from 548.1 m / 1.1325 m.

## 4. Causal claims and hedging

- **MAJOR 4.1** `06_finland.tex:13` uses "counterfactual" and "an Estonia that had escaped occupation".
- MINOR 4.2–4.6: 06:9 "It was a difference of resources and markets"; 06:13 "therefore overstates"; 05:17 "and no faster"; 05:31 "earned rather than transferred"; 03:13 1913–19 fall rests on two different benchmarks.

## 5. EHR fit

Confirm the current EHR word limit; the annual appendix tables belong in online supplementary material; consider `short` footnote option of biblatex-chicago; separate *Notes:* and *Sources:* in T3, T5, T6, T7; T5 label "1995--22" → "1995--2022"; abstract's last line may need softening after 3.1.

## Priority order
1. CRITICAL 3.1; 2. CRITICAL 2.1; 3. MAJOR 3.2/3.3/3.5; 4. MAJOR 3.4; 5. MAJOR 2.2/2.3/2.4; 6. MAJOR 3.6/3.7/3.8; 7. MAJOR 4.1; 8. minors, add `vonyo2017`, Rosefielde/JEC 1990.
