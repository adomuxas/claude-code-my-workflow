# Fresh citation audit — Latvia paper — summary (2026-10-17)

416 citation instances, 188 works (`latvia_cites.tsv`; includes `\parencites` groups and the R-generated table notes in `Tables/latvia/`). Read-only; nothing in the paper was changed.
Reports: `report_1–6.md` (project copies), `report_D1.md`, `report_D2.md` (keys with no automatic match: project searched first, then the dissertation). Brief: `BRIEF.md`.

## Coverage
- **334 instances / ~140 works** checked against a copy in the project (newsources page files, `Papers/` PDFs incl. OCR'd scans, the Ponomarenko Word manuscript, the dissertation itself for `klimantas2025thesis`, the Estonia paper for `klimantas2025estonia`). Copies found that the automatic match had missed: Aizsilnieks 1968 (PDF in `Papers/`), OECD 2024 and OECD 2022 Latvia surveys, O'Rourke & Williamson 2017 (full book PDF).
- **82 instances / 47 works** have no copy in the project and were checked against the dissertation (`klimantas2024dphil.tex` + final PDF text).

## Grades — against project copies (334)
| Grade | n | ids |
|---|---|---|
| SUPPORTED | 266 | — |
| PARTIAL | 57 | see action list |
| WRONG PAGE | 3 | 162 (cia1990 8 → 6–7), 271 (Aizsilnieks 683 → 713, 835), 415 (balticstates1938 123, 161 → 122, 155) |
| NOT SUPPORTED | 1 | 159 (gerschenkron1957 — wrong Gerschenkron work) |
| EDITION | 3 | 79 (bergson1950: only the 1953 book), 258, 289 (Kasekamp: 2010 copy, 2017 cited) |
| PAGE MISSING | 4 | 46, 115, 123, 127 (WB 1993 Latvia statistical appendix not in the copy; 123 and 127 match the dissertation, 46 and 115 — pp. 228–9 — are cited without page there) |

## Grades — dissertation fallback (82)
| Grade | n | ids |
|---|---|---|
| DISS MATCH | 77 | — |
| DISS PAGE DIFFERS | 2 | 118 (wbinputoutput1987 [66–89]; diss gives no page), 155 (bolt_zanden_newgdp2021 [12, 30]: p. 12 lies outside the chapter, pp. 29–51; diss sources the 1.594 ratio to p. 12 of the MPD 2023 paper) |
| DISS: CITED ELSEWHERE ONLY | 2 | 135 (bolt_zanden [30] for the one-third border rule; diss uses maddison_project_paper2014 [629] only), 193 (gatis_compensations for the budget figures — but those figures are supported by co-cited Pazdere p. 9 and Krūmiņš pp. 251–4, so only the gatis attribution is loose) |
| DISS SOURCE DIFFERS | 1 | 2 (corum2013 [129]; diss gives the same claim and page to `Corumbalticrussia`, Corum 2018) |
| UNVERIFIABLE | 0 | — |

## Cannot be checked against the project files OR the dissertation (flag list)
1. **id 2 — corum2013 [129]** (01_intro:6). No Corum copy in the project; the dissertation attributes this sentence and page to a different Corum work (2018, *South Central Review*). Probably the wrong key.
2. **id 135 — bolt_zanden_newgdp2021 [30]** (03_method:51), cited for the one-third territorial-border rule. No copy; the dissertation never cites it for this.
3. **id 155 — bolt_zanden_newgdp2021 [12, 30]** (03_method:69). No copy; p. 12 cannot exist in a chapter spanning pp. 29–51.
4. **id 118 — wbinputoutput1987 [66–89]** (03_method:23), "understates the service sector". No copy; the dissertation makes the claim without a page, so the range is unchecked.
5. **ids 46, 115 — wbtransitionlatv [228–9]** (02_gap:9, 03_method:23). The project copy lacks the statistical appendix and the dissertation cites the work without a page.

(Note: a "DISS MATCH" only shows the paper agrees with the dissertation; the 47 works behind those 77 instances have not been checked against the original sources.)

## Action list — most serious first
**Wrong or unsupported**
- 159 gerschenkron1957 [453] (03_method:81): JASA 1957 review has nothing on Soviet machinery or 175 vs 62%. Replace (e.g. harrison1993 p. 156, or the 1951 RAND study); bib pages are 450–457.
- 131 cia1982a [49] (03_method:43): the paper says finance follows employment "adjusted for productivity … as the CIA did"; the CIA says it had "no evidence … on which we could estimate a productivity allowance". The dissertation carries the same error (.tex l. 2157, 5316).
- 377 T1 note / Bolotin p. 184: industry 1990 = 5.2 bn $ ÷ 1.80 = 2,888.9, but T1 shows 3,190.8; other five sectors match exactly. Check the data / R input.
- 393 T5 sensitivity: Latvia's 1919–40 service-sector row shows ±3, the thesis (Table 3.6, p. 154) gives "–" for Latvia (±3 is Estonia's value); labour-productivity row years differ (1919–29 vs 1919–40).
- 2 corum2013 → probably `Corumbalticrussia`.
- 155, 135 bolt_zanden (see flag list).
- Wrong pages: 162, 271, 415.

**Facts the source states differently**
- 179/178 (04_latvia:21): Terleckas' March 1941 withdrawal and 1,000-rouble limit concern the litas; M&T date the abolition of Baltic currencies to late 1940. Krūmiņš (id 177, pp. 183–8) supports cancellation of savings above 1,000 lats and withdrawal without warning — check that the date in the sentence rests on him.
- 342/341 (05_baltic:73): Estonia did not contract "in each year since 2021" — Tsaurkubule shows +0.1% for 2022 and Povilauskas −0.5/−3.0/−0.1 for 2022–24 with +0.7% forecast for 2025.
- 317/319 (05_baltic:67): bus sector — thesis gives "14,000 to 17,000 buses annually" (not a Jelgava capacity of 17,000) and "less than one-tenth" by 1995, against the paper's "roughly a quarter" (Šiliņš 27%/22%); Šiliņš's 1990 share is 27.9%, not "nearly a quarter".
- 256 (05_baltic:41): Norkus et al. date Estonia's return to its 1913 level to 1924; the paper says 1925.
- 223 (04_latvia:29): M&T say "below the Soviet average", not "lowest of any republic" (Krūmiņš p. 304, id 222, does support "lowest in the USSR").
- 351 (05_baltic:95): on mechanisation M&T say the opposite ("Baltic labor efficiency was markedly above the Soviet average").
- 48 (02_gap:9): Maddison pp. 307–8 do not call the NMP + GDP/NMP-ratio short cut "inadmissible".
- 202 (04_latvia:25): Labsvirs gives kolkhoz *land* 82.9% on 1 Jan 1950, not farms at 85%.
- 408 (T9): agricultural employment cells do not match Morys p. 181 (USSR 65 vs 57.8; Bulgaria 80 vs 71.8; Greece "---" vs 56.6).
- 252 (05_baltic:37): Riga's fall is 1914 → December 1920 (225,000), not 1919.
- 23, 71 (01_intro:12, 02_gap:11): van Selm and Koropeckyj put only Latvia and Estonia at the top; Lithuania ranks lower.
- 270 (05_baltic:43): Klimantas et al. p. 36 call interwar re-industrialisation "inadvertent", not a policy of economic nationalism.
- 208 (04_latvia:25): Krūmiņš's yield ratio is ~43%, Labsvirs's ~56% — align "little more than half" with the source used.
- 151, 150 (03_method:65): Hamilton & de Vries p. 17 and IMF p. 11 do not say a backward-weighted series shows a shallower decline (IMF p. 7 comes closest).
- 106: Bolotin never says he began from Goskomstat totals of 1990–1.
- 356, 305, 285, 229, 228, 217, 213, 65, 42, 21/142, 330: source supports a narrower statement (details in the batch reports).

**Pages to add or narrow (no substantive problem)**
- Unpaged thesis cites: 296 [192], 332 [42], 343 [205], 348 [210]; Aizsilnieks id 63 [790, 834]; Kukić 28 [670], 91 [646, 670–1]; vonyo2017 98 [6]; belkharoev2024 218 [17–19]; krumins_1950 304 [262–3]; OECD 2024 id 345 [17, 23]; Maddison 97 [307–8]; cia1982a 131 [46, 49]; WB 1993 id 226 [103–4]; Grennes 321 drop [21].

## Bibliography
- **WRONG:** east_industry_periphery1871 (editors O'Rourke & Williamson, not "O'Rourke & Gale"; book title in `series`, not `booktitle`); gerschenkron1957 (pages 450–457).
- **MINOR:** aslund_myth (Carnegie Working Paper No. 18, not @article); cameh_sectoral1945 (volume title in `series`); bitans_2012_development (book title and publisher missing); years_of_dependence (no publisher/edition); cia1982a (title "1950-80"); ponomarenko2002 (only 2001 manuscript in project).
- **EDITION / version:** Kasekamp (2010 copy, 2017 cited); bergson1950 (1953 book copy); Klimantas2024, vonyo2017, voskoboynikov2021, vonyo_whydidsocialistfail (online-first copies; pages not cited or unaffected).
