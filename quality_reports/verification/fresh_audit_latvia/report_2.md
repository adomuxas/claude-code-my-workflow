# Fresh citation audit, Latvia paper: batch 2

(Saved by the orchestrator from the agent's final message; the agent could not write the file.)

54 instances, 23 keys. All works in the project; no dissertation fallback needed.

## Source location per key
| key | where found (offset) | bib check |
|---|---|---|
| aizsilnieks_1974_sovietization | newsources `aizsilnieks_1974_sovietization_consumers_cooperation` (40–50) | BIB OK |
| aslund_myth | newsources `aslund_2001_myth_output_collapse` (printed = pdf − 5) | BIB MINOR: Carnegie Endowment Working Paper No. 18, entered as @article with series as journal, no number |
| balticstates1938 | `$SP/pdftext/balticstates1938` (printed = pdf − 4) | BIB OK |
| berendregions2020 | newsources `berend_2020_…_ch_long_historical_roads` (18–55) | BIB OK |
| bs_livingstandards1976 | newsources `koropeckyj_1976_national_income_baltic` (JBS 7(1): 61–73) | BIB OK |
| east_industry_periphery1871 | newsources excerpt has pp. 63–69 only; full book `Papers/Important papers…/1,3,4 GE O'Rourke, Williamson 2017 The Spread of Modern Industry to the Periphery since 1871.pdf` (printed = pdf − 19; p. 86 = pdf 105 inferred) | **BIB WRONG**: editors "O'Rourke, K. H. and Gale, J." → O'Rourke, K. H. and Williamson, J. G.; book title in `series`, not `booktitle` |
| feest2014 | newsources `Feest 2014 The collectivization of agriculture…` (79–109) | BIB OK |
| hazans_2013_emigration | newsources `hazans_2013_emigration_latvia_recent_…` (65–110) | BIB OK |
| karnups_2017_neatkarigas | newsources `karnups_2017_neatkarigas_valsts_…` (102–133) | BIB OK |
| klimantas2025thesis | `$SP/thesis_pages` (printed = pdf − 18) + dissertation .tex | BIB OK |
| krumins_2017_gorbacova | newsources `krumins_2017_gorbacova_reformu_laiks_…` (313–356) | BIB OK |
| krumins_2017_laika_lidz | newsources `krumins_2017_laika_posma_raksturojums_lidz_1940_…` (13–26) | BIB OK |
| krumins_2017_sovetizacijas | newsources `krumins_2017_latvijas_tautsaimnieciba_sovetizacijas_…` (229–257) | BIB OK |
| norkus_restorations | `$SP/pdftext/norkus_restorations` (printed = pdf − 9) | BIB OK |
| norkuslatvia1935 | `$SP/pdftext/norkuslatvia1935` (printed = pdf + 250) | BIB OK |
| raun_2017_literacy | newsources `raun_2017_literacy_russian_empire` (65–77) | BIB OK |
| roseswolf2010 | newsources `roses_wolf_2010_aggregate_growth_…` (181–207) | BIB OK |
| silins_2017_metalapstrade | newsources `silins_2017_metalapstrade_masinbuve_…` (925–942) | BIB OK |
| starkeviciute_2013_augimas | newsources `starkeviciute_2013_augimas_…_ch_naujosios_europos_sajungos` (81–105) | BIB OK |
| vanselm_1997_economics | newsources `van Selm 1997 The Soviet Union, 1922-91…` (ch. 3) | BIB OK |
| vaskela_1996_land | newsources `vaskela_1996_land_reform_lithuania` (116–132) | BIB OK |
| vaskela_2013_lietuvos | newsources `vaskela_2013_lietuvos_ukio_raidos` (109–124) | BIB OK |
| vonyoinmorys2021 | newsources `vonyo_markevich_2021_economic_growth_structural_in_morys_…` (277–302) — the lead in `latvia_key_sources.tsv` pointed to the next chapter | BIB OK |

## Grades
| id | file:line | key [post] | grade | quote or problem | suggested fix |
|---|---|---|---|---|---|
| 1 | main.tex:126 | klimantas2025thesis | SUPPORTED | "uninterrupted annual datasets, extending from 1913/1919 to 2024" | — |
| 13 | 01_intro:8 | norkuslatvia1935 | SUPPORTED | p. 251: "directly estimating Latvia's GDP in 1935 within the SNA 2008 framework" | — |
| 23 | 01_intro:12 | vanselm_1997_economics [35] | PARTIAL | Table 3.6 GNP per capita 1988: Latvia 124.2, Estonia 121.6 highest, but Lithuania 109.9 below Belarus 116.6 and Russia 115.8; output, not living standards | Narrow to Latvia and Estonia, or rest on hiden_salmon |
| 29 | 01_intro:14 | vonyoinmorys2021 [282] | SUPPORTED | "CESEE performed worse already in the 1950s…" | — |
| 30 | 01_intro:14 | berendregions2020 [42–3] | SUPPORTED | "so-called 'second serfdom'" | — |
| 33 | 02_gap:7 | norkuslatvia1935 | SUPPORTED | p. 251: "among the first ten pioneering states…" | Optionally [251] |
| 53 | 02_gap:9 | roseswolf2010 [187–90] | SUPPORTED | Table 8.2: Latvia 4.10%/yr 1929–38, behind USSR 4.87; 1938 Latvia 4048, Finland 3589; "might be on the high side" | — |
| 54 | 02_gap:9 | roseswolf2010 [189] | SUPPORTED | exact quote "an early exit from the gold standard with the UK in late 1931" | — |
| 57 | 02_gap:11 | norkuslatvia1935 | SUPPORTED | pp. 251, 254 | — |
| 61 | 02_gap:11 | krumins_2017_laika_lidz [26] | SUPPORTED | (Latvian) Ulmanis's rule "coincided with a period of economic upswing" | — |
| 71 | 02_gap:11 | bs_livingstandards1976 [72] | PARTIAL | Table III (1970 US$): Estonia 2,725, GB 2,693, Australia 2,664, Latvia 2,406, Lithuania 2,208; p. 68 puts only Estonia and Latvia at GB/Australia level | "Latvia and Estonia", cite [68, 72] |
| 88 | 03_method:9 | vonyoinmorys2021 [280] | SUPPORTED | "widely acknowledged as the best available" | — |
| 103 | 03_method:15 | krumins_2017_sovetizacijas [234] | PARTIAL | 1947 claim "must be assessed critically" (1940 lat devaluation ignored); no physical series | — |
| 108 | 03_method:19 | norkuslatvia1935 | SUPPORTED | Table 4, pp. 263–6 | — |
| 140 | 03_method:55 | norkuslatvia1935 | SUPPORTED | p. 254 | — |
| 157 | 03_method:73 | krumins_2017_gorbacova [348–50] | SUPPORTED | p. 349: 1985–90 food industry −5%, other branches up to −10% | — |
| 189 | 04_latvia:23 | krumins_2017_sovetizacijas [233–4] | SUPPORTED | 31.5% of Soviet radios 1939; industrial employment 75,000 → 160,000 (1945–50); 272,000 from co-cite Eglīte | — |
| 191 | 04_latvia:23 | krumins_2017_sovetizacijas [251–7] | SUPPORTED | p. 251 about a quarter of revenue to republic budget; p. 254 military/repressive ≈ half; 1946–90 figures from co-cites (Pazdere) | — |
| 197 | 04_latvia:25 | feest2014 [99–100] | SUPPORTED | note 81: 33,496 / 41,445 / 20,660 | — |
| 205 | 04_latvia:25 | krumins_2017_sovetizacijas [245–50] | SUPPORTED | 93% on 31 Dec 1949; cooperatives liquidated; meat price 16,640 → 680 | — |
| 206 | 04_latvia:25 | aizsilnieks_1974_sovietization [48] | SUPPORTED | 419 credit cooperatives abolished | — |
| 229 | 04_latvia:29 | krumins_2017_gorbacova [318] | PARTIAL | only bread and eggs freely available in Riga mid-1980s; no comparison with Estonia/Lithuania, no late-1970s dating | rely on co-cites or soften |
| 232 | 04_latvia:29 | krumins_2017_gorbacova [348–50] | SUPPORTED | as id 157 | — |
| 233 | 04_latvia:29 | vanselm_1997_economics [35] | SUPPORTED (1988 only) | Latvia 124.2, Estonia 121.6; 1988 not 1989; van Selm's compilation | — |
| 235 | 04_latvia:31 | silins_2017_metalapstrade [925–9] | SUPPORTED | 132,000 workers; 92% exported; 27% and 22% of 1990 by 1995; RAF closed 1998 | — |
| 247 | 05_baltic:7 | raun_2017_literacy [71] | SUPPORTED | Kurland 85.0%, Estland 95.3%, Livland 92.0% | — |
| 252 | 05_baltic:37 | karnups_2017_neatkarigas [103] | PARTIAL | Riga 520,000 (1914) → 225,000 (December 1920), not 1919 | "1914–1920" |
| 260 | 05_baltic:41 | vaskela_1996_land [121] | SUPPORTED | landlords' land 26.2% / 46.93% / 48.12% | — |
| 261 | 05_baltic:43 | roseswolf2010 [188, 190] | SUPPORTED | — | — |
| 265 | 05_baltic:43 | balticstates1938 [189] | SUPPORTED | "prosperity … depends largely on their export trade" | — |
| 276 | 05_baltic:47 | klimantas2025thesis [25] | SUPPORTED | "4.3 and 3.1 university students per 1,000 … 2.3 in Europe's Western core" | — |
| 278 | 05_baltic:51 | vonyoinmorys2021 [290] | SUPPORTED | "did not require huge investments" | — |
| 281 | 05_baltic:53 | feest2014 [99–100] | SUPPORTED | deportation counts | — |
| 296 | 05_baltic:57 | klimantas2025thesis | SUPPORTED | thesis p. 192; paper says "until the 1970s" vs thesis "for much of the occupation period" | Add [192] |
| 298 | 05_baltic:57 | vaskela_2013_lietuvos [110] | PARTIAL | investment per inhabitant above most Soviet regions, 1946–60 only; nothing on GDP share or "until the 1970s" | — |
| 300 | 05_baltic:57 | vanselm_1997_economics [35] | SUPPORTED | Table 3.5: capital stock 114.0, investment 95.1 | — |
| 301 | 05_baltic:59 | vonyoinmorys2021 [281–2] | SUPPORTED | — | — |
| 313 | 05_baltic:61 | vonyoinmorys2021 [285–6] | SUPPORTED | "maintained only thanks to the growth of government services" | — |
| 317 | 05_baltic:67 | klimantas2025thesis [39] | PARTIAL | 24% of industry and 7% of GDP match; thesis says "14,000 to 17,000 buses annually", not a Jelgava capacity of 17,000; thesis says sector shrank to "less than one-tenth" by 1995 vs paper's "roughly a quarter" | Fix bus wording; resolve 1995 figure |
| 319 | 05_baltic:67 | silins_2017_metalapstrade [925–9] | PARTIAL | supports "roughly a quarter" (27, 22); share of industry 1990 = 27.9%, more than "nearly a quarter"; 7% of GDP and 17,000 capacity not in Šiliņš | — |
| 320 | 05_baltic:67 | norkus_restorations [164–6] | SUPPORTED | "socialist over-industrialisation … all-union enterprises" | — |
| 332 | 05_baltic:71 | klimantas2025thesis | SUPPORTED | thesis p. 42 Table 1.3: −29 / −24 / −15 | Add [42] |
| 333 | 05_baltic:71 | hazans_2013_emigration [66] | PARTIAL | 9.1% loss since 2000; cannot support 1989–2021 | acceptable as co-cite |
| 338 | 05_baltic:73 | starkeviciute_2013_augimas [98] | SUPPORTED (2000/2004/2010) | Latvia 37/46/52; 2017 from co-cites | — |
| 343 | 05_baltic:73 | klimantas2025thesis | SUPPORTED | thesis p. 205 | Add [205] |
| 348 | 05_baltic:89 | klimantas2025thesis | SUPPORTED | thesis p. 210 "does not establish a causal negative impact" | Add [210] |
| 353 | 05_baltic:95 | klimantas2025thesis [217] | SUPPORTED | "advantages in Baltic 'social capability' had eroded" | — |
| 356 | 06_conclusion:9 | vaskela_2013_lietuvos [115–16] | PARTIAL | skills tied to pre-1914 heritage, not the interwar republic; immigrant labour absent | soften |
| 375 | T12:22 | aslund_myth [15] | SUPPORTED | Table 10: Latvia 89, Estonia 97, Lithuania 87 | — |
| 379 | T1:38 | norkuslatvia1935 [263–6, 287, 312] | SUPPORTED | Tables 4, 12, PPP basket match; "two aggregates" is the paper's grouping | optional wording |
| 385 | T4:26 | roseswolf2010 [190] | SUPPORTED | Latvia 1929 / 2798 / 4048 | — |
| 393 | T5:29 | klimantas2025thesis [149–56] | PARTIAL | thesis Table 3.6 (p. 154) gives Latvia "–" for service-sector 1919–40; T5 shows ±3 (Estonia's value); labour-productivity row 1919–29 in T5 vs 1919–1940 in thesis | check T5 row |
| 411 | T9:35 | east_industry_periphery1871 [86] | SUPPORTED | Table A.4.2: Hungary 3.6, Czechoslovakia −0.8 | fix bib |
| 415 | T9:35 | balticstates1938 [123, 161] | WRONG PAGE | totals on p. 122 (Table 22) and p. 155 (Table 40) | [122, 155] |

## Summary
42 SUPPORTED, 11 PARTIAL, 1 WRONG PAGE. UNVERIFIABLE: none. Bib: 1 WRONG (east_industry_periphery1871), 1 MINOR (aslund_myth).
Action: 393 (T5 Latvia ±3 vs thesis "–"), 415, 317/319 (bus sector figures), 71, 23, 356, 229, 252, 298/103/333; add thesis pages 296, 332, 343, 348; 379 minor.
