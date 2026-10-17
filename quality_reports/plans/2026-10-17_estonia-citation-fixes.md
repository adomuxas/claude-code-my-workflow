# Plan: fix the citation problems found by the fresh Estonia audit

**Status:** APPROVED · **Date:** 2026-10-17 · copy to `quality_reports/plans/2026-10-17_estonia-citation-fixes.md` on approval

## Context
The fresh audit (`quality_reports/verification/fresh_audit_estonia/SUMMARY.md`, `report_1–5.md`, `report_D1.md`, `report_D2.md`) checked all 275 citations in `Paper/estonia/`. It found:
- 3 citations not supported, 4 on the wrong page, and 47 partly supported;
- 24 that diverge from the dissertation;
- 2 wrong bib entries and about 14 minor bib errors.

Goal: every citation supports its sentence on the cited page, or the sentence is narrowed to what the sources say.

Decisions already made:
- **Scope:** all substantive problems plus the bibliography. Purely optional pinpoint pages are skipped.
- **Editions:** switch only where needed. Kasekamp is re-cited to the 2010 edition in the project. The Mertelsmann 2024 citations stay and are listed for the user.
- **Acemoglu & Robinson 2012:** kept as is.

## Rules for every fix
1. Re-open the cited page file (newsources `pNNNN.txt`, or `$SP/pdftext/<key>/pdfNNNN.txt` using the offset in the report) before changing any fact, figure or page.
2. A new citation may be added only for a page that has been opened. Log a verbatim quote of 25 words or fewer for it.
3. Where no source in the project supports a clause, prefer narrowing the sentence over adding an unverified citation.
4. A number that comes from the paper's own series is said to be the paper's own estimate and points to the table or appendix, not to an outside source.
5. Log every change: `fresh_audit_estonia/fixes_applied.md` (id | file:line | before | after | evidence).

## Fixes by file

### `sections/02_method.tex`
- **l.15**
  - Id 78: Khanin is attributed to Navrozov. Keep harrison1993 [144, 159] alone for Khanin.
  - Id 82: drop schroeder1995 from the "was not well founded" quote. The quote is Maddison1998b p.309 and is already co-cited.
  - Id 86: soften the Zhuravskaya claim to the growth of the literature.
  - Id 74: check Maddison1995a p.328. The dissertation cites only [139]. If p.328 is not verifiable, keep the work, drop the page and say so in the log.
- **l.17**
  - Id 88: Maddison 307 → 307–8.
  - Id 89: Vonyó does not mention double counting. Move "double-counting" to a source that has it, or detach it from the Vonyó cite.
- **l.21** (id 91): add Valge p.2483 (Table 38, industry and construction).
- **l.25, 59, and A1 table note** (ids 95, 132, 246): replace `bolt_zanden_newgdp2021[12]` with `mpd2023` and the page of the 1.594 ratio in the journal version. Find that page via the Bolt & van Zanden working paper p.12. If no copy is found, cite mpd2023 without a page.
- **l.29**
  - Id 103: "42 per cent" → "42.5 per cent".
  - Id 107: tighten the WB 1993 wording. The p.5 table is the Statistical Office's.
- **l.31** (id 113): "publicly acknowledged by Baltic statisticians in 1988" → "by the deputy head of the Lithuanian SSR's statistical office in 1988", following the dissertation (l.1838).
- **l.41** (ids 119, 122)
  - Thomas & Feinstein: employment is a "last-resort" proxy. Drop the unsupported qualifiers.
  - Maddison 312 → 310, 312.
- **l.47** (ids 125, 126): rewrite. The CIA used unadjusted employment for credit and insurance, as it had "no evidence … on which we could estimate a productivity allowance" (cia1982a p.49). The trade-turnover productivity adjustment is the authors' own choice.
- **l.55** (id 129): border convention → `maddison_project_paper2014`, p.629. Verify the page or rely on the dissertation's citation; the bib entry exists.

### `sections/04_limitations.tex`
- **l.13** (id 134): Broadberry & Burhop 2007 → 323–6, 329.
- **l.15** (id 141): De Broeck & Koen [22] → [5].
- **l.19** (id 143): drop gerschenkron1957 from the Soviet-machinery sentence and cite `jonassardy1970`. It is in the project and is about the Gerschenkron effect; take the page from its text. Keep feinsteinthomas2002 p.517.
- **l.25** (ids 152, 153)
  - Call the method "the indicator approach", not single deflation, as Thomas & Feinstein distinguish them.
  - Attribute "the next best procedure" to Fabricant, as quoted by Thomas & Feinstein, and add p.443.
- **l.35** (id 161): the 2 per cent hidden-inflation bound → `hidden_inflation_sov` p.607 (Howard, as in the dissertation l.2828). Keep Kontorovich only for the suspicion of hidden inflation.

### `sections/05_implications.tex`
- **l.15** (ids 170, 172, 175, 177)
  - Kõll 1994 rejects the lost-market explanation as insufficient. Reword to show her competitiveness argument.
  - Recovery: Kõll 1998 says signs appeared from 1932. Soften "recovered only after".
  - Textiles, food processing and co-operatives: re-cite the Kõll & Valge chapter pages that discuss them (pp.32–7, 171–5) after opening them; otherwise rely on norkus_denmarkisation.
- **l.27**
  - Ids 178, 179: replace taagepera_coll01 and deportations_ee for the 1939–45 population fall. Use the paper's own population series (state the data source in `Data/` or the online appendix) and, for the frontier transfer, a verified page in Misiunas & Taagepera or Kasekamp 2010.
  - Ids 183, 184, 186: drop feest2014 [79–109] or narrow it to [96]. Keep the 28% claim on klesment2009 p.257. Mertelsmann goes on the user's list.
- **l.29**
  - Id 189: electricity 1970 = 10 bn kWh per Misiunas & Taagepera p.239. Check whether 12 comes from Ahde Table 12 (11,575 GWh in 1970) and cite whichever figure is used.
  - Drop the 1960 figure unless Ahde Table 12 gives it.
  - "Two of the largest thermal stations in the Union" → "the world's two largest oil-shale power stations".
  - Ids 193, 195: Parming & Järvesoo → pp.35–41, 111. The 1989 share needs another source (the 1989 census via Kasekamp 2010 or Misiunas & Taagepera), opened and verified.
- **l.33**
  - Id 200: Koropeckyj gives a GNP-based 134% for 1970. Detach Koropeckyj from the 137–145% NMP range, which stays on schroeder1973.
  - Id 202: Bohnet & Penkaitis supports 1970–84 against the RSFSR only. Detach it from the 1960–70 / CIA claims.
  - Id 203: CIA 1972 supports only the per-capita investment ranking. The investment-share half stays on adirim1988 p.53.
- **l.35**
  - Id 210: Kolde goes to the labour-productivity clause only.
  - Id 211: Dienes → 441, 446.
  - Id 212: CIA 1990 p.2 goes to the eastward shift only.
  - Id 214: soften "lost its rationale"; drop "expensive to mine".
  - Id 218: Ahde [60, 66] → [60, 62]. The completion figures rely on wb1993estonia p.216.
- **l.41**
  - Id 223: Norkus 164–6 goes to the milder crisis only.
  - Id 225: find the source of 41/48/55. The likeliest is the paper's own 1990 sectoral data (heavy-industry definition in dissertation l.1988). If so, say "on the present estimates" and point to the table or appendix; if not traceable, drop the numbers. Remove bolotin1992 [184–6] from this claim.

### `sections/06_finland.tex`
- **l.7**
  - Id 230: Lepp & Pantti supports only the TV and "alter ego" point. Add bocharnikova2021 p.82 for Lutheranism and language, and narrow the other attributes or source them (Eellend p.152 for land purchase and literacy).
  - Id 238: the quote "cannot only be considered as the legacy…" → norkus2016 p.18, not norkus_restorations.
- **l.9**
  - Id 239: Bocharnikova → 81–2, 87.
  - Id 240: finlandeh01 [184, 198–200] → Hjerppe & Jalava pages after opening them (e.g. p.51).
  - Id 241: soften "Danish competition".
- **l.13**
  - Id 243: re-cite the post-1968 growth to the correct chapter pages (p.168; Kaukiainen pp.150–1, which needs its own bib entry).
  - Id 244: soften "favourable terms".

### `main.tex`
- **l.133** (id 8): Norkus 2016 shows near-parity in 1913. Rephrase his position: the gap had opened before 1940 and is not only a Soviet legacy.
- **l.135**
  - Id 12: Klesment et al. 1980–89 rests on the official rouble index. Reword "undocumented".
  - Ids 11, 57: Clark p.60. Open nothing new (not in the project). Re-attribute the 90% / 1925–34 bridge to Valge p.2725, citing Clark through Valge, as the dissertation does.
- **l.151** (id 28): Kasekamp 2017 [4–5] → kasekamp 2010 pp.70–1, 85. Add a bib entry for the 2010 edition.
- **l.155**
  - Ids 43, 44: keep feest2014 p.100, which supports both figures. Drop taagepera_coll01 and deportations_ee here, or keep them only if their pages are confirmed. Since they are not in the project, drop them.
  - Id 46: Parming & Järvesoo [158–217] → [111, 153–66]. The 1989 share takes the same new source as id 195.
  - Ids 50, 51: WB 1993 [1–8] → [2–7]. Korhonen → [443–5, 457].
- **l.161**
  - Id 53: drop or source the "each sector moved by less than 5 per cent" clause.
  - Id 54: 21 → "about 20 per cent", or move it to klesment2010 p.38 if the figure is from there.
- **l.163** (id 65): Vonyó & Markevich becomes general support only. Reword the attached clause.

### Tables (`scripts/R/tables.R` → `Tables/estonia/*.tex`)
- **T8, T9** (ids 271, 273): the source notes must credit Latvia 1913 to Norkus & Markevičiūtė 2021. Note the sources for 1919, 1995 and 2022 (as in `Data/`). Check the 1929/1932 values (2,351/2,286) against Klimantas2024's 2,349/2,288 and align them or explain the difference.
- **T10** (id 247): confirm in `tables.R` and `Data/` which trade source is used; correct the note if it is not Mitchell.
- **T11** (id 254): add biuletenis19393 [91] and Jonsson [24] to the note if those rows are used.
- **A1** (id 246): as in 02_method, replace bolt_zanden p.12.

### Bibliography (`Paper/estonia/bibliography.bib`, `bibliography_additions.bib`)
- WRONG:
  - gerschenkron1957: pages 450–457.
  - finlandeh01: keep it as the Hjerppe & Jalava chapter (pp.33–64) and stop citing pp.184–200 to it. Add a separate entry for whichever Ojala et al. chapter is cited.
- MINOR:
  - kenny_irelandgdp: 2025, 78(3): 877–906.
  - klesment2007: @collection, editors Klesment & Valge, RU Sari D 6.
  - case_estonia: @collection, editors.
  - thomasfeinstein2003: @incollection, booktitle *History Matters*.
  - cia1990: S. Prt. 101-123, US GPO.
  - ponomarenko2002: "Retrospektivnye".
  - alton_hungary: "and associates".
  - assessingCIA1988: booktitle *Soviet Economy on the Brink of Reform*, editor Wiles.
  - ceska1989: booktitle.
  - balticstates1938: drop the booktitle.
- NEW: kasekamp 2010 (1st ed.); Kaukiainen chapter if used. Check that `jonassardy1970`, `hidden_inflation_sov` and `maddison_project_paper2014` exist in the Estonia bib. hidden_inflation_sov does.

### Left for the user (no change)
- Mertelsmann 2024 page numbers (ids 183, 213), checked only against the 2022 manuscript.
- Ponomarenko pages (manuscript copy) and purre1965 (unpaginated copy).
- Online-first copies of Vonyó 2017 and Voskoboynikov 2021: issue pages are assumed from the offset.
- The 41 citations that match the dissertation but have no project copy.
- Acemoglu & Robinson 2012.

## Execution
1. Copy the plan to `quality_reports/plans/2026-10-17_estonia-citation-fixes.md` and log it in the session log.
2. Two fixer agents in parallel, split by file, following the rules above:
   - A: `main.tex`, `02_method`, `04_limitations`;
   - B: `05_implications`, `06_finland`, bib, `tables.R`.
   - They return their change logs as text, and the orchestrator saves them, because subagent report writes are blocked.
3. Regenerate the tables: `"/c/Program Files/R/R-4.5.0/bin/Rscript.exe" scripts/R/tables.R`.
4. Build in `Paper/estonia/`: xelatex → biber → xelatex ×2.
5. Review: an independent read-only verifier re-checks every changed citation against its page. Then run the domain-reviewer and proofreader on the changed passages, and fix what they find (up to 5 rounds).

## Verification
- The build has 0 errors, 0 undefined citations and 0 overfull boxes (>5pt). Check `main.log` and `main.blg`.
- `grep` confirms none of the removed key/page pairs remain: bolt_zanden [12], gerschenkron1957 at limitations:19, taagepera_coll01 and deportations_ee at implications:27, bolotin1992 at implications:41.
- The re-check verifier grades every changed citation SUPPORTED, or explains why not.
- Quality score ≥ 80 using the rubric in `constitutional-governance.md` (the .py scorer cannot run because `python` is not on PATH, so score by hand). Present the summary. Commit only when the user asks.
