# Fresh citation audit, Latvia paper: batch D1

(Saved by the orchestrator from the agent's final message; the agent could not write the file.)

- **Batch:** D1, 47 instances, 26 keys.
- **Searched for every key:** folder names in `newsources/`, `latvia_paper_literature/`, `estonia_paper_literature/`; `$SP/pdftext/`; `ls -R` of `Papers/`, `source_papers/`, `supporting_papers/`, `template_papers/`, `OCR/`, `Dissertation latex files/`; `find` for pdf/txt/doc across the repo outside `newsources/` and `.git`.
- **Copies found that the automatic match missed:** Aizsilnieks 1968 (PDF in `Papers/`) and OECD 2024 "Key policy insights" (`newsources/`). All other keys were checked against the dissertation.
- **Dissertation mapping:** printed page = PDF page − 18. "L…" = line of `klimantas2024dphil.tex`. The dissertation usually cites the Maddison Project in plain text ("MPD version 2023"); counted as the same work.

## Source location per key
| key | where found | bib check |
|---|---|---|
| latvija19141945vesture | `Papers/Additional papers for background and implications sections/1,2 LV Aizsilnieks 1968 Latvijas saimniecības vēsture. 1914–1945.pdf` (994 pp., text layer). **Printed page = PDF page − 5** (PDF 687 = p. 682, 688 = 683, 690 = 685, 839 = 834) | BIB OK |
| oecd_2024_key | `newsources/oecd_2024_oecd_economic_surveys_latvia_ch_key_policy_insights/` (pp. 16–79) | BIB OK |
| meltyukhov2014en | not in project; dissertation key for the same book is `meltyukhov2014` (Cyrillic) | matches dissertation bib |
| bolt_zanden_newgdp2021 | not in project | BIB MINOR: bib gives pp. 29–51, but id 155 cites p. 12 |
| mpd2023, dagys1959, ceska1989, adlys1988, worldtables1995, maddisonworldeconomy, bergson1961, schroeder1995, wbinputoutput1987, ostlandinzahlen, feinstein1972, kontorovich_2001, eastern_crampton, lv_collectiv, lv_sovhist02, vlekolektyv, statisticsUKlabour, jonsson1999, ivanov2012gdp, un_yearbook1993, lidaexportslv, worldtrade1949 | not in project (near misses are other works by the same authors: Dagys n.d., Adlys 2009, Bergson 1953, Schroeder 1973/83/92, Feinstein & Thomas 2002/03, Maddison 1996/1998) | n/a |

## Grades
| id | file:line | key [post] | grade | quote / note | fix |
|---|---|---|---|---|---|
| 5 | 01_intro:6 | meltyukhov2014en [279] | DISS MATCH | L422, p. 2: same soldier quote, `\footcite[279]{meltyukhov2014}` | – |
| 9 | 01_intro:8 | mpd2023 | DISS MATCH | L1029 (p. 48); L451 (p. 4) | – |
| 35 | 02_gap:7 | dagys1959 [140] | DISS MATCH | L1051 (p. 50), same page. Caveat: Dagys writes about *bourgeois Lithuania*; the paper says "the country" (Latvia) | Make the sentence Baltic-wide, as the dissertation does |
| 37 | 02_gap:7 | ceska1989 [581–93] | DISS MATCH | L1055 pp. 581, 587; L1057 p. 593 (thesis p. 51) | – |
| 41 | 02_gap:7 | adlys1988 | DISS MATCH | L993 (p. 45), L1083 (p. 52) | – |
| 47 | 02_gap:9 | worldtables1995 [32–3] | DISS MATCH | L1111 (p. 54) | – |
| 49 | 02_gap:9 | maddisonworldeconomy [181–2] | DISS MATCH | L1136 [181] (p. 57); L1088 [182] (p. 52) | – |
| 63 | 02_gap:11 | latvija19141945vesture (no page) | SUPPORTED | Latvian, p. 834: "Latvijas tautas ienākums nav arī audzis" (national income did not grow); per-head index 100→101 for 1934–38. p. 790: "rūpniecības pārkārtošanās uz autarķijas sistēmu" | Add pages [790, 834] |
| 80 | 03_method:9 | bergson1961 | DISS MATCH | L1090 (p. 52) | – |
| 84 | 03_method:9 | schroeder1995 | DISS MATCH | L1095 (p. 53) | – |
| 107 | 03_method:19 | wbinputoutput1987 | DISS MATCH | L1836 (p. 106) | – |
| 112 | 03_method:23 | maddisonworldeconomy [181–2] | DISS MATCH | as id 49 | – |
| 116 | 03_method:23 | worldtables1995 [32–3] | DISS MATCH | L1111 (p. 54) | – |
| 118 | 03_method:23 | wbinputoutput1987 [66–89] | DISS PAGE DIFFERS | L1838 (p. 107) makes the "understates services" claim with no page | Verify a page or drop it |
| 119 | 03_method:25 | adlys1988 | DISS MATCH | L1838 (p. 107). Caveat: "Baltic statisticians" (plural) rests on one Lithuanian official | Reword, e.g. "a senior Lithuanian statistician" |
| 122 | 03_method:29 | wbinputoutput1987 [82–5] | DISS MATCH | L5225 (p. 298) | – |
| 128 | 03_method:37 | ostlandinzahlen [39, 45] | DISS MATCH | L4699–4700 (pp. 274–5): index p. 45, workers p. 39 (diss main text L2023 gives p. 39 for the index — internally inconsistent) | – |
| 129 | 03_method:39 | wbinputoutput1987 [66–89] | DISS MATCH | L1968 (p. 115), L5249 cite [66-69, 82-85, 86-89]; paper merges into 66–89 | – |
| 133 | 03_method:47 | feinstein1972 [21] | DISS MATCH (definition) | L1780 (p. 102), L2596 (p. 143). "Rough" for war years is the paper's own judgement | – |
| 135 | 03_method:51 | bolt_zanden_newgdp2021 [30] | DISS: CITED ELSEWHERE ONLY | One-third rule rests only on maddison_project_paper2014 [629] (L1715, p. 96); diss cites bolt_zanden [30] only for the 1990/2011 benchmark choice | Verify, or cite only maddison_project_paper2014 |
| 144 | 03_method:59 | mpd2023 | DISS MATCH | L6038–9 (p. 320) | – |
| 152 | 03_method:65 | mpd2023 | DISS MATCH | L1136–1138 (pp. 57–8); L5997 MPD 1990 = 15806 | – |
| 155 | 03_method:69 | bolt_zanden_newgdp2021 [12, 30] | DISS PAGE DIFFERS | L2442 (p. 139) cites [30] only for benchmark choice; sources the 1.594 ratio to "page 12 in the MPD version 2023 paper" (= mpd2023). **p. 12 is outside the chapter (pp. 29–51)** | Cite [30] here and mpd2023 for 1.594 |
| 170 | 03_method:83 | kontorovich_2001 [688–9] | DISS MATCH | L2785 (p. 153) | – |
| 255 | 05_baltic:41 | eastern_crampton [103] | DISS MATCH | L692 (p. 22); L3144 (p. 161) | – |
| 271 | 05_baltic:43 | latvija19141945vesture [683] | WRONG PAGE | p. 683 is on income-tax revenues 1934–40. Support on **p. 713**: "valdība garantētās cenas … un valsts piemaksas neizbeidza" (the government did not end guaranteed prices and state subsidies), and p. 835 (fixed-price policy). Diss (L3290, p. 169) carries the same wrong 683 | [713, 835] |
| 345 | 05_baltic:73 | oecd_2024_key [17] | PARTIAL | p. 17: "Weak investment and skilled labour shortages … have weighed on potential growth, and the competitiveness". Labour-cost part is on **p. 23**: "relatively weak productivity growth coupled with strongly rising real wages and unit labour costs" | [17, 23] |
| 347 | 05_baltic:85 | mpd2023 | DISS MATCH | L4117–4160 (pp. 207–9) | – |
| 364 | A1_series:56 | mpd2023 | DISS MATCH | L6039, L6061 (pp. 320–2) | – |
| 366 | T10_war:33 | mpd2023 | DISS MATCH | L3544 (p. 181) | – |
| 367 | T11:30 | lv_collectiv [69] | DISS MATCH | L819 (p. 32) | – |
| 368 | T11:30 | lv_sovhist02 [241–2] | DISS MATCH | L819 (p. 32) | – |
| 371 | T11:30 | vlekolektyv | DISS MATCH | L819 (p. 32) | – |
| 374 | T12:22 | mpd2023 | DISS MATCH | L2663 (pp. 146–7) | – |
| 378 | T1:38 | wbinputoutput1987 | DISS MATCH | L1167 (p. 58) | – |
| 382 | T3:29 | feinstein1972 [21] | DISS MATCH | L1780 (p. 102); L2596 (p. 143) | – |
| 383 | T3:29 | mpd2023 | DISS MATCH | L6038 (p. 320) | – |
| 387 | T4:26 | mpd2023 | DISS MATCH | L2610 (pp. 142–4) | – |
| 392 | T5:29 | statisticsUKlabour | DISS MATCH | L2831 (p. 154): "+147%" | – |
| 396 | T7:34 | mpd2023 | DISS MATCH | L3635 / L3225 (pp. 166, 184) | – |
| 403 | T9:35 | jonsson1999 [24] | DISS MATCH | L3743 (p. 190) | – |
| 404 | T9:35 | ivanov2012gdp [460] | DISS MATCH | L3743 (p. 190) | – |
| 406 | T9:35 | un_yearbook1993 [182] | DISS MATCH | L3743 (p. 190) | – |
| 410 | T9:35 | ostlandinzahlen [2] | DISS MATCH | L701 (p. 24), L1503 | – |
| 412 | T9:35 | lidaexportslv | DISS MATCH | L3341 (p. 170) | – |
| 414 | T9:35 | worldtrade1949 | DISS MATCH | L3341 (p. 170) | – |
| 416 | T9:35 | jonsson1999 [21] | DISS MATCH | L3341 (p. 170) | – |

## Summary
Needs action, most serious first:
1. id 271: wrong page in Aizsilnieks; 683 → [713, 835]. Dissertation has the same error.
2. id 155: bolt_zanden p. 12 does not exist in the cited chapter; 1.594 belongs to mpd2023.
3. id 135: bolt_zanden [30] for the one-third rule not backed by the dissertation.
4. id 345: OECD claim needs p. 23 as well as p. 17.
5. id 118: page range 66–89 for "understates services" unverified.
6. Wording: id 119 ("Baltic statisticians" = one Lithuanian), id 35 (Dagys is about Lithuania).
7. id 63: add pages [790, 834].

UNVERIFIABLE: none. 24 keys checked only against the dissertation.

Counts: 47 instances: 41 DISS MATCH, 2 DISS PAGE DIFFERS, 1 DISS CITED ELSEWHERE ONLY, 1 SUPPORTED, 1 PARTIAL, 1 WRONG PAGE.
