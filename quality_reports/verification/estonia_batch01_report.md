# Citation verification report: estonia, batch 01

- Batch: estonia_batch01.tsv (ids estonia-77 to estonia-151)
- Instances: 75
- Distinct keys: 46
- 15 keys have a corpus folder. The other 31 keys (58 instances) have none: they were grepped in bibinfo_index.tsv by surname, with and without diacritics, by Cyrillic forms and by title words, with no hits.

## Citation grades

| id | file:line | key [postnote] | folder (short) | grade | supporting quote or problem | proposed fix |
|---|---|---|---|---|---|---|
| estonia-77 | 02_method.tex:15 | cia1990 | none | NOT IN CORPUS | No folder (cia_1990_* folders are different CIA papers: republics 1970-89; economic discontent). Unchecked. | |
| estonia-78 | 02_method.tex:15 | becker1994 | none | NOT IN CORPUS | Unchecked. | |
| estonia-79 | 02_method.tex:15 | schroeder1995 | none | NOT IN CORPUS | Unchecked (schroeder_1973/1983/1992 folders are other works). | |
| estonia-80 | 02_method.tex:15 | Maddison1998b [309] | none | NOT IN CORPUS | Unchecked; the quoted `was not well founded' cannot be verified. | |
| estonia-81 | 02_method.tex:15 | vonyoinmorys2021 [279--80] | vonyo_markevich_2021_economic_growth_structural (auto-match markevich_vonyo_..._economic_policy_state is the WRONG chapter) | PARTIAL | p. 280: "Although these estimates have not been accepted without controversy, they remain widely acknowledged as the best available." p. 279: "Physical output indicators are considered comparatively trustworthy". Supports "best available" and the physical-output basis, but not "errors in both directions" or that criticism "was not well founded" (that quote must come from Maddison 1998b). Pages 279-80 cover the CIA and Alton estimates together, not the CIA series alone. | Change "the recent survey by Vonyó and Markevich all reach the same conclusion" to "...and the recent survey by Vonyó and Markevich, which finds them still `widely acknowledged as the best available', all reach the same conclusion" (keep `\autocite[279--80]{vonyoinmorys2021}`). |
| estonia-82 | 02_method.tex:15 | ponomarenko2002 [16--18, 73--4] | none | NOT IN CORPUS | Unchecked (quotes `apparently of high quality', `rather primitive methodological base' not verifiable). | |
| estonia-83 | 02_method.tex:15 | zhuravskaya2024 [47--114] | zhuravskaya_et_al_2024_new_russian_economic | PARTIAL | p. 48: "Since this survey, there has been a major burst of new research on Russian and Soviet economic history." Also on p. 48: "...the opening of Soviet archives after the collapse of the Soviet Union". Supports the growth of the literature. The article does not say that the post-war quantitative core rests on physical-output series. Its Soviet GDP series is simply MPD/Maddison (2010) (p. 51 source note). | Narrow the postnote: `\autocite[48, 51]{zhuravskaya2024}`. |
| estonia-84 | 02_method.tex:15 | voskoboynikov2021 | voskoboynikov_2021_accounting_growth_ussr | PARTIAL | p. 3: "For the Soviet Union, the series is based on Central Intelligence Agency (CIA) data, and for Russia on Kuboniwa and Ponomarenko (2000), Ponomarenko (2002)". p. 5: GDP 1950-90 "based on GNP series at 1982 factor cost by industry of origin supplied by CIA". Supports a CIA-based Soviet series. Does not mention physical-output series. His own Russian series uses Ponomarenko's official accounts, not physical series. | Add pages: `\autocite[3, 5]{voskoboynikov2021}` (early-view pagination 1-25; map to 35(3): 870-94 if the final version is cited). |
| estonia-85 | 02_method.tex:17 | Maddison1998b [307] | none | NOT IN CORPUS | Unchecked. | |
| estonia-86 | 02_method.tex:17 | vonyo2017 | vonyo_2017_war_socialism_why | PARTIAL | p. 6 (online-first pagination): "Physical output indicators are considered comparatively trustworthy, but aggregates expressed in values are distorted by unrealistic producer prices, incorrect weighting...". Supports "distortions concentrated in value aggregates". Hidden inflation is mentioned only as the basis of Khanin's critique. Nothing on double counting in the material product system. | Add a page: `\autocite[253]{vonyo2017}` (online p. 6 = print p. 253 if the 248-274 pagination is a straight offset; verify). |
| estonia-87 | 02_method.tex:17 | harrison1993 [144, 152] | none | NOT IN CORPUS | Unchecked (quote `the ease of distortion remained greater for value series...' not verifiable). | |
| estonia-88 | 02_method.tex:21 | valge2003all [2718] | valge_2003_eesti_sisemajanduse_kogutoodang | WRONG PAGE | p. 2718 is only Table 45 (sector totals; 1938 primary 250.1, tertiary 154.9). The method and the 122.9 figure are on pp. 2713-14 (Table 41) and 2716 (Table 43). p. 2713 (Estonian): "Otstarbekam näib olevat arvestada tertsiaarsektori toodang nendelt aladelt elatist saavate isikute arvu põhjal" = "it seems more expedient to calculate tertiary output from the number of persons deriving their livelihood from these branches". Two further problems. (a) Valge's base is persons *deriving a livelihood* (incl. dependants: 445 kr per person, 276.1 thousand persons in 1938), not workers or the labour force. (b) Valge's 1938 housing (real-estate income) at current prices is 32.0 m kr (Table 42, p. 2715); 29 m is the figure at 1936 constant prices, yet the sentence calls 29.0 a current-price value. Industry 132.1 (85.7+11.7+22.0+2.3+10.4) and construction 14.0 do match Table 38 (p. 2483). | `\autocite[2713--16]{valge2003all}`. In the text: "For all other services Valge assumed uniform value-added per person deriving a livelihood from services and scaled a single figure by that population". Recheck housing: 32.0 (current prices) vs 29.0 (1936 prices). |
| estonia-89 | 02_method.tex:21 | klimantas2019 | none | NOT IN CORPUS | Unchecked. | |
| estonia-90 | 02_method.tex:21 | norkuslatvia1935 | none | NOT IN CORPUS | Unchecked. | |
| estonia-91 | 02_method.tex:25 | mpd2023 | none | NOT IN CORPUS | Unchecked (database). | |
| estonia-92 | 02_method.tex:25 | bolt_zanden_newgdp2021 [12] | none | NOT IN CORPUS | Unchecked. **Page 12 lies outside the bib page range 29-51**, so the postnote or the entry is wrong (the 1.594 conversion factor may be in the MPD 2020/2023 documentation instead). | Verify the page; if the chapter is pp. 29-51, `[12]` cannot be right. |
| estonia-93 | 02_method.tex:25 | klimantas2019 | none | NOT IN CORPUS | Unchecked. | |
| estonia-94 | 02_method.tex:25 | norkuslatvia1935 | none | NOT IN CORPUS | Unchecked. | |
| estonia-95 | 02_method.tex:25 | norkus_restorations [154] | norkus_2023_post_communist_transformations_ch_baltic_economic_growth | PARTIAL | p. 154: "In this year, Lithuania's GDPpc made up 63.3%, Estonia's 71.1% and Latvia's 79.1% of the Finnish figure." The 71% exists, but it is not Norkus and Markevičiūtė's own approximation, nor independent. It is "according to our ... and Valge's ... results". The Estonian 1938 figure behind it is the *alternative* 4,068 int$ 2011, obtained by "Applying Valge's growth rate in 1929-1938 to our estimate for 1929" (p. 128); 4,068/5,721 (Finland 1938, Table 8.4, p. 129) = 71.1%. Their own 1938 estimate, 3,796, gives 66%. | "...Norkus's approximation, which applies Valge's 1929--38 growth to the Norkus--Markevi\v{c}i\={u}t\.{e} estimate for 1929, gives 71 per cent (66 per cent on their own 1938 estimate).\footnote{\autocite[128--9, 154]{norkus_restorations}.}" |
| estonia-96 | 02_method.tex:27 | bolotin1992 [181--92] | none | NOT IN CORPUS | Unchecked. | |
| estonia-97 | 02_method.tex:27 | bolotin1992 [181, 184] | none | NOT IN CORPUS | Unchecked (parities 0.40/1.80/1.10/2.80/1.45/3.30/1.82 and quote `in practically full conformity' not verifiable). | |
| estonia-98 | 02_method.tex:27 | wbinputoutput1987 | none | NOT IN CORPUS | Unchecked. | |
| estonia-99 | 02_method.tex:27 | wdi2024 | none | NOT IN CORPUS | Unchecked (database; the Bulgaria/Ukraine 0.5% claim needs a series code or table reference). | |
| estonia-100 | 02_method.tex:29 | Maddison1998b [318--19] | none | NOT IN CORPUS | Unchecked. | |
| estonia-101 | 02_method.tex:29 | wbstatisticalhandbook1994 | none | NOT IN CORPUS | Unchecked. Probably the real source of the 16/47/38 shares (see estonia-102). | |
| estonia-102 | 02_method.tex:29 | wb1993estonia [1--8] | world_bank_1993_estonia_transition_market_ch_background_recent_developments (+ ch_industry) | NOT SUPPORTED | pp. 1-8 (Background chapter) contain no 1990 sectoral GDP shares; grepping the whole book finds no 16/47/38 split. Nearest: p. 85, Table 5-1, share of industry in GDP 1990 = 40 (industry alone, without construction). p. 97: agriculture "some 22 percent of national income". | `\footnote{\autocite{wbstatisticalhandbook1994}; for industry alone (40 per cent of 1990 GDP) see \autocite[85]{wb1993estonia}.}` or drop wb1993estonia here. |
| estonia-103 | 02_method.tex:29 | ponomarenko2002 [6, 15, 82] | none | NOT IN CORPUS | Unchecked (`was greatly overvalued'). | |
| estonia-104 | 02_method.tex:29 | wbtransitionest | world_bank_1993_estonia_transition_market_ch_background_recent_developments | PARTIAL | p. 2: "Between 1980 and 1989 real gross domestic product growth rates averaged only 1 percent per annum". Table 1-2 (p. 5) gives real GDP growth for 1989-91. The mission report gives GDP *growth* for the 1980s, not dollar GDP *levels* for 1980-91; nothing on discontinued publication (that is a claim about the series' later history). Same work as wb1993estonia (duplicate bib entry). | `\autocite[2, 5]{wb1993estonia}` (merge the duplicate key) and say "GDP estimates for 1980--91" rather than "levels". |
| estonia-105 | 02_method.tex:29 | worldtables1995 [32--3] | none | NOT IN CORPUS | Unchecked. | |
| estonia-106 | 02_method.tex:29 | UNECE1995 [249] | none | NOT IN CORPUS | Unchecked. | |
| estonia-107 | 02_method.tex:29 | UNECE1998 [199] | none | NOT IN CORPUS | Unchecked. | |
| estonia-108 | 02_method.tex:29 | GeigerTobias2018Cngd | none | NOT IN CORPUS | Unchecked. | |
| estonia-109 | 02_method.tex:29 | wbinputoutput1987 [66--89] | none | NOT IN CORPUS | Unchecked. | |
| estonia-110 | 02_method.tex:31 | adlys1988 | none (adlys_2009_zvilgsnis_tarybine_statistika is a different 2009 article; no 1988 admission there) | NOT IN CORPUS | Unchecked. The cited interviewee is a *Lithuanian* statistician (Tiesa, Vilnius). "Baltic statisticians" generalises from one Lithuanian official. | Consider "publicly acknowledged by the deputy head of the Lithuanian statistical committee in 1988". |
| estonia-111 | 02_method.tex:35 | valge2003all | valge_2003_eesti_sisemajanduse_kogutoodang | SUPPORTED | p. 2718, Table 45 (Estonian): "Majandussektorite netotoodangu väärtus jooksvates hindades" = "net output of the economic sectors at current prices", annual 1923-38, compiled from ESSCB publications (e.g. p. 2480 source line "Eesti arvudes 1920-1935"). | |
| estonia-112 | 02_method.tex:35 | klesment2007 | none (klesment_2008 / klesment_2009 / klesment_et_al_2010 are other works) | NOT IN CORPUS | Unchecked. | |
| estonia-113 | 02_method.tex:35 | kukk2005 [150] | kukk_2005_economic_damage_in_salo_et_al_white_book | PARTIAL | p. 150: "...production of uranium from Dictyonema shale... declaration of Sillamäe to be a closed town and formation of a loyal production area, free of Estonians". Confirms the Sillamäe uranium plant. Says nothing about exclusion from republican statistics, Dvigatel, or Estonia having fewer such plants than Latvia (no page in the folder supports that comparison). | Keep for Sillamäe. Delete "Estonia hosted fewer such plants than Latvia, but" unless another source is added. |
| estonia-114 | 02_method.tex:35 | ahderajasalu1992 [66] | ahde_rajasalu_1992_..._ch_structure_economies_branch | WRONG PAGE | p. 66 is about construction policy (90% of industry under all-Union/Union-republican subordination). Support is on **p. 35**: "several big enterprises of the munitions industry ('Dvigatel', 'Baltijets', Chemistry-Mechanics Integrated Plant of Sillamae, etc.) have been left out of the statistical reports." | `\autocite[35]{ahderajasalu1992}` |
| estonia-115 | 02_method.tex:39 | klesment2007 | none | NOT IN CORPUS | Unchecked. | |
| estonia-116 | 02_method.tex:41 | broadberryinmorys [22] | broadberry_malinowski_2021_living_standards_very_in_morys | NOT SUPPORTED | p. 22 says only that "GDP is normally calculated primarily from the output side, but also making use of some income data, particularly on wages", and introduces the pre-modern "short-cut" method (a food-demand function scaled by urbanisation, p. 23). Nothing about an industrial index from employment adjusted for real wages, or about it being second-best when industry's share is modest. | `\footnote{\autocite[427--8]{thomasfeinstein2003}.}` (drop broadberryinmorys here) |
| estonia-117 | 02_method.tex:41 | thomasfeinstein2003 [427--8] | none | NOT IN CORPUS | Unchecked. | |
| estonia-118 | 02_method.tex:41 | cia1982a [48] | none | NOT IN CORPUS | Unchecked. | |
| estonia-119 | 02_method.tex:41 | wbinputoutput1987 [66--9] | none | NOT IN CORPUS | Unchecked. | |
| estonia-120 | 02_method.tex:41 | maddison2010 [312] | none | NOT IN CORPUS | Unchecked. **Postnote inconsistent with the source.** maddison2010 is a @misc .xls spreadsheet ("horizontal-file_02-2010.xls"), which has no p. 312. Probably Maddison1998b p. 312 (the CIA procedure, cited for the same point at 04_limitations:21) was meant. | `\autocite[312]{Maddison1998b}` (verify) |
| estonia-121 | 02_method.tex:43 | valge2003all [Table 35] | valge_2003_eesti_sisemajanduse_kogutoodang | SUPPORTED | p. 2480 (Estonian): "Tabel 35. Tsemendi toodang, eksport, import, siseturule jäänud osa ning indeks (1929=100)" = "cement production, exports, imports, quantity left on the domestic market, and index". The 1922-27 index swings 34-119-35-70-76-30 (volatile). | Optional: `\autocite[2480, Table 35]{valge2003all}` |
| estonia-122 | 02_method.tex:43 | wbinputoutput1987 [66--89] | none | NOT IN CORPUS | Unchecked. | |
| estonia-123 | 02_method.tex:47 | Maddison1998b [319] | none | NOT IN CORPUS | Unchecked. | |
| estonia-124 | 02_method.tex:47 | cia1982a [48] | none | NOT IN CORPUS | Unchecked. | |
| estonia-125 | 02_method.tex:51 | dagys1959 [140] | none (dagys_nd_klaipedos_* are a different work) | NOT IN CORPUS | Unchecked. Dagys (1959) is about *Lithuanian* interwar national income (bib title: "...buržuazinėje Lietuvoje"). Citing it for the destruction of Estonian wartime archives looks like a content mismatch; check. | |
| estonia-126 | 02_method.tex:51 | feinstein1972 [21] | none | NOT IN CORPUS | Unchecked. | |
| estonia-127 | 02_method.tex:55 | bolt_zanden_newgdp2021 [30] | none | NOT IN CORPUS | Unchecked. | |
| estonia-128 | 02_method.tex:59 | mpd2023 | none | NOT IN CORPUS | Unchecked. | |
| estonia-129 | 02_method.tex:59 | wdi2024 | none | NOT IN CORPUS | Unchecked. | |
| estonia-130 | 02_method.tex:59 | bolt_zanden_newgdp2021 [12, 30] | none | NOT IN CORPUS | Unchecked. As estonia-92: p. 12 is outside the bib range 29-51. | Verify p. 12. |
| estonia-131 | 04_limitations.tex:13 | feinstein1972 [21] | none | NOT IN CORPUS | Unchecked. | |
| estonia-132 | 04_limitations.tex:13 | broad2007 [323--6] | none (auto-match battilossi_et_al_2010 is false, score 0) | NOT IN CORPUS | Unchecked. | |
| estonia-133 | 04_limitations.tex:13 | broad2008 [933] | none | NOT IN CORPUS | Unchecked. | |
| estonia-134 | 04_limitations.tex:15 | mpd2023 | none | NOT IN CORPUS | Unchecked. | |
| estonia-135 | 04_limitations.tex:15 | wdi2024 | none | NOT IN CORPUS | Unchecked. | |
| estonia-136 | 04_limitations.tex:15 | klimantas2026soviet | klimantas_2026_accounting_soviet_republic | PARTIAL | p. 6: MPD pre-1990 Baltic figures "are, however, problematic due to being derived from official Soviet net material product". p. 28: "This paper, which reduces previous MPD estimates by 17%". The MPD-vs-new comparison is developed for *Lithuania* only. Nothing on Estonia's MPD 1989 level or on comparing transition falls (p. 26 gives only Lithuania's 36% fall 1989-94). | `\footnote{A parallel comparison for Lithuania is made in \autocite[6, 26--8]{klimantas2026soviet}.}` |
| estonia-137 | 04_limitations.tex:15 | imf_transition [11] | havrylyshyn_et_al_1999_growth_experience_transition | SUPPORTED | p. 11: "No doubt the actual increase in the share of the latter [market services] was even larger, since this is where the highest proportion of unmeasured economic activity was most likely." | |
| estonia-138 | 04_limitations.tex:15 | hamilton_transition [17] | hamilton_de_vries_2025_structural_transformation_transition | PAGE MISSING | p0017.txt is empty: pp. 15-22 are appendices/references excluded from the corpus (manifest). The main text (pp. 4-5) describes the ETD-TE as covering 1990-2019, built from NSI/CIS sources, with Soviet-era sector growth trends used to interpolate 1991-95 (Georgia example). It does not say the series extrapolates from mid-1990s benchmarks or records a shallower decline. | Verify p. 17 (Appendix C) against the PDF. If unsupported, describe ETD-TE as "built from post-Soviet national statistics from 1990". |
| estonia-139 | 04_limitations.tex:15 | baltictransitioncontraction [22] | de_broeck_koen_2000_great_contractions_russia | PARTIAL | p. 22: "The analysis is based upon official statistics, with some minor corrections. These data suffer from various serious weaknesses." Also: labour "has tended to move into small-scale activities in agriculture and trade". Supports weak official data and a shift into small-scale trade. Says nothing about two series bracketing the true fall. | None needed if the citation is for measurement weakness. Otherwise move it next to "the new activities ... emerging unrecorded". |
| estonia-140 | 04_limitations.tex:19 | feinsteinthomas2002 [516] | none | NOT IN CORPUS | Unchecked (quote `will always show a greater increase...'). | |
| estonia-141 | 04_limitations.tex:19 | gerschenkron1957 [453] | none | NOT IN CORPUS | Unchecked. | |
| estonia-142 | 04_limitations.tex:19 | feinsteinthomas2002 [517] | none | NOT IN CORPUS | Unchecked (Bergson 175% vs 62%). | |
| estonia-143 | 04_limitations.tex:21 | jonassardy1970 [85] | none | NOT IN CORPUS | Unchecked. | |
| estonia-144 | 04_limitations.tex:21 | cia1990 [8] | none | NOT IN CORPUS | Unchecked (5.6->5.2, 3.2->2.4). | |
| estonia-145 | 04_limitations.tex:21 | cia1982a [23--4] | none | NOT IN CORPUS | Unchecked (`not large'). | |
| estonia-146 | 04_limitations.tex:21 | harrison1993 [156] | none | NOT IN CORPUS | Unchecked. | |
| estonia-147 | 04_limitations.tex:21 | Maddison1998b [312] | none | NOT IN CORPUS | Unchecked (`nothing untoward'). | |
| estonia-148 | 04_limitations.tex:21 | ponomarenko2002 [57, 62] | none | NOT IN CORPUS | Unchecked. | |
| estonia-149 | 04_limitations.tex:21 | alton_hungary | none | NOT IN CORPUS | Unchecked ("254 pages" not verifiable). | |
| estonia-150 | 04_limitations.tex:25 | thomasfeinstein2003 [443--4] | none | NOT IN CORPUS | Unchecked. | |
| estonia-151 | 04_limitations.tex:25 | thomasfeinstein2003 [427--8, 444] | none | NOT IN CORPUS | Unchecked (0.15-1 pp; `the next best procedure'). | |

## Bibliography checks

| key | folder | grade | problem and corrected field(s) |
|---|---|---|---|
| vonyoinmorys2021 | vonyo_markevich_2021_economic_growth_structural_in_morys | BIB MINOR | Authors, title, year, editor and publisher match. pages=277-299 but the chapter runs 277-302 (next chapter starts at 303) → `pages={277--302}`. The book title sits in `series`; it should be `booktitle={The economic history of Central, East and South-East Europe: 1800 to the present}`. key_folders auto-match (markevich_vonyo_..._economic_policy_state) is the wrong chapter. |
| broadberryinmorys | broadberry_malinowski_2021_living_standards_very_in_morys | BIB MINOR | Title truncated: full title "Living standards in the very long run: the place of Central, Eastern and South-Eastern Europe in the divergence debate". pages=13-36 but the chapter is 13-38 → `pages={13--38}`. Book title in `series` → `booktitle`. |
| zhuravskaya2024 | zhuravskaya_et_al_2024_new_russian_economic | BIB OK | JEL 62(1): 47-114, authors/order match. |
| voskoboynikov2021 | voskoboynikov_2021_accounting_growth_ussr | BIB OK | Corpus copy is early view (pp. 1-25, same DOI); bib gives final 35(3): 870-894. Postnotes, if added, must be converted. |
| vonyo2017 | vonyo_2017_war_socialism_why | BIB OK | Corpus copy is advance online (pp. 1-27); bib gives EHR 70(1): 248-274 (27 pages, consistent). |
| valge2003all | valge_2003_eesti_sisemajanduse_kogutoodang | BIB MINOR | Missing volume: `volume={15}`. Title punctuation: "Uue majanduse lätteil: Eesti sisemajanduse kogutoodang aastatel 1923-1938". pages=2202-2735 hides the serialisation → `pages={2202--28, 2443--86, 2712--35}` with `number={10--12}`. |
| kukk2005 | kukk_2005_economic_damage_in_salo_et_al_white_book | BIB OK | Matches (pp. 141-174, editors, publisher). |
| ahderajasalu1992 | ahde_rajasalu_1992_economic_structure_estonia_ch_* | BIB MINOR | _bibinfo lists Ahde and Rajasalu as **editors** (Eds.) of ETLA Discussion Paper 422; the bib has them as authors. Confirm against the title page; if they are editors, use `editor=` (or keep author= with a note). Institution, number and year match. |
| norkus_restorations | norkus_2023_post_communist_transformations_ch_* | BIB OK | Book, Norkus 2023, Springer (Cham). Optional DOI 10.1007/978-3-031-39496-6. |
| klimantas2026soviet | klimantas_2026_accounting_soviet_republic | BIB OK | Unpublished manuscript, Oxford (bibinfo: Wolfson College, University of Oxford). |
| imf_transition | havrylyshyn_et_al_1999_growth_experience_transition | BIB MINOR | Missing series/number: `series={IMF Occasional Paper}, number={184}`. |
| hamilton_transition | hamilton_de_vries_2025_structural_transformation_transition | BIB MINOR | Missing article number: `eid={106977}` (or pages={106977}); optional DOI 10.1016/j.worlddev.2025.106977. Capitalise journal "World Development". |
| baltictransitioncontraction | de_broeck_koen_2000_great_contractions_russia | BIB MINOR | Missing number: `number={WP/00/32}`. Better type @techreport, institution International Monetary Fund. Remove trailing period and double space in the title. |
| wb1993estonia | world_bank_1993_estonia_transition_market_ch_* | BIB MINOR | Matches the corpus book (World Bank 1993, A World Bank Country Study). **Duplicate** of `wbtransitionest` (same work): merge into one key. |
| wbtransitionest | world_bank_1993_estonia_transition_market_ch_* | BIB MINOR | Duplicate of wb1993estonia. Delete it and replace its \autocite with wb1993estonia. |
| bolt_zanden_newgdp2021 | none | unchecked (flag) | pages=29-51 conflicts with the postnote [12] (estonia-92, -130). @inbook with the book title in `series` and no editors. Verify the chapter range and the editors of *How Was Life? Volume II* (OECD 2021). |
| maddison2010 | none | unchecked (flag) | @misc spreadsheet URL; cannot carry a page postnote [312] (estonia-120). |
| adlys1988 | none (adlys_2009 is a different work) | unchecked | No _bibinfo. |
| broad2007 | none (false auto-match battilossi_et_al_2010) | unchecked | No _bibinfo. |
| cia1990, cia1982a, becker1994, schroeder1995, Maddison1998b, harrison1993, ponomarenko2002, bolotin1992, wbinputoutput1987, wdi2024, mpd2023, klimantas2019, norkuslatvia1935, wbstatisticalhandbook1994, worldtables1995, UNECE1995, UNECE1998, GeigerTobias2018Cngd, klesment2007, thomasfeinstein2003, dagys1959, feinstein1972, broad2008, feinsteinthomas2002, gerschenkron1957, jonassardy1970, alton_hungary | none | unchecked | NOT IN CORPUS, no _bibinfo to compare. All postnotes fall inside the bib page ranges where one is given: Maddison1998b 307-323; harrison1993 141-167; broad2007 315-349; broad2008 930-934; thomasfeinstein2003 425-458; jonassardy1970 82-86; gerschenkron1957 450-453; dagys1959 138-140; bolotin1992 181-192. |

## Summary

Counts by grade (75 instances):

| Grade | n |
|---|---|
| SUPPORTED | 3 |
| PARTIAL | 9 |
| NOT SUPPORTED | 2 |
| WRONG PAGE | 2 |
| PAGE MISSING | 1 |
| NOT IN CORPUS | 58 |

Bibliography (46 keys): BIB OK 6, BIB MINOR 9, BIB WRONG 0, unchecked 31 (2 of them flagged: bolt_zanden_newgdp2021 page range, maddison2010 page postnote).

Instances needing action, most serious first:

1. **estonia-88** (valge2003all [2718], 02_method:21): wrong page. Support is on pp. 2713-16. The text also misdescribes Valge's base (persons deriving a livelihood, not workers) and gives housing as 29.0 m at current prices where Valge has 32.0 (29 is at 1936 prices).
2. **estonia-95** (norkus_restorations [154], 02_method:25): the 71% is not Norkus and Markevičiūtė's independent figure. It rests on Valge's 1929-38 growth; their own estimate gives 66%.
3. **estonia-102** (wb1993estonia [1--8], 02_method:29): the 16/47/38 sectoral shares are not in the World Bank country study (p. 85 has industry alone at 40% of 1990 GDP). Probably from the Statistical Handbook 1994 alone.
4. **estonia-116** (broadberryinmorys [22], 02_method:41): nothing supports the employment-adjusted-for-real-wages industrial index.
5. **estonia-114** (ahderajasalu1992 [66], 02_method:35): wrong page; the Dvigatel and Sillamäe exclusion from statistics is on p. 35.
6. **estonia-113** (kukk2005 [150]): supports Sillamäe uranium only. "Estonia hosted fewer such plants than Latvia" is unsupported by any cited source.
7. **estonia-136** (klimantas2026soviet): the comparison it is said to develop is for Lithuania, not Estonia.
8. **estonia-81** (vonyoinmorys2021 [279--80]): supports "best available", not "errors in both directions" or "not well founded". The key_folders auto-match picked the wrong chapter.
9. **estonia-104** (wbtransitionest): the WB report gives 1980s growth rates, not levels. Duplicate key of wb1993estonia.
10. **estonia-120** (maddison2010 [312]): page postnote on a spreadsheet entry; probably meant Maddison1998b p. 312.
11. **estonia-92 / -130** (bolt_zanden_newgdp2021 [12]): p. 12 is outside the bib range 29-51.
12. **estonia-138** (hamilton_transition [17]): page not in the corpus (appendix). The main text does not support "extrapolation from mid-1990s benchmarks ... shallower decline".
13. **estonia-83, -84, -86, -139**: partial support, mostly fixable by narrowing postnotes or adding pages (zhuravskaya [48, 51]; voskoboynikov [3, 5]; vonyo2017 p. 6 online; De Broeck supports data weakness only).
14. **estonia-110, -125**: not in corpus but probable scope mismatch. Adlys 1988 is one Lithuanian official, cited for "Baltic statisticians". Dagys 1959 is a Lithuanian source cited for Estonian archival losses.
15. 58 instances (31 keys) could not be checked because the sources are not in the corpus, including all Maddison 1998b, Harrison 1993, Ponomarenko 2002, Bolotin 1992, CIA/JEC, Thomas and Feinstein, and Feinstein and Thomas quotations.
