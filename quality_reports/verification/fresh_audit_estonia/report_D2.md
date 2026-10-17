# Fresh citation audit — Estonia paper — batch D2

(Saved by the orchestrator from the verifier's final message; the harness blocked subagent writes.)

- Batch D2: 34 instances, 18 keys.
- Correction to the automatic lead: **wb1993estonia has a project copy**: `newsources/World Bank 1993 Estonia - The transition to a market economy (A World Bank/` (printed pages, offset 0). Its 5 instances were verified directly against that copy.
- The other 17 keys were not found in the project files (searched newsources, estonia_paper_literature MANIFEST, Papers/, master_supporting_docs/), so they were checked against the dissertation. `newsources/adlys_2009_*` is a different work.
- Dissertation references below are .tex line / thesis printed page.
- Bib: klimantas2019 key says 2019 but the entry says 2020 (the entry is correct). mitchelstat is BIB MINOR (author "Palgrave Macmillan Ltd", no volume).

## Grades
| id | file:line | key [post] | grade | evidence | fix |
|---|---|---|---|---|---|
| 11 | main.tex:135 | clark1938 [60] | DISS CLAIM DIFFERS | Diss uses Clark p.60 for "around 1930 Latvia and Estonia stood at 93-95% of Finland" (l.422/p.2); the 90%/1925–34 bridge is attributed only to Valge p.2725 (l.4559/p.263) | Confirm on p.60 or cite via Valge |
| 17 | main.tex:137 | klimantas2019 | DISS MATCH | l.1752, l.4547 | – |
| 50 | main.tex:155 | wb1993estonia [1–8] | PARTIAL | Independence, price reform, contraction and the June 1992 currency board are supported (pp.2–7). Privatisation is not: p.8 says "lack of a coherent privatization strategy". The 1995 recovery postdates the source | Narrow to pp.2–7 and rely on the co-cite |
| 57 | main.tex:161 | clark1938 [60] | DISS CLAIM DIFFERS | as 11 | as 11 |
| 74 | 02_method:15 | Maddison1995a [328] | DISS: CITED ELSEWHERE ONLY | Diss cites Bergson/CIA for this claim (l.1090) and Maddison1995a only at [139] (l.1101) | Check p.328 |
| 77 | 02_method:15 | schroeder1995 | DISS MATCH | l.1095 | – |
| 82 | 02_method:15 | schroeder1995 | DISS: CITED ELSEWHERE ONLY | Diss gives "best available" to Vonyó (l.1096); the quote "was not well founded" is not in the diss | Find the source and page of the quote |
| 92 | 02_method:21 | klimantas2019 | DISS PAGE DIFFERS | Diss cites [238] (l.4468) | Add p.238 |
| 96 | 02_method:25 | klimantas2019 | DISS MATCH | l.4547, l.4553 | – |
| 101 | 02_method:27 | wbinputoutput1987 | DISS MATCH | l.1836, l.1167 | – |
| 102 | 02_method:27 | wdi2024 | DISS MATCH | l.2830 | – |
| 104 | 02_method:29 | wbstatisticalhandbook1994 | DISS MATCH | Table at l.2706 (16/47/38); diss credits the 1993/94/96 editions jointly | Optional check |
| 105 | 02_method:29 | wb1993estonia [85] | SUPPORTED | Table 5-1: "42 39 40" | – |
| 107 | 02_method:29 | wb1993estonia [2, 5] | PARTIAL | p.2: 1980–89 growth "averaged only 1 percent"; the p.5 table is sourced to the Statistical Office, not a WB mission | Tighten wording |
| 110 | 02_method:29 | UNECE1998 [199] | DISS MATCH | l.1113 | – |
| 111 | 02_method:29 | GeigerTobias2018Cngd | DISS MATCH | l.1117 | – |
| 112 | 02_method:29 | wbinputoutput1987 [66–89] | DISS PAGE DIFFERS | Diss cites it without a page (l.1838) | minor |
| 113 | 02_method:31 | adlys1988 | DISS CLAIM DIFFERS | Diss refers to a single "Deputy chief of Lithuanian SSR's Goskomstat" (l.1838); the paper says "Baltic statisticians" | Reword |
| 121 | 02_method:41 | wbinputoutput1987 [66–9] | DISS MATCH | l.5237 | – |
| 124 | 02_method:43 | wbinputoutput1987 [66–89] | DISS PAGE DIFFERS (minor) | Diss gives [66-69, 82-85, 86-89] (l.1968) | optional |
| 131 | 02_method:59 | wdi2024 | DISS MATCH | l.6039 | – |
| 137 | 04_limitations:15 | wdi2024 | DISS MATCH | l.1138, l.5997–6018 | – |
| 157 | 04_limitations:27 | lobellschonkrantz2008 [148–53] | DISS MATCH | l.1775 | – |
| 219 | 05_implications:35 | wb1993estonia [216] | SUPPORTED | "In 1985, 13,500 dwelling units ... 1989 when 9,500 ... 1991 to about 5,200" | – |
| 222 | 05_implications:41 | wb1993estonia [1–8] | SUPPORTED | p.7 terms of trade and currency board; p.6 trade disruption | – |
| 247 | T10_trade:27 | mitchelstat | DISS SOURCE DIFFERS | Diss trade table (l.3307) cites LIDA, jonsson1999, worldtrade1949 and balticstates1938, not Mitchell | Confirm what the R script used |
| 249–251 | T11:39 | cronin / kirk [246–77] / bostonencikl [528] | DISS MATCH | l.1503 | – |
| 253–255 | T11:39 | mitchelstat / ostlandinzahlen [2] / sov_labour1939 [395, 409, 418] | DISS MATCH | l.1503; diss also lists biuletenis19393 [91] and Jonsson [24], which T11 omits | check |
| 257 | T1:30 | wbinputoutput1987 | DISS MATCH | l.1167 | – |
| 262 | T3:29 | wdi2024 | DISS MATCH | l.6038 | – |

## Summary
SUPPORTED 3, PARTIAL 2, DISS MATCH 20, DISS PAGE DIFFERS 3, DISS CLAIM DIFFERS 3, DISS SOURCE DIFFERS 1, CITED ELSEWHERE ONLY 2, UNVERIFIABLE 0.
Action: 82, 74, 11/57, 113, 247, 50, 107, 92, 112/124, 254.
