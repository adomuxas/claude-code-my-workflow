# Fresh citation audit — Estonia paper — batch D1

(Saved by the orchestrator from the verifier's final message; the harness blocked subagent writes.)

- Batch D1, 35 instances, 18 keys. No key has a project-file copy (searched newsources names/_bibinfo, estonia_paper_literature MANIFEST, Papers/, master_supporting_docs/, $SP/pdftext). All instances went to the dissertation check. "l." = line in `klimantas2024dphil.tex`; "p." = thesis printed page (PDF − 18, verified).

## Source location / bib
All 18 keys: not in project files. mpd2020 values are quoted in Norkus 2023 p.155. Bib: all OK except ceska1989 (MINOR: volume title in `series`, not `booktitle`), assessingCIA1988 (MINOR: booktitle should read "Soviet Economy on the Brink of Reform"; editor Wiles and publisher missing; diss bib gives 2014 reprint), UNECE1995 (MINOR: no publisher), bolt_zanden_newgdp2021 (entry OK at pp.29–51, but cited at p.12, outside the range).

## Grades
| id | file:line | key [post] | grade | note |
|---|---|---|---|---|
| 14 | main.tex:135 | mpd2020 [via Norkus 155] | DISS SOURCE DIFFERS (secondary route supported) | Diss uses MPD 2023 / Maddison 2006; Norkus p.155: "Taking MPD 2020 data at face value, in 1989, Estonia ... 18,779 int$ 2011" |
| 43 | main.tex:155 | taagepera_coll01 [265] | DISS CLAIM DIFFERS | Diss l.819 (p.32) cites p.265 for 6% (start 1949) and 80% (start 1950) collectivised; "two-thirds by May 1949" not in diss |
| 44 | main.tex:155 | deportations_ee [12] | DISS CLAIM DIFFERS | Diss l.819 cites p.12 for 45,000 deported 1940–53 (35,000 from 1948); "some 20,000 in March 1949" not in diss |
| 61 | main.tex:163 | maddisonworldeconomy [181–2] | DISS MATCH | l.1088 [182], l.1136 [181] |
| 63 | main.tex:163 | ceska1989 [593] | DISS MATCH | l.1057 |
| 72 | 02_method:15 | bergson1961 | DISS MATCH | l.1090, no page in either |
| 75 | 02_method:15 | assessingCIA1988 | DISS MATCH | l.1095 |
| 76 | 02_method:15 | becker1994 | DISS MATCH | l.1095 |
| 78 | 02_method:15 | assessingCIA1988 | DISS: CITED ELSEWHERE ONLY | Khanin is not mentioned in the diss; Navrozov is cited only for the CIA-overstatement view |
| 81 | 02_method:15 | becker1994 | DISS: CITED ELSEWHERE ONLY | "was not well founded" is Maddison's phrase (Maddison1998b p.3), which is co-cited; low risk |
| 94 | 02_method:25 | mpd2023 | DISS MATCH | l.4557 |
| 95 | 02_method:25 | bolt_zanden_newgdp2021 [12] | DISS SOURCE DIFFERS | Diss sources 1.594 to "page 12 in the MPD version 2023 paper" (l.443, 1131, 1138, 2442) |
| 108 | 02_method:29 | worldtables1995 [32–3] | DISS MATCH | l.1111 |
| 109 | 02_method:29 | UNECE1995 [249] | DISS MATCH | l.1113 |
| 127 | 02_method:51 | dagys1959 [140] | DISS MATCH | l.1051 |
| 128 | 02_method:51 | feinstein1972 [21] | DISS MATCH | l.1780; applying 'rough' to 1941–5 is new in the paper |
| 129 | 02_method:55 | bolt_zanden_newgdp2021 [30] | DISS SOURCE DIFFERS | Diss cites maddison_project_paper2014 [629] for the border convention (l.1715) |
| 130 | 02_method:59 | mpd2023 | DISS MATCH | l.1131, 1138 |
| 132 | 02_method:59 | bolt_zanden_newgdp2021 [12, 30] | DISS SOURCE DIFFERS for p.12; DISS MATCH for p.30 | l.2442 |
| 133 | 04_limitations:13 | feinstein1972 [21] | DISS MATCH | l.1780 |
| 136 | 04_limitations:15 | mpd2023 | DISS MATCH | l.1138 |
| 156 | 04_limitations:27 | swedengdp_15602010 [19] | DISS MATCH | l.2827 |
| 161 | 04_limitations:35 | kontorovich_2001 [688–9] | DISS SOURCE DIFFERS | Diss cites the 2% bound to Howard, hidden_inflation_sov p.607 (l.2828); it cites Kontorovich only for the suspicion of hidden inflation |
| 164 | 04_limitations:35 | shadow_europe [90–1] | DISS MATCH | l.2787 |
| 169 | 05_implications:7 | acemoglu_whynationsfail | UNVERIFIABLE | Not in project files and not cited in diss; general reference |
| 178 | 05_implications:27 | taagepera_coll01 [265] | DISS: CITED ELSEWHERE ONLY (likely miscitation) | 1939–45 population fall of a fifth is not in the diss; the 1979 article on the collectivisation taxation phase is an implausible source |
| 179 | 05_implications:27 | deportations_ee [12] | DISS: CITED ELSEWHERE ONLY (likely miscitation) | A list of persons deported 1945–53 cannot document losses in 1939–44 |
| 246 | A1_series:17 | bolt_zanden_newgdp2021 [12] | DISS SOURCE DIFFERS | as 95 (fix in scripts/R/tables.R) |
| 248 | T10_trade:27 | mpd2023 | DISS: CITED ELSEWHERE ONLY | Diss trade tables do not cite MPD; data source, low risk |
| 261 | T3_overlaps:29 | mpd2023 | DISS MATCH | l.1131 |
| 263 | T3_overlaps:29 | feinstein1972 [21] | DISS MATCH | l.2596, l.1780 |
| 266 | T4_previous:30 | mpd2020 [via Norkus 155] | DISS SOURCE DIFFERS (secondary route supported) | as 14 |
| 269 | T5_growth:27 | mpd2023 | DISS MATCH | |
| 272 | T8_relative:31 | mpd2023 | DISS MATCH | |
| 275 | T9_interwar:30 | mpd2023 | DISS MATCH | |

## Summary
DISS MATCH 20; DISS SOURCE DIFFERS 7; DISS CLAIM DIFFERS 2; CITED ELSEWHERE ONLY 5; UNVERIFIABLE 1 (169).
Action, most serious first: 178/179 (wrong sources for the 1939–45 population fall); 161 (Kontorovich vs Howard); 95/132/246 (p.12 outside bolt_zanden pp.29–51, belongs to the MPD 2023 paper); 129 (cite maddison_project_paper2014, 629); 43/44 (figures not in diss, confirm on page); 78 (Khanin attributed to Navrozov).
