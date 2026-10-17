# Plan: Bibliography, §2 Methodology Draft, Figure 7 Latvia-only from 1940
**Status:** DRAFT
**Date:** 2026-04-07
**Files modified:** 3

---

## Context

Three coordinated tasks before the paper body can be developed:
1. `Bibliography_base.bib` is empty — §2 and subsequent sections cannot be compiled without bibliography entries.
2. §2 Sources and Methodology contains four `[PLACEHOLDER]` stubs — the key methodological contribution of the paper.
3. Figure 7 stub in `figures.R` shows both Latvia and Estonia from 1919; Latvia's series only begins in 1940, so the figure must reflect that.

Source material: DPhil thesis (Ch. 3, pp. 97–102; bibliography pp. 242–256) plus the inline comments in `Paper/main.tex`.

---

## Task 1 — Populate `Bibliography_base.bib`

Write ~28 BibTeX entries covering the core secondary literature needed for §2 and cited elsewhere in the paper. Key clusters:

### Maddison Project
- `BoltVanZanden2014_maddison` — Bolt & van Zanden (2014), *Economic History Review* 67(3): 627–651 (MPD collaborative research)
- `BoltEtAl2018_rebasing` — Bolt, Inklaar, de Jong & van Zanden (2018), MPD Working Paper 10 (rebasing)
- `BoltVanZanden2020_maddison` — Bolt & van Zanden (2020), MPD 2020 update
- `BoltVanZanden2024_maddison` — Bolt & van Zanden (2024), MPD 2023 update

### CIA / Soviet GNP estimation
- `CIA1990_economic_development` — CIA (1990), *Economic Development in the Soviet Republics, 1970–89*
- `JEC1990_measures` — Joint Economic Committee (1990), *Measures of Soviet GNP in 1982 prices*
- `JEC1982_measures` — Joint Economic Committee (1982), *USSR: Measures of Economic Growth and Development, 1950–1980*
- `Bergson1987_comparative` — Bergson (1987), *AER* 77(3): 342–357
- `Bergson1961_real_national` — Bergson (1961), *The real national income of Soviet Russia since 1928*, Harvard
- `Bolotin1992_former_soviet` — Bolotin (1992), in Hirsh MEMO 3, IMEMO
- `Becker1994_CIA_estimates` — Becker (1994), *Post-Soviet Affairs* 10(4): 291–329
- `Maddison1998_measuring` — Maddison (1998), *Review of Income and Wealth* 44(3): 307–323

### Baltic interwar GDP estimates
- `KlimantasZirgulis2020_lithuania` — Klimantas & Zirgulis (2020), *Cliometrica* 14(2): 227–281 (Lithuania 1937 benchmark)
- `NorkusEtAl2022_latvia` — Norkus, Markevičiūtė, Grytten, Šiliņš & Klimantas (2022), *Cliometrica* (Latvia 1935 benchmark)
- `NorkusMarkeviciute2021_baltic` — Norkus & Markevičiūtė (2021), *Cliometrica* 15(3): 565–674 (Baltic GDP 1913–1938)
- `Clark1938_international` — Clark (1938), *Weltwirtschaftliches Archiv* 47: 51–76 (interwar PPP comparison)

### HNA methodology
- `Feinstein1972_national_income` — Feinstein (1972), *National income, expenditure and output of the UK, 1855–1965*
- `ThomasFeinstein1990_value_added` — Thomas & Feinstein (1990), "The value-added approach" in Guinnane et al.
- `LobellEtAl2008_swedish` — Lobell, Schön & Krantz (2008), *Scandinavian EHR* 56(2): 142–159
- `BroadberryMalinowski2021_living` — Broadberry & Malinowski (2021), in Morys (ed.), pp. 13–36
- `Kenny2024_irish` — Kenny (2024), *Economic History Review* (Irish GDP since independence)
- `ECB2003_discrepancies` — ECB (2003), *ECB Monthly Bulletin* Dec 2003: 42–43

### Comparative/background
- `Berend1996_central_eastern` — Berend (1996), *Central and Eastern Europe, 1944–1993*, Cambridge UP
- `Aldcroft2006_europes_third` — Aldcroft (2006), *Europe's third world*, Ashgate
- `Morys2021_economic_growth` — Morys (2021), in Morys (ed.), pp. 161–187
- `Morys2021_ed_economic_history` — Morys, M. ed. (2021), *The economic history of Central, East and South-East Europe*, Routledge

---

## Task 2 — Draft §2 Methodology (`Paper/main.tex`)

Replace four `[PLACEHOLDER]` blocks with journal-article prose (~2,000 words total). Each subsection follows the thesis Ch. 3 methodology closely, condensed to article length.

### §2.1 The Benchmark Extrapolation Approach (~500 words)
**Content:**
- Three approaches to GDP measurement; justify output (production) side: abundance of physical sectoral data, failure of monetary approaches under Soviet price distortions (cite JEC 1982, CIA 1990, Bolotin 1992)
- Core formula, displayed math:
  $$GDP_t = GDP_{\text{benchmark}} \times \text{indexGDP}_t$$
  where $\text{indexGDP}_t = \sum_{i=1}^{n} W_{i|\text{benchmark year}} \times \text{indexSector}_{it}$
- Physical product indicators preferred: kilograms of output, not monetary values — avoids Soviet price distortions
- Single vs. double deflation: justify single deflation (no reliable IC data; Soviet yearbooks report physical quantities, not intermediate consumption values; CIA also relied on single deflation for most sectors; Swedish experience shows small long-run bias)
- Cite: Feinstein (1972) for quality grades; Broadberry & Malinowski (2021) for the approach in the regional context; ECB (2003) for VA–GDP relationship

### §2.2 Latvia, 1940–1995 (~600 words)
**Content:**
- **Starting point:** Latvia's interwar GDP is established by Norkus et al. (2022), who construct a 1935 PPP benchmark and chain back to 1920. This paper uses that interwar series as an input and splices at 1940.
- **1940–1948 (WWII and immediate postwar):** Physical indices derived from German occupation statistics (*Ostland in Zahlen*, 1942; *Statistische Berichte für das Ostland*) and Latvian CSP. Population data from Latvijas statistikas gadagrāmata. Feinstein quality grade: 'approximate'.
- **Soviet period 1948–1989:** Sector output indices constructed from *Latvijas PSR Tautas saimnieciba* yearbooks (1957–1990), supplemented by *Narodnoye khozyaystvo SSSR* for cross-checks. Six sectors: agriculture, industry, construction, transport, trade, and public services. Weights from 1990 benchmark.
- **1990 benchmark:** Uses Bolotin (1992) CIA-derived estimates, converted to Int\$1990 via MPD 1990 rouble–dollar parities. Cross-checked against CIA (1990).
- **1990–1995:** Chained to official Latvian Central Statistical Bureau national accounts.
- Feinstein grade at splice years (1940, 1990): 'firm' — overlap of both series confirms consistency.

### §2.3 Estonia, 1919–1995 (~600 words)
**Content:**
- **Interwar benchmark:** New 1938 PPP benchmark constructed for this study using output approach and bilateral price comparison with interwar Sweden (Lobell et al. 2008 methodology). Key sectoral data from *Eesti majandus 1938*, RSK yearbooks, and *Kirk* (League of Nations 1946). Appendix A describes the calculation in detail.
- **1919–1938:** Growth index derived from Estonian statistical yearbooks (*Eesti statistika* monthly bulletins 1922–1939; RSK annual volumes). Chained at 1938 benchmark.
- **Soviet period 1948–1989:** Identical sector indicator method as Latvia; source: *Eesti NSV Rahvamajandus* yearbooks (1957–1990). Sector weights from 1990 benchmark.
- **1990 benchmark:** Same Bolotin/CIA source as Latvia.
- **Territorial scope:** Post-war Estonian SSR borders throughout. No Petseri/Narva territorial correction applied (Maddison Project criterion: <1/3 population change).
- **1990–1995:** Chained to Estonian Statistics official national accounts.

### §2.4 Benchmarking and PPP Conversion (~300 words)
**Content:**
- **1930s benchmarks:** Bilateral PPP comparisons with Sweden using price baskets from statistical yearbooks; both 1935 (Latvia) and 1938 (Estonia) benchmarks already expressed in Int\$1990 by original studies (Norkus et al. 2022; this paper's Appendix A).
- **1990 benchmark:** Bolotin (1992) constructs sector-of-origin GDP for all Soviet republics in 1990 using CIA methodology; rouble values converted to USD via purchasing-power-adjusted exchange rates. Ratio to all-USSR MPD version 2023 figure used to convert Baltic values to Int\$1990.
- **Int\$2011 series:** Multiply Int\$1990 values by the 1990 conversion factor implicit in MPD version 2023 (ratio of 2011-based to 1990-based series for the USSR in 1990 = 1.594), following standard MPD procedure (Bolt et al. 2018).
- Cross-check: 1937–1940 overlap of interwar-extrapolated and occupation-period-extrapolated series shows <3% divergence for Latvia and Estonia — classified 'firm' on Feinstein's (1972) scale.

---

## Task 3 — Update Figure 7 stub in `scripts/R/figures.R`

Change the Figure 7 comment block:
- **Current:** "Latvia and Estonia as % Finnish GDP pc, 1919–1995"
- **Updated:** Latvia series starts 1940 (no pre-occupation data in this paper's scope); Estonia series starts 1919.
- Source note and `ggsave` call updated to reflect Latvia-only-from-1940 logic.

Specific change: update the comment block and add a note to the `ggsave` filename stub to indicate the asymmetric start years. No actual data code added yet (still a stub) — only the specification comment is updated to avoid implementing against unread data.

---

## Files Modified

| File | Change |
|------|--------|
| `Bibliography_base.bib` | Add ~28 BibTeX entries |
| `Paper/main.tex` | Replace 4 `[PLACEHOLDER]` blocks in §2 with ~2,000 words of prose + math |
| `scripts/R/figures.R` | Update Figure 7 stub comment: Latvia from 1940, Estonia from 1919 |

---

## Verification

1. **LaTeX compile:** Run 3-pass XeLaTeX + bibtex from `Paper/`. Confirm no undefined citations introduced by §2 draft.
2. **Citation check:** Every `\cite{}` key in §2 prose must have a matching entry in `Bibliography_base.bib`.
3. **Word count check:** §2 prose should be 1,900–2,100 words (target 2,000).
4. **R syntax:** `Rscript scripts/R/figures.R` runs without error (output: "figures.R: no figures generated yet").
5. **Quality score:** Run `python scripts/quality_score.py Paper/main.tex`. Target ≥ 80/100 to commit.
