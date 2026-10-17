# Citation verification report: latvia batch 02

- Batch: `latvia_batch02.tsv` (ids latvia-143 to latvia-213)
- Instances: 71
- Distinct keys: 50
- Files: `Paper/latvia/sections/03_method.tex` (lines 59-83), `Paper/latvia/sections/04_latvia.tex` (lines 21-27)

Folder-mapping corrections found during the check:
- `broad2007` (Broadberry & Burhop 2007) was auto-matched (score 0) to `battilossi_et_al_2010_business_cycles...`, which is a different work. Treated as NOT IN CORPUS.
- `klimantas2025estonia` (Klimantas & Klesment, Estonia) was auto-matched (score 1) to `klimantas_2026_accounting_soviet_republic`, which is the Lithuanian paper. Treated as NOT IN CORPUS; checked instead against the companion paper in the repo (`Paper/estonia/sections/04_limitations.tex:13`).
- `wbtransitionlatv` (not_in_corpus in the key table) is in the corpus: `World Bank 1993 Latvia - The transition to a market economy (A World Bank` and chapter folder `world_bank_1993_latvia_transition_market_ch_housing_municipal_services` (pp. 151-162).

## Citation grades

| id | file:line | key [postnote] | folder (short) | grade | supporting quote or problem | proposed fix |
|---|---|---|---|---|---|---|
| latvia-143 | 03_method:59 | wdi2024 | none | NOT IN CORPUS | No folder for World Development Indicators (database). | |
| latvia-144 | 03_method:63 | broad2007 [323--6] | none (auto-match to Battilossi et al. 2010 is wrong) | NOT IN CORPUS | Broadberry & Burhop (2007) not in corpus; the 10 per cent consistency criterion is unchecked. | |
| latvia-145 | 03_method:63 | klimantas2026soviet | klimantas_2026_accounting_soviet_republic | SUPPORTED | p. 19, Table 2: "1939 -3% ... 1940 +1%" (1937 -8%, 1938 -9%, also within 10 per cent). | |
| latvia-146 | 03_method:63 | klimantas2025estonia | none (auto-match to Lithuanian paper is wrong) | NOT IN CORPUS | Not in newsources. The repo's Estonian paper gives 1937-40 differences of -1.6, +3.6, -3.0, -0.3 per cent (`Paper/estonia/sections/04_limitations.tex:13`), which is consistent with "within 10 per cent". | |
| latvia-147 | 03_method:65 | kyn_1997_eastern [260] | Kyn 1997 Eastern Europe in transition | PARTIAL | p. 260, quoting Mygind: "Part of this fall can be explained by lack of registration of the new growing private activities". Nothing on services specifically, and Kyn himself doubts the decline was all compensated by unrecorded growth. | `...and misses the new private activities that were emerging unrecorded \parencite[260]{kyn_1997_eastern}` |
| latvia-148 | 03_method:65 | imf_transition [11] | havrylyshyn_et_al_1999_growth_experience_transition | PARTIAL | p. 11: industry share fell 9.5 points, market services rose 7.5; "the actual increase ... even larger, since this is where the highest proportion of unmeasured economic activity was most likely". Supports the industry-to-services shift that underlies the argument. Says nothing about backward-carried weights or a "shallower decline". | (none required; the citation supports the mechanism, not the measurement claim) |
| latvia-149 | 03_method:65 | hamilton_transition [17] | hamilton_de_vries_2025_structural_transformation_transition | PAGE MISSING | p. 17 is in the appendix (pp. 15-22 not converted, empty files). Body p. 4 only says the ETD-TE covers 1990-2019, refers to Appendix C for construction, and "raises caveats on the reliability of the pre-1995 data". The backward extrapolation from mid-1990s benchmarks cannot be checked. | |
| latvia-150 | 03_method:65 | mpd2023 | none | NOT IN CORPUS | | |
| latvia-151 | 03_method:65 | wdi2024 | none | NOT IN CORPUS | | |
| latvia-152 | 03_method:69 | norkusmark2021 [603] | norkus_markeviciute_2021_new_estimation_gross | SUPPORTED | p. 603, Table 19, 1913 column: "18 Latvia 2361" (matches `\lvY1913` = 2,361). | |
| latvia-153 | 03_method:69 | bolt_zanden_newgdp2021 [12, 30] | none | NOT IN CORPUS | The 1.594 conversion factor is unchecked. | |
| latvia-154 | 03_method:73 | kyn_1997_eastern [269] | Kyn 1997 | SUPPORTED | p. 269, Table 11.2 (EBRD and WIIW, 1988=100): "Latvia 106.80 109.90", i.e. +6.8% in 1989 and +2.9% in 1990. | |
| latvia-155 | 03_method:73 | krumins_2017_gorbacova [348--50] | krumins_2017_gorbacova_reformu_laiks | SUPPORTED | p. 349 (Latvian): "1990. gadā, salīdzinot ar 1985. gadu, pārtikas rūpniecības ražošanas apjomi bija kritušies caurmērā par 5%, bet citās nozarēs pat par 10%". In English: in 1990, compared with 1985, food-industry output had fallen by 5% on average, and in other branches by as much as 10%. Tables 9-10 (pp. 349-50) give the physical series. | |
| latvia-156 | 03_method:73 | years_of_dependence [289] | misiunas_..._ch_apogee_stagnation | PARTIAL | p. 289: "The United Nations estimates put real growth at about 2 percentage points lower than the official Soviet figures". This refers to 1980-5, through hidden inflation. Nothing about "comparable prices" or about overstatement being "most severe in the final Soviet years". | `...which the net material product series overstated, by about 2 percentage points a year on United Nations estimates for the early 1980s \parencite[289]{years_of_dependence}.` |
| latvia-157 | 03_method:81 | gerschenkron1957 [453] | none | NOT IN CORPUS | The 175 and 62 per cent figures are unchecked. | |
| latvia-158 | 03_method:81 | feinsteinthomas2002 [517] | none | NOT IN CORPUS | | |
| latvia-159 | 03_method:81 | jonassardy1970 [85] | none | NOT IN CORPUS | | |
| latvia-160 | 03_method:81 | cia1990 [8] | none | NOT IN CORPUS | The corpus holds other CIA 1990 papers (`cia_1990_economic_development_soviet`, `cia_1990_economic_discontent_soviet`), but not the JEC "Measures of Soviet GNP in 1982 prices". | |
| latvia-161 | 03_method:81 | harrison1993 [156] | none | NOT IN CORPUS | | |
| latvia-162 | 03_method:81 | Maddison1998b [312] | none | NOT IN CORPUS | The "nothing untoward" quotation is unchecked. | |
| latvia-163 | 03_method:81 | swedengdp_15602010 [19] | none | NOT IN CORPUS | | |
| latvia-164 | 03_method:81 | lobellschonkrantz2008 [148--53] | none | NOT IN CORPUS | | |
| latvia-165 | 03_method:81 | berend_centraleastern19441993 [195--7] | berend_1996_..._ch_economic_social_performance | PARTIAL | p. 197: "Central and Eastern Europe could not renew the technological bases of the old branches of industry." It concerns the seven East-Central European countries, not the USSR. It describes the old technological regime of iron, steel and engineering, and does not use the term mass production. | `...as befits indices that track output product by product and an economy that, like those of Central and Eastern Europe, could not renew the technological bases of its old branches of industry \parencite[195--7]{berend_centraleastern19441993}.` |
| latvia-166 | 03_method:83 | wbtransitionlatv [157] | world_bank_1993_latvia_..._ch_housing_municipal_services (also full-book folder p0157) | SUPPORTED | p. 157: "This military population is estimated to be about 300,000 persons, including family members, or 11 percent of the population." Note: the 80,000 garrison and "heaviest in the Baltic" have no source in this sentence. | |
| latvia-167 | 03_method:83 | hidden_inflation_sov [607] | none | NOT IN CORPUS | | |
| latvia-168 | 03_method:83 | kontorovich_2001 [688--9] | none | NOT IN CORPUS | | |
| latvia-169 | 03_method:83 | years_of_dependence [221] | misiunas_..._ch_centralization_westernization | SUPPORTED | p. 221: "While officially there was no inflation, the only combined price index published (that for the kolkhoz markets in four Latvian cities) showed ... 4 per cent in 1970-5 and 13 per cent in 1975-7." | |
| latvia-170 | 03_method:83 | baltictransitioncontraction [5] | de_broeck_koen_2000_great_contractions_russia | PARTIAL | p. 5: "A conservative assumption could be that it represented 10 per cent of official GDP in 1989 ... An alternative assumption would be that the shadow economy represented 20 per cent". These are illustrative assumptions in a Russian example, not estimates for the USSR. | `Unregistered activity, put at 10--20 per cent of official GDP in 1989 in the IMF's alternative assumptions for Russia, was of a size...` |
| latvia-171 | 03_method:83 | shadow_europe [90--1] | none | NOT IN CORPUS | | |
| latvia-172 | 03_method:83 | king_1965_economic [84] | king_1965_..._ch_world_ii_losses | SUPPORTED | p. 84: "Finally, several thousands of Latvian citizens were lost when part of the Abrene district was ceded to the Russian S.F.S.R." | |
| latvia-173 | 03_method:83 | years_of_dependence [74] | misiunas_..._ch_years | SUPPORTED | p. 74: "the detachment of part of the Abrene district in the northeast, about 2 per cent of the pre-war territory and population." | |
| latvia-174 | 03_method:83 | hiden_salmon [129--30] | Hiden 1994 Soviet winter | SUPPORTED | pp. 129-30: "Latvia's territorial and population losses amounted to about 2 per cent." | |
| latvia-175 | 04_latvia:21 | krumins_2017_tautsaimnieciba_1940 [183--8] | krumins_2017_latvijas_tautsaimnieciba_1940_1941 | SUPPORTED | p. 183 (Latvian): "1940. gada nogalē nacionalizēti bija jau 1477 rūpniecības uzņēmumi, kas ražoja 84,4% produkcijas" (by the end of 1940, 1,477 industrial enterprises producing 84.4% of output had been nationalised). p. 185: rouble-lat rate set "1:1". p. 188: on 25 March 1941 the lat was withdrawn "bez iepriekšēja brīdinājuma" (without prior warning). p. 187: savings above 1,000 lats annulled. | |
| latvia-176 | 04_latvia:21 | years_of_dependence [32] | misiunas_..._ch_years | PARTIAL | p. 32: "The Latvian lat, which had officially been worth 10 rubles, was made equal in value." This supports par exchange only. The same page says "The Baltic currencies were eventually abolished in late 1940", which conflicts with the sentence's March 1941 (Krūmiņš p. 188 supports March 1941). | (none required; Krūmiņš carries the March 1941 date) |
| latvia-177 | 04_latvia:21 | terleckaspinigai [290--4] | terleckas_2022_pinigai_lietuvoje_ch_nacionalines_pinigu_sistemos | PARTIAL | p. 290 (Lithuanian): a Soviet memo of 29 July 1940 found that "lato kursą tektų padidinti 6-8 kartus" (the lat rate would have to be raised 6-8 times) to match purchasing power. This supports the undervaluation of the lat. The rest of pp. 290-4 is about Lithuania (deposit limit of 1,000 rb, litas at 0.9 rb, price rises). Nothing on the Latvian withdrawal or annulment. | |
| latvia-178 | 04_latvia:21 | krumins_2017_tautsaimnieciba_1940 [194--5] | krumins_2017_latvijas_tautsaimnieciba_1940_1941 | SUPPORTED | p. 194 (Latvian): "1940. gada oktobrī PSRS vadības līmenī tika pieņemts slepens lēmums par lielas militāras aviācijas rūpnīcas būvi Rīgā" (in October 1940 a secret decision was taken at Soviet leadership level to build a large military aviation plant in Riga). Machine tools were requisitioned "no rūpnīcas VEF - 25 gab." (25 from VEF). | |
| latvia-179 | 04_latvia:21 | labsvirs_1959_case [53--4] | labsvirs_..._ch_changes_agriculture_during | PARTIAL | p. 53: "on June 13-14, 1941, when approximately 15,600 persons were deported". The paper says "some 15,500" (Misiunas p. 42 gives 15,081). This page supports only the deportation clause. | `The deportation of some 15,000--15,600 people on 14 June 1941,...` |
| latvia-180 | 04_latvia:21 | king_1965_economic [81--94] | king_1965_..._ch_world_ii_losses | SUPPORTED | p. 86, Table VI, total "570,000". p. 93: "only about 10% of the population losses were caused by military operations ... Over half a million persons, or 25% of the prewar population". | |
| latvia-181 | 04_latvia:21 | years_of_dependence [42, 64] | misiunas_..._ch_years | PARTIAL | p. 42: "15,081 individuals ... were dispatched from Latvia". p. 64: "Of approximately 70,000 Jews who remained in Latvia after the Soviet retreat, only about 4,000 survived". That implies about 66,000 killed, not 70,000; King p. 83 also gives 66,000 Jews. | `...the Holocaust, which killed some 66,000 Latvian Jews,...` |
| latvia-182 | 04_latvia:23 fn | years_of_dependence [113] | misiunas_..._ch_postwar_stalinism | SUPPORTED | p. 113: "The pre-war level of industrial production was certainly reached by 1949 in Latvia and Estonia". | |
| latvia-183 | 04_latvia:23 fn | mertelsmann_2003_there [167--9] | mertelsmann_2003_there_stalinist_industrialization | SUPPORTED | p. 167: industry "did not recover until the second half of the 1950s". p. 169: "Without any doubt, Lithuanian and Latvian industries developed according to similar patterns." | |
| latvia-184 | 04_latvia:23 fn | years_of_dependence [185--6] | misiunas_..._ch_re_emergence_national | SUPPORTED | p. 185: "urban industrial families in Latvia consumed 30 to 50 per cent less meat, eggs and dairy products in 1961." | |
| latvia-185 | 04_latvia:23 fn | puur_2019_turbulent [38] | puur_et_al_2019_turbulent_political_history | SUPPORTED | p. 38: "pre-war living standards were reached in the 1960s." | |
| latvia-186 | 04_latvia:23 | eglite_2015_migracija [46--7] | eglite_2015_migracija_rupniecibas_attistibai | SUPPORTED | p. 47, Table 1 (Latvian): "1946-1950 ... 272,0? ... 90,1" (migration 272,000; migration share of growth 90.1%). | |
| latvia-187 | 04_latvia:23 | krumins_2017_sovetizacijas [233--4] | krumins_2017_latvijas_tautsaimnieciba_sovetizacijas | SUPPORTED | p. 233 (Latvian): Latvia "spēja saražot 31,5% visa tanī pašā laikā PSRS saražotā apjoma" (made 31.5% of the USSR's radios). p. 234: "1945.-1950. gadā rūpniecībā strādājošo skaits dubultojās (no 75 līdz 160 tūkstošiem)" (industrial employment doubled, from 75,000 to 160,000). | |
| latvia-188 | 04_latvia:23 | vaskela_2014_lietuvos [244] | vaskela_2014_lietuvos_ukis_tsrs | SUPPORTED | p. 244, Table 14 (Lithuanian): industrial workers in Latvia, thousands: "1945 ... 54,8"; "1950 ... 135,8". That is more than double. | |
| latvia-189 | 04_latvia:23 | krumins_2017_sovetizacijas [251--7] | krumins_2017_latvijas_tautsaimnieciba_sovetizacijas | SUPPORTED | p. 251 (Latvian): "uz Latvijas PSR budžetu tika novirzīta tika aptuveni ceturtā daļa no tiem ienākumiem" (about a quarter of the revenue went to the republic's budget). p. 253: "pēc padomju avotiem, 2 miljardi rubļu piecos pēckara gados" (2 billion roubles in the five post-war years, per Soviet sources). p. 254: military and repressive spending "sasniedza pat pusi" (reached as much as half). | |
| latvia-190 | 04_latvia:23 | pazdere_2015_visparejs [9] | pazdere_2015_visparejs_parskats_latvijas | PARTIAL | p. 9 (Latvian, quoting Krūmiņš): revenue exceeded spending "par 14,5 miljardiem rubļu, kas sastāda 18,4%" (by 14.5 billion roubles, i.e. 18.4%), so the 18 per cent is supported. Then: "no 44,3 miljardiem ... vēl 13,3 miljardi, jeb 15,7% tika izlietoti PSRS militārām vajadzībām" (of the 44.3 billion, a further 13.3 billion, or 15.7%, went to Soviet military needs), and "1/3 daļa no Latvijas budžeta" (a third of Latvia's budget) served USSR needs. 13.3/44.3 is 30% of the republican budget; 15.7% is a share of total revenue (13.3/84.9). So "a further sixth of the republican budget" misreads the source. | `...the Union retained 18 per cent of what it collected there, and a further 13.3 billion roubles, 15.7 per cent of all revenue raised there, was spent from the republican budget on Soviet military needs \parencites[251--7]{krumins_2017_sovetizacijas}[9]{pazdere_2015_visparejs}{gatis_compensations}.` |
| latvia-191 | 04_latvia:23 | gatis_compensations | none | NOT IN CORPUS | Krūmiņš (2018), *Defence Strategic Communications*, is not in the corpus (the Pazdere volume has a different Krūmiņš 2015 chapter on the military budget). | |
| latvia-192 | 04_latvia:23 fn | aage_1997_public [102] | Aage 1997 Public sector development | SUPPORTED | p. 102: "the Baltic countries ... probably received positive net transfers from Russia, mainly in the form of cheap energy." | |
| latvia-193 | 04_latvia:23 fn | viksnins_1986_latvian [252] | viksnins_1986_latvian_economy_change | SUPPORTED | p. 252: "the answer depends crucially on what price is assigned to energy imports, especially the price of oil." (This is said of USSR-Eastern Europe subsidy calculations and applied to whether Latvia supported the USSR.) | |
| latvia-194 | 04_latvia:23 fn | samonis_1995_transforming [6--7] | Samonis 1995 Transforming the Lithuanian economy | SUPPORTED | p. 7: "On a net basis, Soviet policies resulted in a drain of resources away from Lithuania". p. 6 rejects the cheap-energy argument. | |
| latvia-195 | 04_latvia:25 fn | feest2014 [99--100] | Feest 2014 | SUPPORTED | Footnote 81: "In Operation Priboi, 33,496 people from Lithuania, 41,445 from Latvia, and 20,660 from Estonia were deported." | |
| latvia-196 | 04_latvia:25 fn | strods_2006_nonviolent [172] | strods_2006_nonviolent_resistance_movement | SUPPORTED | p. 172: "after the deportations of 25 March 1949." | |
| latvia-197 | 04_latvia:25 fn | pocius_2019_lietuvos [75] | pocius_2019_lietuvos_kolektyvizacija_vkp | SUPPORTED | p. 75 (Lithuanian): operation "Priboj" carried out "1949 m. kovo 25-28 d." (25-28 March 1949). This is for Lithuania, but it is the same Baltic-wide operation. | |
| latvia-198 | 04_latvia:25 fn | labsvirs_1959_case [90] | labsvirs_..._ch_process_collectivization_during | SUPPORTED | p. 90: "from March 24 until March 27, 1949, about 50,000 Latvians were deported" (also quotes a US Congress figure of 70,000). | |
| latvia-199 | 04_latvia:25 fn | years_of_dependence [99] | misiunas_..._ch_postwar_stalinism | SUPPORTED | p. 99: "about 60,000 individuals were deported from Estonia and at least 50,000 from Latvia." | |
| latvia-200 | 04_latvia:25 fn | years_of_dependence [102] | misiunas_..._ch_postwar_stalinism | SUPPORTED | p. 102: "By the end of the year, 93 per cent of the Latvian and 80 per cent of the Estonian farms were collectivized." | |
| latvia-201 | 04_latvia:25 fn | terleckas_2026_siferio [225] | terleckas_2026_..._ch_kolektyvizacijos_link | SUPPORTED | p. 225 (Lithuanian): "1950 m. sausio 1 d. ... Latvijoje - 90 proc." (on 1 January 1950, 90 per cent in Latvia). | |
| latvia-202 | 04_latvia:25 | krumins_2017_sovetizacijas [245--50] | krumins_2017_latvijas_tautsaimnieciba_sovetizacijas | SUPPORTED | p. 247, Table 8 (Latvian): meat, roubles per tonne, "1948. gads 16 640" and "1949. gads (pēc kooperācijas likvidēšanas) 680" (16,640 in 1948; 680 in 1949 after the cooperatives were liquidated). Dairy cooperation was liquidated by decision of 29 June 1949. | |
| latvia-203 | 04_latvia:25 | labsvirs_1959_case [86--99] | labsvirs_..._ch_process_collectivization_during | PARTIAL | pp. 86-99 cover the 1949 collectivisation drive. p. 94, Table 16: kolkhoz land 9.7% (1 Jan 1949) to 82.9% (1 Jan 1950). Nothing on cooperative dairies, credit societies or procurement prices, which is the clause the citation closes. | Move the citation to the collectivisation clause: `...and to 93 per cent by the end of December 1949 on Krūmiņš's \parencite[86--99]{labsvirs_1959_case},` and keep `\parencites[245--50]{krumins_2017_sovetizacijas}[48]{aizsilnieks_1974_sovietization}` at the end of the sentence. |
| latvia-204 | 04_latvia:25 | aizsilnieks_1974_sovietization [48] | aizsilnieks_1974_sovietization_consumers_cooperation | SUPPORTED | p. 48: "the Soviet government abolished credit cooperative societies there also"; dairy societies "converted into state-owned plants in 1940, and the rest after the Second World War." | |
| latvia-205 | 04_latvia:25 | labsvirs_1959_case [219--23, 269--71] | labsvirs_..._ch_comparative_efficiency_material; ..._ch_future_soviet_agriculture | PARTIAL | p. 219: grain yield 13.1 (1937-9) vs 7.4 centners (1951-6), so "little more than half" holds. p. 222: milk 0.81 vs 1.77 million t, "a decrease of 54 per cent". p. 269: plots "9.5 per cent" of sown area. But pp. 270-1 say "kolkhoz markets in the main cities accounted for more than 60 per cent of the total retail turnover of meat and milk products" (1956). That is kolkhoz-market sales by kolkhozes, peasants and individual farmers, not supply from private plots. | See latvia-206. |
| latvia-206 | 04_latvia:25 | krumins_2017_tautsaimnieciba_1950 [281--4] | krumins_2017_latvijas_tautsaimnieciba_1950_1960 | PARTIAL | p. 282 (Latvian): "individuālie ražotāji - 1958. gadā vairāk nekā pusi piena un gaļas" (individual producers made more than half of milk and meat in 1958). This is production, not urban sales. p. 284: grain yields in the mid-1950s were "divas ar pusi reizes zemāka" (two and a half times lower) than in the late 1930s (5.7 vs 13.2), which is lower than "little more than half". The 59 per cent (1947) and 60-67 per cent (to 1955) output figures are not on these pages (presumably the paper's own series). | `...and the kolkhoz households' private plots, a tenth of the sown area, still produced more than half of the republic's milk and meat in 1958, while the kolkhoz markets accounted for more than 60 per cent of urban retail sales of meat and milk products \parencites[219--23, 269--71]{labsvirs_1959_case}[281--4]{krumins_2017_tautsaimnieciba_1950}.` |
| latvia-207 | 04_latvia:27 | krumins_2017_tautsaimnieciba_1960 [303] | krumins_2017_latvijas_tautsaimnieciba_1960_1985 | SUPPORTED | p. 303 (Latvian): "Laika posmā kopumā (1960-1985) imigrācijas rezultātā iedzīvotāju skaits pieauga par 292 tūkstošiem" (over 1960-85 as a whole, immigration raised the population by 292,000). | |
| latvia-208 | 04_latvia:27 | eglite_2015_migracija [50] | eglite_2015_migracija_rupniecibas_attistibai | SUPPORTED | p. 50, Table 4: Latvia, titular nationality "62,0" (1959) and "52,0" (1989). | |
| latvia-209 | 04_latvia:27 | puur_2019_turbulent [43--4] | puur_et_al_2019_turbulent_political_history | SUPPORTED | Table 2.2 (pp. 43-4): Latvians "(62%) ... (52%)" for 1959 and 1989. | |
| latvia-210 | 04_latvia:27 fn | smith_2003_republican [249--50] | smith_2003_republican_authority_khrushchev | SUPPORTED | pp. 249-50: "In mid-June, a commission from Moscow investigated ... between 21 June and 4 July ... Berklāvs was summarily dismissed. By the end of the year he was followed by ... Lācis, and finally First Secretary Kalnbērziņš". | |
| latvia-211 | 04_latvia:27 fn | strods_2006_nonviolent [172] | strods_2006_nonviolent_resistance_movement | SUPPORTED | p. 172: "During the plenum of the LCP CC in 1959, after the defeat of the opposition, 30 leading members were dismissed from their posts." This covers the purge in general only. | |
| latvia-212 | 04_latvia:27 fn | grybkauskas_2022_economic [487--8] | grybkauskas_2022_economic_strategies_immigration | SUPPORTED | p. 487: the purge was "a process that took two and a half years". p. 488: Pelše's leadership was "removing the limit on the number of immigrants from other republics". | |
| latvia-213 | 04_latvia:27 | krumins_2017_tautsaimnieciba_1950 [259--65] | krumins_2017_latvijas_tautsaimnieciba_1950_1960 | SUPPORTED | p. 263 (Latvian): "Latvijas vietējo interešu lobēšana Maskavā kļuva ievērojami vājāka nekā Lietuvas un Igaunijas gadījumos" (lobbying for Latvia's interests in Moscow became much weaker than in Lithuania's and Estonia's cases). p. 264: revenue split went from about three-quarters to the USSR in 1956 to nearly equal shares by 1958. p. 265: the sovnarkhoz controlled most of industry. | |

## Bibliography checks

| key | folder | grade | problem and corrected field(s) |
|---|---|---|---|
| aage_1997_public | Aage 1997 | BIB OK | |
| aizsilnieks_1974_sovietization | aizsilnieks_1974_... | BIB OK | |
| baltictransitioncontraction | de_broeck_koen_2000_... | BIB MINOR | Missing the working-paper number; the title ends with a stray period and has a double space. Use `@report`/`@techreport` with `number = {WP/00/32}`, `type = {IMF Working Paper}`, and title `The Great Contractions in Russia, the Baltics and the Other Countries of the Former Soviet Union: A View from the Supply Side`. |
| berend_centraleastern19441993 | berend_1996_... | BIB OK | The bib has "Berend, I. T." (Iván T.); the corpus `_bibinfo` reverses the initials ("T. I."). The bib is correct. |
| bolt_zanden_newgdp2021 | none | unchecked | No `_bibinfo`. Structural note: it is entered as `@inbook` with the book title in `series`; it should be `@incollection` with `booktitle = {How Was Life? Volume II: New Perspectives on Well-being and Global Inequality since 1820}`. |
| broad2007 | none | unchecked | No `_bibinfo` (auto-match wrong). |
| cia1990 | none | unchecked | |
| eglite_2015_migracija | eglite_2015_... | BIB OK | |
| feest2014 | Feest 2014 | BIB OK | |
| feinsteinthomas2002 | none | unchecked | |
| gatis_compensations | none | unchecked | |
| gerschenkron1957 | none | unchecked | |
| grybkauskas_2022_economic | grybkauskas_2022_... | BIB OK | |
| hamilton_transition | hamilton_de_vries_2025_... | BIB MINOR | Add `pages = {106977}` (article number) and `doi = {10.1016/j.worlddev.2025.106977}`. |
| harrison1993 | none | unchecked | |
| hidden_inflation_sov | none | unchecked | |
| hiden_salmon | Hiden 1994 | BIB MINOR | `_bibinfo` gives the revised edition: add `edition = {Rev. ed.}`. Authors are Hiden, J. W. and Salmon, P. |
| imf_transition | havrylyshyn_et_al_1999_... | BIB MINOR | Add `series = {IMF Occasional Paper}`, `number = {184}`. |
| jonassardy1970 | none | unchecked | |
| king_1965_economic | king_1965_... | BIB OK | |
| klimantas2025estonia | none (auto-match wrong) | unchecked | |
| klimantas2026soviet | klimantas_2026_accounting_soviet_republic | BIB OK | `_bibinfo` names Wolfson College, University of Oxford; the bib note "University of Oxford" is acceptable. |
| kontorovich_2001 | none | unchecked | |
| krumins_2017_gorbacova | krumins_2017_gorbacova_... | BIB OK | pp. 313-356 match. |
| krumins_2017_sovetizacijas | krumins_2017_..._sovetizacijas | BIB OK | pp. 229-257 match. |
| krumins_2017_tautsaimnieciba_1940 | krumins_2017_..._1940_1941 | BIB OK | pp. 178-201 match. |
| krumins_2017_tautsaimnieciba_1950 | krumins_2017_..._1950_1960 | BIB OK | pp. 258-286 match. |
| krumins_2017_tautsaimnieciba_1960 | krumins_2017_..._1960_1985 | BIB OK | pp. 287-312 match. |
| kyn_1997_eastern | Kyn 1997 | BIB OK | |
| labsvirs_1959_case | labsvirs_1959_... | BIB OK | |
| lobellschonkrantz2008 | none | unchecked | |
| Maddison1998b | none | unchecked | |
| mertelsmann_2003_there | mertelsmann_2003_... | BIB OK | |
| mpd2023 | none | unchecked | |
| norkusmark2021 | norkus_markeviciute_2021_... | BIB OK | |
| pazdere_2015_visparejs | pazdere_2015_... | BIB OK | |
| pocius_2019_lietuvos | pocius_2019_... | BIB OK | |
| puur_2019_turbulent | puur_et_al_2019_... | BIB OK | |
| samonis_1995_transforming | Samonis 1995 | BIB OK | |
| shadow_europe | none | unchecked | |
| smith_2003_republican | smith_2003_... | BIB OK | |
| strods_2006_nonviolent | strods_2006_... | BIB OK | |
| swedengdp_15602010 | none | unchecked | |
| terleckas_2026_siferio | terleckas_2026_... | BIB OK | |
| terleckaspinigai | terleckas_2022_pinigai_... | BIB MINOR | Edition string "2nd. ed." has a stray period; `_bibinfo`: "2-asis papild. ir pataisytas leid.". Use `edition = {2nd rev. and enl. ed.}`. The title dash should be an en dash: `1915--1944`. |
| vaskela_2014_lietuvos | vaskela_2014_... | BIB OK | |
| viksnins_1986_latvian | viksnins_1986_... | BIB OK | |
| wbtransitionlatv | World Bank 1993 Latvia (+ housing chapter) | BIB MINOR | Entered as `@misc`; it is a book in the World Bank Country Study series. Use `@book` with `series = {A World Bank Country Study}`, `publisher = {World Bank}`. |
| wdi2024 | none | unchecked | |
| years_of_dependence | misiunas_taagepera_1993_... | BIB MINOR | `_bibinfo` gives University of California Press; the bib gives Hurst, London. The 1993 expanded edition was co-published (Hurst, London; University of California Press, Berkeley), so either is defensible. Optionally add `publisher = {Hurst and University of California Press}`. |

## Summary

Counts by grade (71 instances):
- SUPPORTED: 39
- PARTIAL: 13
- NOT SUPPORTED: 0
- WRONG PAGE: 0
- PAGE MISSING: 1 (latvia-149)
- NOT IN CORPUS: 18

Bibliography (50 keys): BIB OK 26, BIB MINOR 7, BIB WRONG 0, unchecked 17 (no `_bibinfo`).

Instances needing action, most serious first:
1. **latvia-190** (04_latvia:23, pazdere [9]): "a further sixth of the republican budget spent on military needs" misreads the source. The 13.3 billion roubles is 15.7 per cent of all revenue, but 30 per cent of the republican budget. Reword as proposed.
2. **latvia-181** (04_latvia:21, years_of_dependence [42, 64]): the Holocaust toll "about 70,000" should be about 66,000. Misiunas gives 70,000 remaining and 4,000 survivors; King p. 83 gives 66,000.
3. **latvia-205 / latvia-206** (04_latvia:25): "private plots ... supplied more than half of the meat and milk sold in the cities" merges two different facts. Krūmiņš: private producers made more than half of milk and meat in 1958 (production). Labsvirs: kolkhoz markets had more than 60 per cent of urban retail turnover in 1956. Krūmiņš p. 284 also puts mid-1950s grain yields at 43 per cent of pre-war, not "little more than half" (Labsvirs's 56 per cent is for 1951-6).
4. **latvia-156** (03_method:73, years_of_dependence [289]): the source gives a 2-point annual overstatement for 1980-5. It does not say overstatement was "most severe in the final Soviet years" or mention "comparable prices".
5. **latvia-203** (04_latvia:25, labsvirs [86--99]): the citation sits on the dairies, credit and procurement-price clause but supports only the speed of collectivisation. Move it.
6. **latvia-179** (04_latvia:21, labsvirs [53--4]): 15,600 vs the paper's "some 15,500" (Misiunas 15,081).
7. **latvia-170** (03_method:83, De Broeck & Koen [5]): the 10-20 per cent figures are illustrative assumptions for Russia, not a Soviet estimate.
8. **latvia-165** (03_method:81, Berend [195--7]): the source is about Central and Eastern Europe's old technological regime, not Soviet "mass-production methods".
9. **latvia-147** (03_method:65, Kyn [260]): "above all in services" has no support on the page.
10. **latvia-176, 177, 148** are minor PARTIALs: co-citations supporting part of a multi-claim sentence. Misiunas p. 32 dates the abolition of the Baltic currencies to late 1940, against the paper's March 1941 (Krūmiņš supports March 1941).
11. **latvia-149** (Hamilton & de Vries [17]): the page is in the unconverted appendix; unverifiable.
12. **Unsourced in-sentence claim** at 03_method:83: the "Soviet garrison of 80,000 in 1990 ... heaviest in the Baltic republics" has no citation of its own (the World Bank p. 157 supports only the 300,000 / 11 per cent).
13. **Key-table errors**: `broad2007` and `klimantas2025estonia` are mis-mapped in `latvia_key_folders.tsv`; `wbtransitionlatv` is marked not_in_corpus but is present.
