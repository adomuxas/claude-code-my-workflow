# Citation verification report: latvia batch 01

- Batch: `latvia_batch01.tsv` (ids latvia-72 to latvia-142)
- Instances: 71
- Distinct keys: 51
- Sentences checked: `Paper/latvia/sections/02_gap.tex` line 11; `Paper/latvia/sections/03_method.tex` lines 9, 11, 15, 19, 23, 25, 29, 35, 37, 39, 43, 45, 47, 51, 55, 59
- Corrections to `latvia_key_folders.tsv`:
  - `vonyoinmorys2021` was matched to the wrong chapter (`markevich_vonyo_2021_economic_policy_state...`, pp. 303-323). The right folder is `vonyo_markevich_2021_economic_growth_structural_in_morys_economic_history_central` (pp. 277-302).
  - `klimantas2025estonia` was matched to the Lithuanian paper. It is the companion Estonia manuscript in this repo (`Paper/estonia/`) and is not in `newsources`.
  - `Klimantas2024` was listed as not in corpus. It is `klimantas_et_al_2023_reinventing_perished_belgium`.
  - `wbtransitionlatv` was listed as not in corpus. It is `World Bank 1993 Latvia - The transition to a market economy (A World Bank` (whole book, printed pp. 1-305).
  - Chapters for the ambiguous keys:
    - `hiden_salmon` pp. 129-30 is in `Hiden 1994 Soviet winter...`.
    - `years_of_dependence` pp. 15-16 and 74 are in `..._ch_years`; p. 109 is in `..._ch_postwar_stalinism`.
    - `king_1965_economic` p. 86 is in `..._ch_world_ii_losses`.
    - `norkusdvides` pp. 322-3 is in `norkus_2014_du_nepriklausomybes_dvidesimtmeciai_ch_makroekonomines_stabilizacijos_pirmoje`.
- Not-in-corpus keys were confirmed by searching `bibinfo_index.tsv` (folder names and citation text) by surname and title words. None of them has a folder.

## Citation grades

| id | file:line | key [postnote] | folder (short) | grade | supporting quote or problem | proposed fix |
|---|---|---|---|---|---|---|
| latvia-72 | 02_gap:11 | gatis_compensations | none | NOT IN CORPUS | Krūmiņš 2018 (Defence Strategic Communications) has no folder. The claim that Latvian historiography "overturned the Soviet claim that the republic was a net recipient of Union investment" is unchecked. | none |
| latvia-73 | 02_gap:11 | vaskela_2014_lietuvos [232--3] | vaskela_2014 | PARTIAL | p. 232 (Lithuanian, translated): "no reason to speak of any additional investment from Moscow, as the Baltic share of all USSR capital investment in 1946–1960 was only 2.19 per cent". This is a Lithuanian historian writing about the whole Baltic region in 1946-60. It is not "Latvian historiography" and not a reassessment of Latvia's fiscal relations with Moscow. | `... which overturned the Soviet claim that the republic was a net recipient of Union investment \parencites{gatis_lv_eh}{gatis_compensations}, a conclusion consistent with the Baltic share of Union investment in 1946--60, which was below the region's share of output \parencite[232]{vaskela_2014_lietuvos}; but it, too, ...` |
| latvia-74 | 02_gap:11 | klimantas2026soviet | klimantas_2026_accounting | PARTIAL | p. 3: "This paper presents the first uninterrupted GDP time-series estimates for occupied Lithuania, covering the years 1940-1995". The series exists, but the source is an "Unpublished manuscript" (`_bibinfo` and bib note), so "now published" is wrong. The Estonian companion is a "Working paper, under review". | `The Lithuanian and Estonian series now available close two-thirds of the gap \parencite{klimantas2026soviet,klimantas2025estonia}.` |
| latvia-75 | 02_gap:11 | klimantas2025estonia | none (repo `Paper/estonia/`) | NOT IN CORPUS | This is the companion manuscript (Klimantas & Klesment) kept in `Paper/estonia/`. It is unpublished (bib: "Working paper, under review"), so the same "now published" problem applies. | see latvia-74 |
| latvia-76 | 03_method:9 | Maddison1998b [307] | none | NOT IN CORPUS | The quoted phrase "overstated growth, and understated inflation" is unchecked. Verify it against RIW 44(3), p. 307. | none |
| latvia-77 | 03_method:9 | bergson1950 | none | NOT IN CORPUS | Unchecked. Indirect support: Vonyó & Markevich 2021, p. 280, say Western estimates followed "the methodology originally suggested by Abraham Bergson (1950) for the reconstruction of Soviet GDP in 1937". | none |
| latvia-78 | 03_method:9 | bergson1961 | none | NOT IN CORPUS | unchecked | none |
| latvia-79 | 03_method:9 | cia1982a | none | NOT IN CORPUS | unchecked | none |
| latvia-80 | 03_method:9 | assessingCIA1988 | none | NOT IN CORPUS | unchecked | none |
| latvia-81 | 03_method:9 | becker1994 | none | NOT IN CORPUS | unchecked | none |
| latvia-82 | 03_method:9 | schroeder1995 | none | NOT IN CORPUS | unchecked | none |
| latvia-83 | 03_method:9 | harrison1993 [144, 159] | none | NOT IN CORPUS | Unchecked. The claim that Khanin's series "coincided with the CIA's for 1950--87" is strong and should be checked against the article. Vonyó & Markevich 2021, p. 280, cite Harrison 1993 as casting "serious doubts" on Khanin's re-revisions because of index-number problems. | none (verify) |
| latvia-84 | 03_method:9 | cia1990 | none | NOT IN CORPUS | Unchecked. `cia_1990_economic_development_soviet` in the corpus is a different document (CIA SOV 90-10040), not the JEC volume at 1982 prices. | none |
| latvia-85 | 03_method:9 | Maddison1998b [309] | none | NOT IN CORPUS | unchecked | none |
| latvia-86 | 03_method:9 | vonyoinmorys2021 [279--80] | vonyo_markevich_2021_economic_growth_structural | PARTIAL | p. 280: the CIA/JEC and Alton revisions "constitute the foundation of the Maddison data for these countries" and "remain widely acknowledged as the best available". The pages do not mention the reworked 1982-price series (`cia1990`) or the Maddison Project Database. They also do not contain the conclusions the preceding sentence gives to "the survey by Vonyó and Markevich": "errors in both directions" and "was not well founded". | `the CIA's estimates, in their final version at 1982 prices \parencite{cia1990}, are the basis of Maddison's Soviet series \parencites[309]{Maddison1998b}[280]{vonyoinmorys2021}`. Also check that the quotation "was not well founded" comes from Becker, Schroeder or Maddison, and drop "the survey by Vonyó and Markevich" from that list unless a page is found. |
| latvia-87 | 03_method:9 | ponomarenko2002 [16--18, 73--4] | none | NOT IN CORPUS | The quotation "are apparently of high quality and can be used" is unchecked. Vonyó & Markevich, p. 280, describe Ponomarenko's work only as a reconstruction "in current prices, that is without any corrections for Soviet non-market prices". | none |
| latvia-88 | 03_method:9 | zhuravskaya2024 | zhuravskaya_2024 | SUPPORTED | p. 48: "Since this survey, there has been a major burst of new research on Russian and Soviet economic history"; the same page links this to "the opening of Soviet archives after the collapse". | Add a pin-cite: `\parencite[48]{zhuravskaya2024}` |
| latvia-89 | 03_method:9 | kukic_soviet | kukic_2024 | PARTIAL | p. 646: "I include the Russian Empire ... and modern Russia, too, with the sole aim of contextualizing the Soviet experience". The paper works only at the level of the Union and Russia. It shows the gap by example but says nothing about the non-Russian republics lacking national accounts. | Acceptable as an illustration. A more literal wording: `... remain almost entirely without modern national accounts, studies of Soviet growth being conducted at the level of the Union or of Russia \parencite{kukic_soviet,voskoboynikov2021}.` |
| latvia-90 | 03_method:9 | voskoboynikov2021 | voskoboynikov_2021_accounting | PARTIAL | p. 5 (early-view pagination): "The series for Russia and former Soviet republics are extrapolated from the benchmark year 1990 to earlier and later years using growth rates from National Accounts and the Total Economy Database". This implies that the republics have no independent accounts but does not say so. | as latvia-89 |
| latvia-91 | 03_method:11 | klimantas2026soviet | klimantas_2026_accounting | SUPPORTED | p. 18: "the value-added indices are aggregated into constant-price GDP series using the 1990 benchmark GDP data from Table 1." | none |
| latvia-92 | 03_method:11 | klimantas2025estonia | none (repo `Paper/estonia/`) | NOT IN CORPUS | Not in `newsources`. The repo manuscript `Paper/estonia/sections/02_method.tex` uses the same formula (`w_i` = sector share of benchmark GDP, `I_it` = volume index), which is consistent with the claim. | none |
| latvia-93 | 03_method:15 | thomasfeinstein2003 [427--8, 444] | none | NOT IN CORPUS | unchecked | none |
| latvia-94 | 03_method:15 | cia1982a [45] | none | NOT IN CORPUS | Unchecked ("double-deflated only agriculture"). | none |
| latvia-95 | 03_method:15 | Maddison1998b [307] | none | NOT IN CORPUS | unchecked | none |
| latvia-96 | 03_method:15 | vonyo2017 | vonyo_2017_war_socialism | SUPPORTED | p. 6 (early view): "Physical output indicators are considered comparatively trustworthy, but aggregates expressed in values are distorted by unrealistic producer prices, incorrect weighting". Hidden inflation is discussed on p. 9. | Add a pin-cite. The early-view p. 6 corresponds to roughly p. 253 in the final pagination (EHR 70(1): 248-74) that the bib uses, so confirm against the final version. |
| latvia-97 | 03_method:15 | mertelsmann_2003_there [165] | mertelsmann_2003 | SUPPORTED | p. 165: "The explosion of productivity of 'Metallmärk' ... had nothing to do with physical output, but originated in a shift towards higher priced products." The page also cites Harrison's 150-200 per cent hidden inflation. | none |
| latvia-98 | 03_method:15 | harrison1993 [144, 152] | none | NOT IN CORPUS | Unchecked (quotation "the ease of distortion remained greater for value series than for physical volumes"). | none |
| latvia-99 | 03_method:15 | years_of_dependence [109] | misiunas_..._ch_postwar_stalinism | SUPPORTED | p. 109: "By 1947, total industrial production had reportedly surpassed that of Soviet Latvia in 1940 by 28 per cent. However, judging from data in natural production units, the 1937 level had not yet been reached". The five-month suspicion is on the same page. | none |
| latvia-100 | 03_method:15 | mertelsmann_2003_there [167] | mertelsmann_2003 | SUPPORTED | p. 167: "Western authors were mistaken; the index of production was based on the entire year 1940." The page also says 1940 output "should have been measured ... 4.8 times higher" (Estonia). | none |
| latvia-101 | 03_method:15 | krumins_2017_sovetizacijas [234] | krumins_2017_sovetizacijas | SUPPORTED | p. 234 (Latvian, translated): "already in 1947 it was announced that Latvian industry had surpassed the 1940 level ... these statements must be judged critically, as Soviet officials ignored the 1940 devaluation of the lats". The page gives no magnitude ("several-fold"). The explicit parity of 1 lat = 1 rouble is in `krumins_2017_tautsaimnieciba_1950`, p. 277. | Optionally add `[277]{krumins_2017_tautsaimnieciba_1950}` for the parity. |
| latvia-102 | 03_method:19 | bolotin1992 [181--92] | none | NOT IN CORPUS | Unchecked. Klimantas 2026 (Lithuania), p. 18 and Table 1, uses Bolotin in the same way. | none |
| latvia-103 | 03_method:19 | gulans_2015_rupnieciba [43--4] | gulans_2015 | SUPPORTED | pp. 43-4 (Latvian, translated): GDP "in USSR statistics began to be calculated only in 1988 ... In Latvia it appeared only in the 1990 Statistical Yearbook, with some figures for 1989." | none |
| latvia-104 | 03_method:19 | bolotin1992 [181, 184] | none | NOT IN CORPUS | Unchecked (parities 0.40/1.80/1.10/2.80/1.45/3.30; 1.82 overall). | none |
| latvia-105 | 03_method:19 | wbinputoutput1987 | none | NOT IN CORPUS | unchecked | none |
| latvia-106 | 03_method:19 | norkuslatvia1935 | none | NOT IN CORPUS | Unchecked. See the latvia-137 note: according to Klimantas et al. (p. 19), the PPP conversion used Sweden *and* Lithuania. | see latvia-137 |
| latvia-107 | 03_method:19 | wdi2024 | none | NOT IN CORPUS | Online database. The claim (net product taxes about 0.5 per cent of value-added in Bulgaria and Ukraine, 1980-90) is unchecked. | none |
| latvia-108 | 03_method:19 | yasin_1993_economic [20] | Yasin 1993 | SUPPORTED | p. 20: "cotton from Uzbekistan was sold at very low procurement prices ... The turnover tax was levied on the final product (in this case the cotton fabric)". | none |
| latvia-109 | 03_method:23 | Maddison1998b [318--19] | none | NOT IN CORPUS | Unchecked (32 vs 42 per cent of the US). | none |
| latvia-110 | 03_method:23 | maddisonworldeconomy [181--2] | none | NOT IN CORPUS | unchecked | none |
| latvia-111 | 03_method:23 | wbstatisticalhandbook1994 | none | NOT IN CORPUS | Unchecked (34 per cent services share in 1990). | none |
| latvia-112 | 03_method:23 | kukk2005 [166] | kukk_2005 | SUPPORTED | p. 166: "'PlanEcon Report' had the data of the CIA at its disposal and assessed ... the per capita GNP of Estonia to be USD 6240 in 1989, while the average figure for the USSR was believed to be USD 5000." | none |
| latvia-113 | 03_method:23 | wbtransitionlatv | World Bank 1993 Latvia | PARTIAL | pp. 228-9: "Table 2.2 - Latvia: GDP by Industrial Origin at Constant 1990 Prices", 1980-91, "Sources: State Committee for Statistics and Bank staff estimates." This shows that World Bank GDP series for 1980-91 exist. A 1993 study cannot show that they "were discontinued". | `the World Bank's GDP levels for 1980--91 \parencite[228--9]{wbtransitionlatv} were discontinued;` and cite the later source that documents the discontinuation, if there is one. |
| latvia-114 | 03_method:23 | worldtables1995 [32--3] | none | NOT IN CORPUS | unchecked | none |
| latvia-115 | 03_method:23 | UNECE1995 [249] | none | NOT IN CORPUS | Unchecked (UNECE real GDP indices taken from NMP). | none |
| latvia-116 | 03_method:23 | wbinputoutput1987 [66--89] | none | NOT IN CORPUS | unchecked | none |
| latvia-117 | 03_method:25 | adlys1988 | none | NOT IN CORPUS | The Tiesa interview of 1988 is not in the corpus. The corpus `adlys_2009_zvilgsnis_tarybine_statistika` is a different work and does not mention it. Note: Adlys was a Lithuanian statistician; the sentence says "Baltic statisticians" (plural). | none |
| latvia-118 | 03_method:25 | krumins_2017_tautsaimnieciba_1950 [278] | krumins_2017_1950_1960 | PARTIAL | p. 278 (translated): "In the 1950s the foundations were laid for RAF (Riga Bus Factory)". Table 7 on the same page shows chemicals at 3.5 per cent and machine-building at 14.5 per cent of industrial workers in **1940**, so it contradicts "barely existed in 1940" for chemicals and engineering. The figures of 573-fold and 593-fold growth are given as artefacts of a "crooked" lat-rouble comparison (pp. 277-8). Blaubergs (p. 74) also notes that VEF made radios and telephones before the war. | `... and 1990 is a year in which the branches built up after the war, chemicals and pharmaceuticals at Olaine, electrical engineering or microbus production, can be observed and weighted at all \parencites[278]{krumins_2017_tautsaimnieciba_1950}[303, 305]{krumins_2017_tautsaimnieciba_1960}.` |
| latvia-119 | 03_method:25 | krumins_2017_tautsaimnieciba_1960 [303, 305] | krumins_2017_1960_1985 | SUPPORTED | p. 303: in the 1960s "several chemical industry enterprises were built in Latvia (Olaine chemical reagents plant ...)". p. 305: "In 1976 the new RAF microbus factory was opened in Jelgava"; the Organic Synthesis Institute's inventions were "widely applied in the pharmaceutical industry" (translated). | none |
| latvia-120 | 03_method:29 | wbinputoutput1987 [82--5] | none | NOT IN CORPUS | unchecked | none |
| latvia-121 | 03_method:29 | wbtransitionlatv [289] | World Bank 1993 Latvia | SUPPORTED | p. 289: "Table 9.1 - Latvia: Industrial Output at Current Prices" gives output by branch and sub-branch, 1970-91. | none |
| latvia-122 | 03_method:29 | upmalis_2015_latvijas [59--61] | upmalis_2015 | SUPPORTED | p. 59 (translated): All-Union factories "produce high-technology military output and also consumer goods. In Latvia: VEF, Vagonrūpnīca, 'Kompresors'". p. 61: 127 factories had military orders in the 1960s. Caveat: p. 59 says military output was recorded in group "A" "without separating it". It was therefore hidden inside the aggregates rather than "never reported". Upmalis does not mention the shipyards (the World Bank does, p. 103). | none (consider rewording "never reported at the republican level" to "never reported separately") |
| latvia-123 | 03_method:29 | blaubergs_2015_vef [74--5] | blaubergs_2015 | SUPPORTED | pp. 74-5 (translated): in 1949 a secret department was set up in the VEF design bureau. Military communications equipment was later made at "Komutators", which separated from VEF in 1963. | none |
| latvia-124 | 03_method:29 | wbtransitionlatv [103--4] | World Bank 1993 Latvia | SUPPORTED | pp. 103-4: "A large share of the output from electronics industries and shipyards consisted of products and components for military use ... more than 15 percent of the labor force in Latvia in 1985 was employed in military production, higher than in Lithuania and three times higher than in Estonia." (spans the page break) | none |
| latvia-125 | 03_method:35 | wbtransitionlatv [286] | World Bank 1993 Latvia | SUPPORTED | p. 286: "Table 8.2 - Latvia: Agricultural Production" gives gross output, material inputs and "Net Material Product" split by crop and animal production, 1970-91. | none |
| latvia-126 | 03_method:37 | ostlandinzahlen [39, 45] | none | NOT IN CORPUS | unchecked | none |
| latvia-127 | 03_method:39 | wbinputoutput1987 [66--89] | none | NOT IN CORPUS | unchecked | none |
| latvia-128 | 03_method:43 | Maddison1998b [319] | none | NOT IN CORPUS | unchecked | none |
| latvia-129 | 03_method:43 | cia1982a [49] | none | NOT IN CORPUS | unchecked | none |
| latvia-130 | 03_method:45 | years_of_dependence [15--16] | misiunas_..._ch_years | SUPPORTED | p. 15: "The 30,000 Soviet troops in Latvia and 25,000 in Estonia surpassed in size the national armies". | none |
| latvia-131 | 03_method:47 | feinstein1972 [21] | none | NOT IN CORPUS | Unchecked ("rough", 15-25 per cent margin). | none |
| latvia-132 | 03_method:51 | maddison_project_paper2014 [629] | none | NOT IN CORPUS | Unchecked (the one-third population rule). | none |
| latvia-133 | 03_method:51 | bolt_zanden_newgdp2021 [30] | none | NOT IN CORPUS | unchecked | none |
| latvia-134 | 03_method:51 | years_of_dependence [74] | misiunas_..._ch_years | SUPPORTED | p. 74: "The Latvian loss was smaller, involving the detachment of part of the Abrene district in the northeast, about 2 per cent of the pre-war territory and population." | none |
| latvia-135 | 03_method:51 | hiden_salmon [129--30] | Hiden 1994 Soviet winter | SUPPORTED | pp. 129-30: "Latvia's territorial and population losses amounted to about 2 per cent. In both cases the areas lost were inhabited predominantly by Russians." (Neither source says "rural and poorer".) | none |
| latvia-136 | 03_method:51 | king_1965_economic [86] | king_1965_ch_world_ii_losses | PARTIAL | p. 86, Table VI "Population losses 1939–1949": "Refugees and repatriates — Ethnic Latvians — 120,000". This is a 1939-49 total of refugees *and repatriates*. It is not dated to 1944 and not limited to flight to the West. | `the flight of some 120,000 ethnic Latvians to the West, most of them in 1944 \parencite[86]{king_1965_economic}` (or "refugees and repatriates of 1939--49") |
| latvia-137 | 03_method:55 | Klimantas2024 | klimantas_et_al_2023_reinventing | SUPPORTED | p. 18: "this paper applies the sector of origin benchmark extrapolation method ... made possible in the recent publication of Latvia's GDP in 1935 (Norkus et al. 2022l)". Note: p. 19 says the 1935 PPP conversion compared "the purchasing power of Ls with that of two neighbouring countries, Sweden and Lithuania". The paper's "bilateral price comparison with Sweden" (here and at 02_gap:11) is therefore too narrow. | `the benchmark itself was converted into international dollars by price comparisons with Sweden and Lithuania` (check against `norkuslatvia1935`) |
| latvia-138 | 03_method:55 | norkuslatvia1935 | none | NOT IN CORPUS | Unchecked. See latvia-137. | none |
| latvia-139 | 03_method:55 | bukowski_2026_economic [6] | bukowski_2026 | SUPPORTED | p. 6: "This extrapolation strategy for the Baltic states effectively holds the relative price structure fixed at 1935/1937 levels ... the agricultural-to-industrial relative price fluctuated". | none |
| latvia-140 | 03_method:55 | norkusdvides [322--3] | norkus_2014_ch_makroekonomines_stabilizacijos | SUPPORTED | p. 323 (Lithuanian, translated): "Latvia suffered perhaps the most from the military actions of the First World War" (compared with other East European countries); "up to half of the population became war refugees". The source does not pair Latvia with Lithuania. | none |
| latvia-141 | 03_method:55 | krumins_2024_makroekonomiska [44] | krumins_2024 | SUPPORTED | p. 44 (Latvian, translated): "In various post-war calculations it was acknowledged that Latvia was the country of the world that suffered most from the war." | none |
| latvia-142 | 03_method:59 | mpd2023 | none | NOT IN CORPUS | unchecked | none |

## Bibliography checks

| key | folder | grade | problem and corrected field(s) |
|---|---|---|---|
| Klimantas2024 | klimantas_et_al_2023_reinventing | BIB OK | The corpus copy is the Online First version (2023, no pagination). The bib has the final version (2024, 18(3): 765-835). Authors and title match. Bukowski et al. also cite it as 2024. |
| blaubergs_2015_vef | blaubergs_2015 | BIB OK | Matches. Editor first name "Andris Cīrulis" cannot be verified from the page text. The pipeline note in the manifest says "Andrejs Cirulis"; confirm (this also affects gulans and upmalis). |
| bukowski_2026_economic | bukowski_2026 | BIB OK | Matches (advance online, DOI). |
| gulans_2015_rupnieciba | gulans_2015 | BIB OK | Matches (see the editor note under blaubergs). |
| hiden_salmon | Hiden 1994 (chapters) | BIB MINOR | `_bibinfo` gives "(Rev. ed.)". Add `edition = {Rev.}`. |
| king_1965_economic | king_1965 (chapters) | BIB OK | Matches. |
| klimantas2026soviet | klimantas_2026_accounting | BIB OK | Matches. `_bibinfo` has "Wolfson College, University of Oxford". |
| krumins_2017_sovetizacijas | krumins_2017_sovetizacijas | BIB OK | Matches. |
| krumins_2017_tautsaimnieciba_1950 | krumins_2017_1950_1960 | BIB OK | Matches. |
| krumins_2017_tautsaimnieciba_1960 | krumins_2017_1960_1985 | BIB OK | Matches. |
| krumins_2024_makroekonomiska | krumins_2024 | BIB OK | Matches. Optionally add `address = {Rīga}` for consistency. |
| kukic_soviet | kukic_2024 | BIB OK | Matches (EHR 77(2): 644-674). |
| kukk2005 | kukk_2005 | BIB OK | Matches. |
| mertelsmann_2003_there | mertelsmann_2003 | BIB OK | Matches. |
| norkusdvides | norkus_2014 (chapters) | BIB MINOR | All 12 chapter `_bibinfo` files read "Kapitalizmas, klasė ir demokratija". The bib reads "klasės". Confirm against the title page and harmonise. |
| upmalis_2015_latvijas | upmalis_2015 | BIB OK | Matches (see the editor note under blaubergs). |
| vaskela_2014_lietuvos | vaskela_2014 | BIB MINOR | `{\c{u}}` prints a cedilla, but "Rytų" and "straipsnių" need an ogonek. Use `{\k{u}}` or a literal `ų` (title: "Lietuvos ūkis TSRS ir Rytų Pabaltijyje ..."; booktitle: "... straipsnių rinkinys"). |
| vonyo2017 | vonyo_2017 | BIB OK | The corpus copy is the early view (pp. 1-27, copyright 2016). The bib has the final version (EHR 70(1): 248-274, 2017). Convert any pin-cites taken from the corpus copy. |
| vonyoinmorys2021 | vonyo_markevich_2021_economic_growth_structural | BIB MINOR | Chapter range is pp. 277-302 (bib: 277-299). Change to `pages = {277--302}`. The book title is in `series`; move it to `booktitle = {The Economic History of Central, East and South-East Europe: 1800 to the Present}`. Authors (Vonyó & Markevich), editor and year match. |
| voskoboynikov2021 | voskoboynikov_2021_accounting | BIB OK | The corpus copy is the early view (pp. 1-25). The bib has the final version (JES 35(3): 870-894). |
| wbtransitionlatv | World Bank 1993 Latvia | BIB MINOR | The title suffix "(English)" is a label from the World Bank documents site. Use `title = {Latvia: The transition to a market economy}` and `series = {A World Bank country study}`. The same applies to `wbstatisticalhandbook1994` and `worldtables1995`. |
| yasin_1993_economic | Yasin 1993 | BIB OK | Matches. |
| years_of_dependence | misiunas_taagepera_1993 (chapters) | BIB MINOR | `_bibinfo` gives University of California Press; the bib gives Hurst, London. Both imprints exist (co-published). Make sure the bib names the imprint whose pagination was cited. |
| zhuravskaya2024 | zhuravskaya_2024 | BIB OK | Matches. |
| klimantas2025estonia | none (repo manuscript) | BIB OK vs `Paper/estonia/main.tex` | Title and authors match the manuscript's pdftitle and pdfauthor. |
| Maddison1998b | none | unchecked | Looks correct (RIW 44(3): 307-323). |
| UNECE1995 | none | unchecked | No publisher. Add `publisher = {United Nations}`. |
| adlys1988 | none | unchecked | |
| assessingCIA1988 | none | unchecked | The booktitle "Soviet Economy Brink of Reform" seems to be missing "on the", and there is no editor or publisher. Complete it. |
| becker1994 | none | unchecked | |
| bergson1950 | none | unchecked | |
| bergson1961 | none | unchecked | |
| bolotin1992 | none | unchecked | |
| bolt_zanden_newgdp2021 | none | unchecked | The volume title is in `series`. Use `booktitle` and add editors. |
| cia1982a | none | unchecked | |
| cia1990 | none | unchecked | |
| feinstein1972 | none | unchecked | |
| gatis_compensations | none | unchecked | |
| harrison1993 | none | unchecked | |
| maddison_project_paper2014 | none | unchecked | |
| maddisonworldeconomy | none | unchecked | |
| mpd2023 | none | unchecked | |
| norkuslatvia1935 | none | unchecked | |
| ostlandinzahlen | none | unchecked | |
| ponomarenko2002 | none | unchecked | |
| schroeder1995 | none | unchecked | |
| thomasfeinstein2003 | none | unchecked | "History Matters" is in `series`. Use `booktitle`. |
| wbinputoutput1987 | none | unchecked | |
| wbstatisticalhandbook1994 | none | unchecked | See wbtransitionlatv ("(English)"). |
| wdi2024 | none | unchecked | |
| worldtables1995 | none | unchecked | See wbtransitionlatv ("(English)"). |

## Summary

Counts by grade (71 instances):
- SUPPORTED: 23
- PARTIAL: 8
- NOT SUPPORTED: 0
- WRONG PAGE: 0
- PAGE MISSING: 0
- NOT IN CORPUS: 40

Bibliography (51 keys): 20 BIB OK (19 checked against corpus `_bibinfo`, plus `klimantas2025estonia` checked against the repo manuscript), 6 BIB MINOR, 0 BIB WRONG, 25 unchecked (not in corpus).

Instances needing action, most serious first:
1. **latvia-118** (`krumins_2017_tautsaimnieciba_1950` [278]): the cited page contradicts "barely existed in 1940" for chemicals and engineering (1940 shares of industrial workers: chemicals 3.5 per cent, machine-building 14.5 per cent). Rephrase as "built up after the war".
2. **latvia-74 / latvia-75**: "now published" is wrong. Both the Lithuanian and the Estonian series are unpublished manuscripts. Use "now available".
3. **latvia-86** (`vonyoinmorys2021`): pp. 279-80 do not mention the 1982-price CIA series or the MPD. They also do not contain "errors in both directions" or "was not well founded", which the sentence gives to "the survey by Vonyó and Markevich". Re-attribute or narrow the sentence. The key-folder table also mapped this key to the wrong chapter.
4. **latvia-137 / latvia-106 / 02_gap:11**: Klimantas et al. (p. 19) say the 1935 PPP conversion compared Latvia with Sweden *and Lithuania*, not "a bilateral price comparison with Sweden". Check against `norkuslatvia1935` and correct both places.
5. **latvia-113** (`wbtransitionlatv`, no page): the source shows that World Bank GDP for 1980-91 exists (pp. 228-9) but cannot support "were discontinued". Add a pin-cite and a source for the discontinuation.
6. **latvia-73** (`vaskela_2014_lietuvos`): this is a Baltic-wide investment-share finding by a Lithuanian historian, cited as part of "Latvian historiography" on Latvia's fiscal relations. Move it to its own clause.
7. **latvia-136** (`king_1965_economic` [86]): 120,000 is the 1939-49 total of "refugees and repatriates", not the 1944 flight to the West.
8. **latvia-89 / latvia-90** (Kukić, Voskoboynikov): these only illustrate the absence of republican accounts and do not state it. Minor rewording is optional.
9. Smaller points: add pin-cites for `zhuravskaya2024` [48] and `vonyo2017` (early-view p. 6, roughly final p. 253). In latvia-122, Upmalis says military output was recorded inside group A, so "never reported at the republican level" overstates the case; "never reported separately" is safer.
10. Priority checks for unverified (not-in-corpus) sources: `harrison1993` [144, 159] (claim that Khanin "coincided with the CIA's for 1950--87"; Vonyó & Markevich p. 280 cite Harrison 1993 as critical of Khanin) and the direct quotations from `Maddison1998b` [307] and `ponomarenko2002` [16--18, 73--4].
