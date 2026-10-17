# Round-2 fixes (from the re-check verifier, the domain reviewer and the proofreader)

Apply with the rules in `FIXER_BRIEF.md`: re-open any page whose figure you touch, use the Edit tool only, no compile, no R run, return a change log as text. Wording below is a guide. Keep the paper's style (British, EHR, `\autocite` in footnotes) and keep edits minimal.

## Major
1. **04_limitations:25/27, single deflation vs the indicator approach.** l.27 bounds the error with Swedish single- vs double-deflation evidence, but l.25 now says the paper uses the indicator approach. Rewrite the opening of l.27 along these lines: "No comparison of the indicator approach with double deflation exists for an industrialising economy; the nearest evidence, from the Swedish historical national accounts, compares single- and double-deflated series …\footnote{[19] swedengdp}. Since Thomas and Feinstein find single deflation markedly less accurate than the indicator approach,\footnote{\autocite[443--4]{thomasfeinstein2003}.} the Swedish discrepancies give a generous bound on the size of the error, though not on its sign." Keep the Swedish 4/17 per cent figures and the lobell cite. Change the interwar reasoning ("input costs outside agriculture moved little") to one about slow technical and structural change outside agriculture. Check that the rest of the paragraph still reads; the Berend sentence fits. Also drop the now-duplicate earlier `[443--4]{thomasfeinstein2003}` footnote in l.25 if the next footnote repeats it.
2. **Adirim Table 3 (p.53): five benchmark years only (1965, 1970, 1975, 1980, 1983).** It measures the share of accumulation and defence spending in national income used.
   - 05_impl:35: replace "stayed below the Soviet average from 1965 to 1983" with wording such as "was below the Union average in each of Adirim's benchmark years from 1965 to 1983, the gap widening from 4.6 points in 1965 to 6.7 in 1983, although the Union figure includes all-Union military outlays". Do not present it as proof of withholding after 1968; it was also below average in 1965.
   - 05_impl:33: make the wording consistent ("the share of accumulation in the national income it used was below the Union average from 1965, the first year for which it can be compared").
   - 05_impl:27: delete the clause "in which the investment ratio was still below the Soviet mean even on official data" (no source covers the 1940s). Also: "with a fifth of the population gone" → "with some 15 per cent of the population lost", since about 6 points were the ceded districts. Optionally mention the 1939 resettlement of the Baltic Germans among the losses (open Misiunas & Taagepera or Kasekamp first if you cite it).
   - 06_finland:13: "high investment" → "high investment per head".
3. **Kõll 1994, cited for opposite positions.**
   - 05_impl:13: "pre-war industry had been built to serve Russia, and Kõll argues that its slow recovery after that market was lost owed as much to the weak competitiveness of Estonian producers in Western markets as to the loss itself" [199–200].
   - 06_fin:9: "its industry, built for a Russian market it had lost, struggled to compete in the Western markets that replaced it", citing Kõll [199–200] for competitiveness and [203] for quotas.

## Numbers
4. **05_impl:41, heavy-industry shares.** Bolotin's printed Table 5 (p.190) gives Estonia 40.5, Latvia 48.2 and Lithuania 53.4. The paper's 55 comes from the authors' reallocation in `Data/Analysis 20251111.xlsx` (Sectoral sheet: Lithuanian machine-building 1,252m roubles; 35m of metals moved out of "other"). Use "41 per cent … against 48 in Latvia and 53 in Lithuania", following Bolotin, so the cite matches. Fix the footnote: "converted back to roubles at his sectoral parities". Check on the page image whether Table 5 is value-added. If Bolotin has branch-specific parities, say so; if he has only one industry parity, drop the conversion remark.
5. **05_impl:29, electricity.** Ahde Table 12 gives 11,575 GWh in 1970; Misiunas & Taagepera p.239 give 10bn produced and 3.5bn consumed. Write "from 2 billion kilowatt-hours in 1960 to nearly 12 billion in 1970 (Ahde), roughly two-thirds of which, on Misiunas and Taagepera's figures, was consumed outside the republic", or similar, citing each for its number.

## Attribution and wording
6. **02_method:15.** "Maddison's review concluded that most of the criticism `was not well founded', and the assessments by Becker and by Schroeder and the survey by Vonyó and Markevich … reach a similar verdict." Put `\autocite{schroeder1995}` back in that footnote, which is a dissertation match: l.1095 cites becker1994 and schroeder1995 together.
7. **02_method:31, Adlys.** Soften: "the window-dressing of earlier plan returns having been publicly admitted in 1988 by a senior Soviet statistician in a neighbouring republic, the deputy head of the Lithuanian SSR's State Committee for Statistics". Check the dissertation l.993/1083 wording first and match what Adlys admitted.
8. **04_limitations:19.** "Three considerations" → "Four considerations" (First to Fourth follow; check). Name Gerschenkron's study with "as Jonas and Sardy summarise".
9. **02_method:9.** If the method is described as "constant-price indices of sectoral value-added", make it consistent with the indicator approach, e.g. "volume indicators of sectoral value-added". Check the sentence first and change it only if it is inconsistent.
10. **The 1.594 ratio.** Use one source everywhere. 02_method:59 says "Following Bolt and van Zanden" [30] of bolt_zanden_newgdp2021. Keep [30] only for the 1990-vs-2011 benchmark point (dissertation l.2442 supports it) and credit 1.594 to mpd2023, as at l.25 and in the A1 note.
11. **Harmonise:**
    - Clark as cited in Valge: use [2725--6] at both main:135 and main:161.
    - wb1993estonia: [1--8] at 05_impl:41 → [2--7].
    - main:135 "Statistics Office" → "Statistical Office".
    - 05_impl:27 "the districts east of Narva and of Petseri" → "the districts east of Narva and most of Petseri county".
12. **main:151.** Kasekamp p.71 says land purchase began in the 1850s and Eellend p.152 says "since the 1860s". Phrase it as "from the mid-nineteenth century", or follow Kasekamp, the cited page.
13. **05_impl:35.**
    - Drop the footnote clause that oil-shale mining levelled off after natural gas arrived (the text repeats it); keep the citations.
    - Eastward shift: "from the late 1960s" (Dienes 1972 cannot cover the 1970s; CIA 1990 covers them).
    - Ahde [60, 62] does not contain the 13,500 and 5,200 completion figures: attach wb1993estonia [216] to them if it is not already.
14. **05_impl:33.** "Estonia's high measured output was not the product of net transfers, which became significant only after 1979, when its relative position was long established; transfers affected what the republic consumed rather than what it produced." Check against the van Selm & Dölle figures already cited.
15. **04_limitations:35, Howard bound.** Add a short clause giving the arithmetic of "at most 2 per cent of GDP" if the dissertation (l.2828 and the surrounding table) states it. Otherwise leave it.
16. **06_finland:13.** "Between one and a half and two points a year" → "about one and a half to two points", but check it against the macro values used in the same paragraph.

## Proofreading (adopt)
- main:133: "…so that it cannot be charged…" → "…so that the gap of 1991 cannot be attributed to Soviet rule alone".
- main:135: fix the misplaced "converted" ("scaled to a 1990 level taken from UNECE's purchasing-power-parity series in 2005 dollars and converted to 1990 dollars with a consumer price index").
- main:163: "…had warned against, since the ratio varied across countries and over time, not least because the list of `productive' sectors itself differed, and that overstates…".
- 02_method:29: "…gave GDP growth rates for 1980--91, taking those for 1989--91 from the Statistical Office, but these estimates were discontinued and no current series reproduces them;".
- 04_lim:25: "a procedure that Thomas and Feinstein call the indicator approach".
- 05_impl:15: "…only after Estonia devalued and pegged the kroon to sterling in June 1933".
- 06_fin:7: "turned both into economies of family farms".
- 06_fin:13: "by bilateral trade with the Soviet Union".

## Bib / tables
- `bibliography_additions.bib`, koll1998results: `@incollection` → `@inbook`, to match how koll1998policy etc. print. First check the type of the sibling koll1998policy; if it is @incollection with bookauthor and prints fine, leave it as is. Use the same type as the siblings.
- New Ojala-volume booktitles: sentence case, "The road to prosperity: an economic history of Finland".
- T11 (`scripts/R/tables.R`): the header and caption say "c. 1930" for agricultural employment, but the note says "closest to 1935" and the text says 1934. Make them consistent, e.g. header "c. 1935". Check the caption string in tables.R.
