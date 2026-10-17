# Proofreading report: Estonia paper, trimmed draft (12,020 body words)

**Date:** 2026-10-16 | **Agent:** proofreader (read-only) | **Status:** APPLIED 2026-10-16 — all items except 7, 19, 20, 27 (author decision); T2 keeps no "Notes:" label because its note is sources only

**Clean checks:** all 21 `\ref` targets resolve; all 110 citation keys resolve; no double spaces or double full stops; no single-hyphen year ranges; no raw `Int$`; British spelling throughout; every `\autocite` footnote ends with a full stop; acronyms (MPD, NMP, UNECE, ESSR, SNA, ICP) defined once at first body use; hyphenation consistent; all count phrases match their enumerations except item 14; abstract, introduction and conclusion figures agree with the body and `numbers.tex`.

## Trim damage and grammar (apply first)

| # | File | Current | Proposed | Cat. |
|---|---|---|---|---|
| 9 | 03_results.tex:13 | "The second half of the decade was the fastest phase of interwar growth: with construction growing by … over 1929--38" | "The 1930s were the fastest phase of interwar growth: …" (evidence cited is 1929–38) | trim-damage |
| 14 | 05_implications.tex:33 | "Two further irregularities … Construction …, and crop output …; and the housing index …" (three items) | "Three further irregularities …" with the three clauses separated by semicolons | trim-damage |
| 3 | main.tex:157 | "Three attempts have been made to fill the gap" followed by four estimates | "Three long series have been attempted, besides the benchmark approximations of Norkus and Markevičiūtė" | trim-damage (low) |
| 2 | main.tex:135 | "… estimate for 2005 published by the UN Economic Commission for Europe (UNECE), whose derivation is undocumented" ("whose" attaches to UNECE) | "… estimate for 2005, of undocumented derivation, published by the UN Economic Commission for Europe (UNECE)" | grammar |
| 5 | 02_method.tex:35 | "summarises the indicator and sources" | "summarises the indicators and sources" | grammar |
| 6 | 02_method.tex:45 | "communications combine postal and telegraph traffic" | "the communications index combines …" | grammar (low) |
| 13 | 04_limitations.tex:13 | "Broadberry and Burhop regard … and judged" | "regarded … and judged" | grammar (low) |
| 15 | 05_implications.tex:33 | "stops growing in 1986 as completions fell" | "stopped growing in 1986 as completions fell" | grammar |
| 16 | 05_implications.tex:39 | "which contracted at \sgr{Industrytotal}{1989}{1991} and \sgr{Construction}{1989}{1991} per cent a year" (macros are negative: −9.1, −9.9) | "which were already shrinking at … per cent a year before the rouble was abandoned" | grammar |
| 10 | 03_results.tex:15 | "and the agricultural sector as a whole not until \sregain{Primarysectortotal}" (1959, earlier than livestock's 1960) | "and the agricultural sector as a whole only in \sregain{Primarysectortotal}" | grammar/style (low) |
| 18 | 05_implications.tex:17 | "its Baltic neighbours, Finland and the Soviet Union, whose figures for the period are contested" | "… the Soviet Union (whose figures for the period are contested)" | grammar (low) |

## Consistency and style

| # | File | Current | Proposed | Cat. |
|---|---|---|---|---|
| 1 | main.tex:139, 151 | "Western European core" | "Western core", defined once at first body use | consistency |
| 4 | main.tex:163 | "Its growth rate for 1950--78, 4.4 per cent a year" | "Its growth rate of income per head for 1950--78, …" | consistency (low) |
| 12 | 04_limitations.tex:31 | "the bounds for the occupation period" | "the bounds for the Soviet period" | consistency |
| 11 | 03_results.tex:15 | "two things account for most of it" | "… most of the difference" | style (low) |
| 17 | 05_implications.tex:15 | "and short, and the recovery after 1933" | "and short; the recovery after 1933" | style (low) |
| 21 | 06_finland.tex:13 | "a yardstick for what Estonia lost. … But it is not a measure of what Estonia lost." | "a yardstick. … But it is not a measure of what Estonia lost." | style (low) |
| 22 | appendix.tex:9 | "sections A.1--A.6 referred to in Table~\ref{tab:sources}" (T11 cites A.7) | "sections A.1--A.7 referred to in Tables~\ref{tab:sources} and~\ref{tab:structure}" | consistency |
| 23 | 02_method.tex:55, appendix.tex:9 | three different border phrasings | "the series to 1944 refer to the borders of the republic and the series from 1945 to present-day borders" in both | consistency (low) |
| 19 | 05_implications.tex:27, 31 | "137--145 per cent", "60--65 per cent" | Oxford compression ("137--45", "60--5") or leave all numeric ranges uncompressed consistently | style (low) |

## Citations

| # | File | Current | Proposed | Cat. |
|---|---|---|---|---|
| 7 | 02_method.tex:55 | population sources sentence has no footnote | add `\autocite{deportations_ee}; \autocite{case_estonia}` or point to online appendix A.3 | citation (low) |
| 8 | 02_method.tex:25 fn | "follows the procedure of \autocite{klimantas2019} and \autocite{norkuslatvia1935}" | "follows the procedure of the Lithuanian and Latvian studies (\autocite{klimantas2019}; \autocite{norkuslatvia1935})" | citation (low) |
| 20 | 05_implications.tex:15 fn | key `RefWorks:doc:5ea847d2e4b0aa025739fe41` (Eichengreen & Sachs 1985) | rename key to `eichengreensachs1985` in bib and text | housekeeping |
| 27 | T2_sources.tex:11, 25 | "World Bank (1996)" / "World Bank (1993, 1996)" as plain text | use `\cite` keys (1996 World Bank agriculture entry not yet in the bib) or spell out | citation |

## Tables (fix in scripts/R/tables.R)

| # | Table | Current | Proposed | Cat. |
|---|---|---|---|---|
| 24 | all except T5 | explanatory notes run on after "Sources:" | add "\textit{Notes:}" before explanatory sentences in T1, T3, T4, T6–T11, A1, A2 | consistency |
| 25 | T2, T7 | "1941--44", "1943--45", "1941--45" | "1941--4", "1943--5", "1941--5" (prose style) | consistency |
| 26 | T9, A2 captions | "1913--1938", "1919--1995" | "1913--38", "1919--95" | consistency (low) |
| 28 | T2:14 | "(ERA)" before the abbreviation is introduced | "(Estonian National Archives)" in the cell, or introduce ERA in §II | consistency (low) |
| 29 | T1 | "---" for 1990 taxes means "included in sectoral values", but the standard "---: not available" note is used elsewhere | add "`---': included in sectoral values" to T1 note | style (low) |
| 30 | all | table notes use `\cite` not `\autocite` | correct for biblatex-chicago in floats; no change | — |
