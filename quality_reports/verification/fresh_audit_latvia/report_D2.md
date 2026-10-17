# Fresh citation audit, Latvia paper: batch D2

(Saved by the orchestrator from the agent's final message; the agent could not write the file. All 46 batch ids are covered; grouped rows count several ids.)

- **Scope:** 46 instances, 26 keys.
- **Copies in the project:** only `wbtransitionlatv` has one: `newsources/world_bank_1993_latvia_transition_market_ch_*` (11 chapter folders, printed pp. 3–204; printed page = PDF page − 26). The statistical appendix was not converted, so pp. 228–9, 286 and 289 are missing.
- **Searched for the other 25 keys:** newsources and supporting-docs folder lists and MANIFEST.csv files, `find` over Papers, master_supporting_docs and OCR (surnames and titles), and `$SP/pdftext`. No copy; graded against the dissertation (thesis printed page = PDF page − 18).

## Source location per key
| key | where found | bib check |
|---|---|---|
| wbtransitionlatv | newsources WB 1993 Latvia chapters, pp. 3–204 (offset −26); appendix pp. 228–9, 286, 289 absent | BIB OK |
| corum2013 | not in project | Not checkable. For this claim the dissertation cites `Corumbalticrussia` (Corum 2018, *South Central Review* 35(1):127–46), already in the paper bib. |
| kodres_soviet_west, gregrussianempire, Campbell1985, assessingCIA1988, becker1994, UNECE1995, wbstatisticalhandbook1994, maddison_project_paper2014, swedengdp_15602010, lobellschonkrantz2008, hidden_inflation_sov, shadow_europe, gatis_compensations, lewis1954, broadberryklein2011, oecd_2022_boosting, lv_deportations, taagepera_coll01, deportations_ee, klimantas2019, mitchelstat, portugal_economy, lidaimportslv, wdi2024 | not in project (near-misses only: Campbell 1995, Krūmiņš 2017/2024, Broadberry 1984/1996, Edvinsson 2013, OECD 2000/2015/2019, other Taagepera works) | not checkable; oecd_2022_boosting is also absent from the dissertation bib |

## Grades
| id | file:line | key [page] | grade | evidence | fix |
|---|---|---|---|---|---|
| 2 | 01_intro:6 | corum2013 [129] | **DISS SOURCE DIFFERS** | Diss l.418 (p.1) makes the same "culturally Western … Protestant churches … traded with the West" claim but cites `Corumbalticrussia` [129]; corum2013 only elsewhere (l.1484, l.657). | Swap to `Corumbalticrussia` |
| 3 | 01_intro:6 | kodres_soviet_west [427] | DISS MATCH | l.636 (p.18): "imperial nickname `our little West'" | — |
| 12 | 01_intro:8 | klimantas2019 | DISS MATCH | l.1181 (p.59), l.1752 | — |
| 32 | 02_gap:7 | gregrussianempire [219–20] | DISS MATCH | l.1049 (p.50) | — |
| 38 | 02_gap:7 | Campbell1985 | DISS MATCH | l.1057 (p.51), no page in either | — |
| 46 | 02_gap:9 | wbtransitionlatv [4, 228–9] | **p.4 PARTIAL; pp.228–9 PAGE MISSING; DISS PAGE DIFFERS (diss gives no page)** | p.4: "Between 1981 and 1989, real GDP growth rates averaged 3.9 percent a year" (growth only, no levels). l.1111 (p.54) cites without page for 1980–91 GDP levels. | Check pp. 228–9 in the original |
| 74 | 02_gap:11 | gatis_compensations | DISS MATCH | l.1594 (p.89): "Latvia was a net contributor to the USSR" | — |
| 82 | 03_method:9 | assessingCIA1988 | DISS MATCH | l.1095 (p.53) | — |
| 83 | 03_method:9 | becker1994 | DISS MATCH | l.1095 (p.53), "minority … underestimated" | — |
| 109 | 03_method:19 | wdi2024 | DISS MATCH | sensitivity table note e (p.154): Bulgaria and Ukraine at 0.5% | — |
| 113 | 03_method:23 | wbstatisticalhandbook1994 | DISS MATCH (gist) | l.2698 (p.149): Bolotin's services "significantly higher than those reported by the World Bank". The 47%/34% figures are not in the dissertation. | Optional page |
| 115 | 03_method:23 | wbtransitionlatv [228–9] | **PAGE MISSING; DISS PAGE DIFFERS (no page)** | l.1111 (p.54) | Check the original |
| 117 | 03_method:23 | UNECE1995 [249] | DISS MATCH | l.1113 (p.55). The clause on the Total Economy Database reproducing the indices is not covered by this citation. | Separate cite for that clause |
| 123 | 03_method:29 | wbtransitionlatv [289] | PAGE MISSING; DISS MATCH | l.5225 (p.298): "extended by … Latvia – The transition, 289" | — |
| 126 | 03_method:29 | wbtransitionlatv [103–4] | SUPPORTED | "A large share of the output from electronics industries and shipyards consisted of products and components for military use." | — |
| 127 | 03_method:35 | wbtransitionlatv [286] | PAGE MISSING; DISS MATCH | l.1854 (p.108): "Crop and livestock weights from … [286]" | — |
| 134 | 03_method:51 | maddison_project_paper2014 [629] | DISS MATCH | l.1715 (p.96) | — |
| 145 | 03_method:59 | wdi2024 | DISS MATCH | l.2488 (p.140); l.6038 (p.320) | — |
| 153 | 03_method:65 | wdi2024 | DISS MATCH | l.1137 (p.56); figure sources l.1130 | — |
| 165 | 03_method:81 | swedengdp_15602010 [19] | DISS MATCH (topic only) | Diss ties the 17% to lobell [152] only; swedengdp [19] appears in the sensitivity-table note (p.154). | Optional |
| 166 | 03_method:81 | lobellschonkrantz2008 [148–53] | DISS MATCH | l.1775 (p.102): "by 17% during the 75 years since 1875" [152] | Could narrow to 152 |
| 168 | 03_method:83 | wbtransitionlatv [157] | SUPPORTED | "military population is estimated to be about 300,000 persons, including family members, or 11 percent of the population" | — |
| 169 | 03_method:83 | hidden_inflation_sov [607] | DISS MATCH | table note c (p.154) | — |
| 173 | 03_method:83 | shadow_europe [90–1] | DISS MATCH | l.2787 (p.153) | — |
| 193 | 04_latvia:23 | gatis_compensations | **DISS: CITED ELSEWHERE ONLY** | Diss cites this work only for the general net-contributor finding. None of the figures (a quarter, nearly half, 18%, 13.3 bn roubles, 15.7%) appear in it. | Confirm the source of each figure and add pages |
| 226 | 04_latvia:29 | wbtransitionlatv [101–6] | SUPPORTED (military labour) | pp. 103–4: "more than 15 percent of the labor force in Latvia in 1985 was employed in military production … three times higher than in Estonia." The "third to two-fifths" All-Union output share is not on pp. 101–6, which give only "46 percent of the enterprises" (a count, not output). | Narrow to [103–4] |
| 243 | 05_baltic:7 | lewis1954 | DISS MATCH | l.1273 (p.64), no page | — |
| 297 | 05_baltic:57 | gatis_compensations | DISS MATCH (gist) | l.3774 (p.192): "investments were modest relative to GDP … confirming the findings of Krūminš" | — |
| 302 | 05_baltic:59 | broadberryklein2011 [44–5] | DISS MATCH | l.1444 (p.80) | — |
| 311 | 05_baltic:61 | broadberryklein2011 [49] | DISS MATCH | l.1450 (p.80), CoCom | — |
| 344 | 05_baltic:73 | oecd_2022_boosting [70] | **DISS SOURCE DIFFERS** | l.4317 (p.222) cites `oecdLV2024` for the middle-income trap. This work is in neither the dissertation nor the project, so p.70 cannot be checked. | Verify p.70 |
| 365 | A1_series:56 | wdi2024 | DISS MATCH | l.6038 (p.320) | — |
| 369 / 372 / 373 | T11:30 | lv_deportations / taagepera_coll01 [265] / deportations_ee [12] | DISS MATCH | collectivisation table sources, l.819 (p.32) | — |
| 384 | T3:29 | wdi2024 | DISS MATCH | l.2488, l.6038 | — |
| 388 / 389 / 390 / 391 | T5:29 | swedengdp [19] / lobell [148–53] (topic) / hidden_inflation [607] / wdi2024 | DISS MATCH | sensitivity table notes b, c, e (p.154); l.1775 for lobell | — |
| 397 | T7:34 | wdi2024 | DISS MATCH | l.3915 / l.3944 | — |
| 398 | T9:35 | klimantas2019 | DISS MATCH | l.1222 (p.61), [239–41] | Optional page |
| 401 / 402 | T9:35 | mitchelstat / portugal_economy [158] | DISS MATCH | l.3279 (p.168), l.3743 (p.190) | — |
| 409 | T9:35 | mitchelstat | DISS MATCH | l.1503 (p.85), l.3405 (p.173) | — |
| 413 | T9:35 | lidaimportslv | DISS MATCH | l.3341 (p.170) | — |

## Orchestrator correction (id 344)
The agent missed a project copy: `newsources/oecd_2022_oecd_economic_surveys_latvia_ch_boosting_productivity_incomes` (pp. 66–107). p. 70: "labour costs have increased considerably faster than labour productivity … leading to a deterioration in cost competitiveness". **id 344 → SUPPORTED** (the investment part rests on co-cited oecd_2024_key p. 17). Corum: no copy of either Corum work found (`ls newsources master_supporting_docs/*/ | grep -i corum`).

## Summary
Needs action, most serious first:
1. id 2: `corum2013` probably the wrong key; dissertation gives this claim and p.129 to `Corumbalticrussia`.
2. id 193: none of the budget figures are in the dissertation; they need a source and pages.
3. id 344: `oecd_2022_boosting` p.70 uncheckable; dissertation cites OECD Latvia 2024 survey instead.
4. ids 46, 115: pp. 228–9 missing from the copy; p.4 gives growth, not levels.
5. id 226: narrow to pp. 103–4; output-share figure not on pp. 101–6.
6. id 117: Total Economy Database clause unsupported by a citation.
7. Minor: ids 165, 113.

Unverifiable: none strictly; only id 344's p.70 cannot be checked.
