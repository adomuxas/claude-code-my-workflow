# Plan: fix the citation problems found by the fresh Latvia audit

**Status:** APPROVED · **Date:** 2026-10-18 · on approval copy to `quality_reports/plans/2026-10-18_latvia-citation-fixes.md`
**Branch:** `fix/latvia-fresh-citation-audit` (from main)

## Context
The fresh audit (`quality_reports/verification/fresh_audit_latvia/SUMMARY.md`, `report_1–6.md`, `report_D1.md`, `report_D2.md`) checked all 416 citations in `Paper/latvia/` and its generated tables. Against project copies (334): 1 not supported, 3 wrong page, 57 partly supported, 3 edition, 4 missing pages. Against the dissertation (82): 77 match; 5 cannot be checked against either. It also found 2 wrong bib entries, two data inconsistencies (T1 industry, T5 service row) and one wrong date (Estonia's 1913 regain year).
Goal: every citation supports its sentence on the cited page, or the sentence is narrowed to what the sources say. The paper's own series is not changed.

User decisions (2026-10-18):
- **T1 industry (3,190.8 vs Bolotin 2,888.9):** keep the numbers. Add an author note in the text, highlighted in yellow.
- **T5:** follow the thesis Table 3.6. Latvia has no 1919–40 service-sector row, and labour productivity is dated 1919–40.

Defaults taken from the Estonia fix plan (`2026-10-17_estonia-citation-fixes.md`):
- **Kasekamp:** re-cite to the 2010 edition in the project (`kasekamp2010`, already in `bibliography_additions.bib`).
- **Unverifiable pages:** keep the work and drop the page, as the dissertation does. Log each one.
- **Partial support:** narrow the wording rather than add new sources.

## Rules for every fix
1. Re-open the cited page file before changing any fact, figure or page: newsources `pNNNN.txt`, or `$SP/pdftext/<key>/` with the offset given in the report.
2. Add a citation only for a page that has been opened, and log a verbatim quote of 25 words or fewer.
3. A number from the paper's own series is stated as the paper's estimate (macro or table), never attributed to an outside source.
4. Log every change in `fresh_audit_latvia/fixes_applied.md`: id | file:line | before | after | evidence.
5. Table notes change only through `scripts/R/latvia_tables.R` or the `Data/*.csv` inputs, never in `Tables/latvia/*.tex` directly.

## Fixes by file

### `Paper/latvia/main.tex` (preamble)
- Add `\usepackage{xcolor}` and a macro `\authorcheck{…}`: a yellow `\colorbox` around a full-width `\parbox`, so author notes stand out in the PDF.

### `sections/01_intro.tex`
- **l.6, id 2:** `corum2013` → `Corumbalticrussia` [129], following the dissertation (l. 418).
- **l.12**
  - Id 21: norkusdvides [322–3] → [323]; "in Europe" → "in Eastern Europe".
  - Id 23: van Selm p.35 is GNP per head for 1988, and only Latvia and Estonia lead. Narrow to that, and keep `hiden_salmon` [127] for the living-standards claim.
- **l.14, id 28:** kukic_soviet → [670].

### `sections/02_gap.tex`
- **l.7, id 42:** Misiunas & Taagepera p.361 runs only to 1980, so the sentence says "to 1980".
- **l.9**
  - Id 46: wbtransitionlatv [4, 228–9] → [4], since the appendix pages are not in the copy and the dissertation cites no page. p.4 supports growth only, so the sentence attributes only growth to it.
  - Id 48: Maddison pp.307–8 reject official NMP-based growth in general. Drop "inadmissible" and the claim that he judged the specific GDP/NMP-ratio short cut.
- **l.11**
  - Id 63: Aizsilnieks → [790, 834].
  - Id 65: Köll's "blank spot" → "the late Soviet period".
  - Id 67: M&T p.289 → "e.g." form.
  - Id 71: Koropeckyj → "Latvia and Estonia" at the level of Britain and Australia, [68, 72].

### `sections/03_method.tex`
- **l.9, id 91:** kukic → [646, 670–1].
- **l.15**
  - Id 97: Maddison [307] → [307–8].
  - Id 98: vonyo2017 → [6].
  - Id 95: "single deflation" → Thomas & Feinstein's "indicator approach" (p.444 distinguishes the two).
- **l.19, the Bolotin paragraph**
  - Id 104: drop "the first systematic attempt".
  - Id 106: drop "Bolotin started from the republican GDP totals … compiled by Goskomstat in 1990–1". Keep the Gulāns clause on 1990 accounts.
  - **T1 author note:** after this paragraph, add a highlighted note:
    > `\authorcheck{Author check: Table~\ref{tab:benchmarks} gives 1990 industry as 3,190.8 m roubles; Bolotin's 5.2 bn dollars at his industry parity of 1.80 give 2,888.9 m (all other sectors reproduce exactly). The dissertation carries the same uplift (+307.2 Lithuania, +259.0 Estonia). State the adjustment here and in the T1 source note.}`
- **l.23**
  - Id 115: wbtransitionlatv [228–9] → no page.
  - Id 118: wbinputoutput1987 [66–89] → no page, as in the dissertation (l.1838).
  - Id 117: detach the Total Economy Database clause from UNECE1995 and narrow it, as no source in hand supports it.
- **l.25, id 119:** "Baltic statisticians" → "a senior official of the Lithuanian SSR's statistical office" (Adlys 1988; dissertation l.1838).
- **l.43, id 131:** the CIA made no productivity allowance (cia1982a p.49). New wording: "Finance and insurance follow employment, as in the CIA's estimates, here adjusted for productivity with the ratio of trade turnover to trade employment; housing follows the housing stock …". Cite [46, 49]{cia1982a}, and keep Maddison [319] only for "employment as a proxy".
- **l.51, id 135:** drop `bolt_zanden_newgdp2021` [30]. Keep `maddison_project_paper2014` [629], as the dissertation does (l.1715).
- **l.55, id 142:** norkusdvides → [323], "Eastern Europe".
- **l.65**
  - Ids 150 and 151: IMF → [7, 11]. Rephrase the Hamilton & de Vries clause: levels come from the latest official data, extrapolated backwards (p.17). Drop "shallower decline" as a claim attributed to them.
  - Same paragraph, 05_baltic l.67: "backward extrapolation from mid-1990s benchmarks" → "from recent official levels".
- **l.69, id 155:** "Following \textcite[30]{bolt_zanden_newgdp2021} … converted to Int$2011 at 1.594", with 1.594 attributed to `\textcite{mpd2023}` (no page) and p.12 removed. This follows the Estonia fix.
- **l.73, id 158:** "early 1980s" → "around 1980".
- **l.81**
  - Id 159: drop `gerschenkron1957`. New wording: "this is the `Gerschenkron effect': Bergson's GNP for 1928–37 grows by 175 per cent at 1928 prices and by 62 per cent at 1937 prices", citing feinsteinthomas2002 [517] (already co-cited; supports the figures) and jonassardy1970 [85] for the name. Remove "for Soviet machinery". Leave the bib entry unused, with its pages corrected to 450–457.
  - Id 162: cia1990 [8] → [6–7].

### `sections/04_latvia.tex`
- **l.21, id 178:** M&T [32] → [32–3]. The March 1941 withdrawal is confirmed by Krūmiņš p.188 ("1941. gada 25. martā bez iepriekšēja brīdinājuma"); extend that cite to [183–8] (already so). Terleckas stays for the lat rate (p.290).
- **l.25**
  - Id 202: Labsvirs [86–99] → [94], with wording that matches it (kolkhoz land 83 per cent at 1 January 1950). Alternatively, if the 85 per cent farm figure comes from Table 11, cite the T11 sources for it.
  - Id 208: align "little more than half" (grain yield) with Labsvirs 7.4 vs 13.1 (56%) and cite Labsvirs for it; Krūmiņš (43%) stays for 1958 milk and meat.
- **l.27**
  - Id 213: Strods supports only the 1959 purge; move the footnote details onto Smith [249–50] and Grybkauskas [487–8].
  - Id 217: M&T add [228]. Keep the Latvia-vs-Estonia lobbying comparison on Krūmiņš [259–65] (p.263 supports it).
  - Id 219: Andreenkov keeps grain imports and the 1962 price rise; bread rationing rests on belkharoev2024 [17–19] (add page, id 218), and "only price rise" on Krūmiņš [299].
- **l.29**
  - Id 226: wbtransitionlatv [101–6] → [103–4]. The All-Union output share rests on gulans [34] ("a third to nearly two-fifths").
  - Id 228: check whether "from the late 1970s" stays on M&T p.222 ("After 1975"); otherwise "the 1980s".

### `sections/05_baltic.tex`
- **l.41**
  - Id 256: the regain years follow the paper's own series. Add `ltREGAINthirteen` and `eeREGAINthirteen` to `latvia_tables.R` next to `lvREGAINthirteen` (l.969); a read-only check gives Lithuania 1923, Estonia **1929**, Latvia 1930. Replace the hard-coded "1923"/"1925" with the macros. Norkus et al. p.6 (1923/1924/1930 on their data) is cited for the explanation only.
  - Id 258: `baltichistorykasekamp2017` [115] → `kasekamp2010` [113–15]. The currency dates rest on the other cites, or are checked in kasekamp2010.
- **l.43**
  - Id 270: soften "economic nationalism" to import substitution and protection; add Klimantas2024 [11, 36].
  - Id 271: Aizsilnieks [683] → [713, 835].
- **l.53, id 285:** present the famine and procurement reasoning as the authors' own; Labsvirs [92] carries the herds only.
- **l.57**
  - Id 289: Kasekamp → `kasekamp2010` [154–5].
  - Id 293: gatis_lv_eh → [278, 305]; drop "disproportionate" or rest it on gulans [34].
  - Ids 296 and 298: thesis → [192]; narrow the Vaškela clause to 1946–60.
- **l.59, id 305:** Smith ties the purge to language and education. Leave the immigration and consumption motive on M&T [143] and Krūmiņš [262–3] (id 304: add the page).
- **l.61:** CIA 1990 → [2, 4] with hedged wording (id 308). Grybkauskas supports only the investment shift (ids 310 and 352).
- **l.63, id 315:** Krišjāne supports urbanisation and housing only; narrow the clause.
- **l.67**
  - Ids 317 and 319: rewrite the machine-building sentence to the project sources.
    - The minibus industry "supplied 14,000–17,000 vehicles a year in the 1980s and had closed by 1998" (thesis [39]; Šiliņš [928]).
    - Machine-building was "over a quarter of industrial output in 1990 (27.9 per cent)" (Šiliņš [925–6]) and "nearly 7 per cent of GDP" (thesis [39]).
    - "By 1995 its two largest branches produced about a quarter of their 1990 output" (Šiliņš [927]).
    - Drop "Jelgava plant capacity of 17,000".
  - Id 321: Grennes [9, 21] → [9].
- **l.71**
  - Id 330: soften the Åslund clause.
  - Id 329: transition_progress → [452, 454].
  - Id 332: thesis → [42].
- **l.73**
  - Id 341/342: "contracted in each year since 2021" → "contracted in each year from 2022 to 2024" (Povilauskas p.12); Tsaurkubule p.159 only for the EU-relative fall.
  - Id 345: OECD 2024 → [17, 23].
  - Id 343: thesis → [205].
- **l.89, id 348:** thesis → [210].
- **l.95, id 351:** M&T [236–7] only for the labour reserve. Mechanisation reaching Soviet levels and the eroded educational lead rest on the thesis [217].

### `sections/06_conclusion.tex`
- **l.9, id 356:** Vaškela ties skills to the pre-1914 industrial heritage. Change "the interwar republic" to "the pre-war industrial tradition", or drop Vaškela from that clause.

### Tables (`scripts/R/latvia_tables.R`, `Data/`)
- **T5, `Data/latvia_sensitivity.csv`**
  - Delete the Latvian row "Incorrect service-sector evaluation; 1919--40".
  - Set "Labour productivity and real-wage estimates" years to 1919--40.
  - The `\midrule` position is computed from the 1919 rows, so no code change is needed.
  - Check that no text cites the ±3.
- **T1 source note (R):** no number change. The "two aggregates" wording stays: it is this paper's grouping and the note already says so.
- **T9**
  - Id 415: balticstates1938 [123, 161] → [122, 155].
  - Id 408: compare the agricultural-employment cells in `Data/baltic_structure_shares.csv` with Morys Table 7.7 (p.181). Cite Morys only for matching cells. For the others, find the cell source in the dissertation (l.3743 table); if it is not found, add an `\authorcheck` item in the text next to Table~\ref{tab:structure}.

### Bibliography
- **`east_industry_periphery1871`:** editors O'Rourke, K. H. and Williamson, J. G.; the book title moves from `series` to `booktitle`.
- **`gerschenkron1957`:** pages 450–457.
- **`cameh_sectoral1945`:** `series` → `booktitle`.
- **`aslund_myth`:** @techreport, Carnegie Endowment Working Paper No. 18.
- **`bitans_2012_development`:** add book title and publisher from `_bibinfo.txt`.
- **`years_of_dependence`:** publisher University of California Press and expanded edition, from the copy.

## Left as is (listed for the author, no change)
- `bergson1950`: only the 1953 book is in the project. The dissertation cites the same.
- Ponomarenko pages: the copy is an unpaginated manuscript.
- `wbtransitionlatv` [289] and [286]: the appendix is missing, but both pages match the dissertation (ids 123, 127).
- 77 dissertation-only citations: consistent with the dissertation, not checked against the originals.

## Verification
1. `Rscript scripts/R/latvia_tables.R`: regenerates `Tables/latvia/*.tex` and `numbers.tex`. Diff: only T5, T9 notes and the new REGAIN macros change.
2. Build in `Paper/latvia/` (XeLaTeX → biber → XeLaTeX ×2, TEXINPUTS as in the memory note). Require 0 undefined citations or references and no new overfull boxes (> 5 pt).
3. Re-grep the edited lines for every id in `fixes_applied.md`, and confirm each cited page is the one quoted.
4. Visually confirm the yellow `\authorcheck` box(es) render in `main.pdf`.
5. Run the proofreader and domain-reviewer agents on the changed sections, and score against the quality gate (≥ 80).
6. Commit on the branch, open a PR and merge. Update the session log and `fresh_audit_latvia/SUMMARY.md` with a "fixes applied" section.
