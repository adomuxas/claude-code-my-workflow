# Latvia paper: final domain review (2026-10-22)

**Reviewer:** domain-reviewer agent (read-only; the orchestrator saved this report)
**Verdict:** major revisions. They are driven by the comparator data after 1989; almost all earlier points have been applied.

**Spot-checks:** about 30 numbers in the text were checked against T13–T16 and A3, and all match. These include:
- the T15 growth rates, residuals and sample sizes;
- the T16 recovery years;
- the peaks in farm output and construction.

T14 is never cited by number in the text.

## Orchestrator check of issue 1 (confirmed)
`Datasheets/GDPpc 1990usd.csv`, GDP per capita in Int$1990:

| Year | Norway | Sweden | Denmark | Switzerland |
|---|---|---|---|---|
| 1990 | 18,465 | 17,609 | 18,452 | 21,487 |
| 2019 | 53,397 | 28,503 | 30,263 | 39,177 |

- Norway grows 3.7%/yr over 1990–2019. Its real per-capita growth was about 1.7%/yr, which would put 2019 near 30,000.
- Switzerland grows 2.1%/yr against a real rate of about 0.8%/yr.

The datasheet is read by both `scripts/R/latvia_tables.R` and `scripts/R/tables.R`.

## Issues

| # | Sev. | File:line | Problem | Fix |
|---|---|---|---|---|
| 1 | CRITICAL | `Datasheets/GDPpc 1990usd.csv` → A3, T7, T13, T15(c) | Comparator growth after 1989 fails plausibility. Norway and Switzerland are far too high, and Hungary 3.07 and Romania 4.46 are suspect. These look like current-PPP levels, not volume series, while the Baltic series are volumes. | Rebuild the post-1990 comparators by chaining MPD2023 real growth from 1990 levels. Rerun T7, T8 and T13–T15. Until then drop "behind Poland, Romania, Albania and Hungary" (05:67). |
| 2 | MAJOR | 05:59; 06:11 | "None [has] regained its 1913 position" against the Nordics. In T8 Lithuania is at 56 in both years, and the Norway error lowers the Nordic ratios. | "Latvia and Estonia have not regained it; Lithuania has." (re-check after #1) |
| 3 | MAJOR | 05:67; 06:11 | Hedging. Panel (c): slope −0.56 (s.e. 0.34), R² 0.06, residual s.d. 1.1. The Baltic residuals (+0.75, +0.32, +0.05) are each under one s.d. The text says the period "restores a single downward-sloping line" and Lithuania lies "well above" it. | Call it a weak, non-significant slope. Say the Baltic differences lie within the regression's precision. |
| 4 | MAJOR | 05:67 | "almost every peripheral economy outgrew the core" is wrong. Finland, Greece, Iceland, Italy and many post-Soviet and Balkan economies did not. | "most ECE economies outgrew the core; of the Western periphery only Ireland, Spain and Portugal did." |
| 5 | MAJOR | 05:43; 01:12; T7/T13/A3 | The Latvia/USSR ratio for 1938 (144) uses Maddison's USSR level, while the USSR is rescaled ×0.91 from 1946. On a consistent basis 1938 is about 158. The USSR growth rates in T7 and A3 also differ from those implied by T13. | Rescale the pre-1946 USSR by 6,275/6,894 and restate the ratios. |
| 6 | MAJOR | 05:37 | "regained … in 1946, `\lvREGAINthirtyeight{}` and 1948 respectively" puts Latvia at 1946, contradicting 04:15 and 06:9 (1948). The Latvian macro sits in Estonia's slot. | Reorder the years and re-check "two years before". |
| 7 | MAJOR | 05:59, 05:75; A1 | 2024 values unreconciled: A1 has Latvia 17,725, the Datasheets 17,076. Datasheets Estonia 2024 is above its 2019 level, contradicting "below its 2019 level". The "poorest in 2024" claim depends on which value is used. | Reconcile the 2024 row or state the claims for 2023. |
| 8 | MAJOR | 03:21; 05:31 | Two `\authorcheck` boxes still render (Bolotin industry uplift; T9 employment sources). | Resolve both and remove the boxes. |
| 9 | MINOR | T15 note | Lists Albania as socialist in (b), but A3 has no (b) data for Albania. | Delete Albania from the list. |
| 10 | MINOR | 05:67 | "Lithuania fell well below"; "Latvia furthest" (Hungary and Poland lie further below); "except Yugoslavia" (residual ≈0); the frontrunners list leaves out Montenegro and Malta. | "below it"; "furthest of the three"; "which lies on it"; "among the frontrunners". |
| 11 | MINOR | 05:33 | "They had been close in 1913, Latvia at 112 per cent." | "Latvia had stood above Finland in 1913 (112 per cent)." |
| 12 | MINOR | 05:53, 05:57 | "comparable to the Second World War": Latvia −45 vs −28. | "as deep as or deeper than". |
| 13 | MINOR | 05:59 | The years with Lithuania above Latvia leave out 2008 (13,099 > 13,015). | "1992–9 and 2008". |
| 14 | MINOR | 06:11 | "demographic cost without parallel". Moldova, Bosnia and Georgia are comparable. | "among the heaviest". |
| 15 | MINOR | appendix:9 | "from 1991" conflicts with 03:67, where 1991 is averaged and the modern series starts in 1992. | "from 1992 (1991 averaged)". |

## Earlier points not fully applied
- **Domain review 1.10 (2024 row):** not applied (#7).
- **Domain review 3.1 (USSR benchmark):** applied from 1946 only (#5).
- **Domain review 6.4:** the NMP-based comparator caveat is at 05:45 but not in the β section.
- **Cite-pass #8:** "by a narrow margin" survives at 05:75, qualified with "on the present series"; acceptable.
