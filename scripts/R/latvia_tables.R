# =============================================================================
# latvia_tables.R -- data pipeline for
#   "Baltic growth puzzle: the first Latvian Soviet-period series and a Baltic
#    comparative growth analysis, 1919-2025"
#   (Klimantas, Broadberry, Klesment and Krumins)
#
# Inputs (all relative to the repository root):
#   Data/Klimantas_2025_data.xlsx           GDP per capita and population, LT/LV/EE
#   Data/latvia_benchmarks_1935_1990.csv    1935 and 1990 benchmark value-added
#   Data/latvia_overlaps.csv                overlap differences 1937-40, 1990-95
#   Data/latvia_previous_estimates.csv      Roses-Wolf, Norkus-Markeviciute, MPD
#   Data/latvia_sensitivity.csv             bias table rows (from the thesis)
#   Data/baltic_*.csv                       war impact, collectivisation, structure,
#                                           transition estimates (from the thesis)
#   Datasheets/*.csv                        comparator series (cite Sources.csv)
# Outputs:
#   Tables/latvia/T*.tex, A*.tex            main-text and appendix tables
#   Tables/latvia/numbers.tex               LaTeX macros for numbers quoted in prose
#   Figures/latvia/F*.pdf                   figures (base R graphics)
#   Paper/latvia/supplementary/Latvia_online_data_appendix.xlsx
#
# Run from the repository root:  Rscript scripts/R/latvia_tables.R
# No stochastic operations; no set.seed() needed.
# Author: A. Klimantas (pipeline drafted with Claude Code)   Last revised: 2026-10-17
# =============================================================================

library(readxl)
library(openxlsx)

if (!file.exists("Data/Klimantas_2025_data.xlsx"))
  stop("Run this script from the repository root (Data/Klimantas_2025_data.xlsx not found).")

out_dir <- file.path("Tables", "latvia")
fig_dir <- file.path("Figures", "latvia")
sup_dir <- file.path("Paper", "latvia", "supplementary")
for (d in c(out_dir, fig_dir, sup_dir)) dir.create(d, recursive = TRUE, showWarnings = FALSE)

# ---- helpers -----------------------------------------------------------------

write_tex <- function(lines, fname) {
  path <- file.path(out_dir, fname)
  writeLines(lines, con = path, useBytes = FALSE)
  message("Written: ", path)
}
read_sc <- function(path) {
  read.csv(path, sep = ";", dec = ".", check.names = FALSE,
           stringsAsFactors = FALSE, fileEncoding = "UTF-8-BOM")
}
fmt   <- function(x, d = 0) ifelse(is.na(x), "---",
                                   formatC(round(x, d), format = "f", digits = d, big.mark = ","))
fmt1  <- function(x) fmt(x, 1)
fmtg  <- function(x) { r <- round(x, 1)
  ifelse(is.na(r), "---", ifelse(r < 0, paste0("$-$", sprintf("%.1f", abs(r))), sprintf("%.1f", abs(r)))) }
fmtsg <- function(x) { r <- round(x, 1)
  ifelse(is.na(r), "---", paste0(ifelse(r >= 0, "+", "$-$"), sprintf("%.1f", abs(r)))) }
fmtp  <- function(x) { r <- round(x)                                        # percentage, 0 dp, true minus
  ifelse(is.na(r), "---", ifelse(r < 0, paste0("$-$", abs(r)), sprintf("%.0f", abs(r)))) }
fmtpm <- function(x) { r <- round(x); ifelse(is.na(r), "---", ifelse(r < 0, paste0("$-$", abs(r)), as.character(r))) }
esc   <- function(s) gsub("&", "\\\\&", s)
cagr  <- function(v0, v1, n) ((v1 / v0)^(1 / n) - 1) * 100
feinstein <- function(d) { ad <- abs(d)
  ifelse(ad < 5, "Firm", ifelse(ad < 15, "Good", ifelse(ad < 25, "Rough", "Conjectural"))) }

# JEH-style table: "TABLE n" line, title in small caps (set in main.tex via caption package)
tex_table <- function(label, caption, colspec, header_lines, body_lines, note,
                      size = "\\small", placement = "[htbp]", colsep = NULL) {
  c(paste0("% ", label),
    paste0("\\begin{table}", placement),
    paste0("\\centering", size,
           if (!is.null(colsep)) paste0("\\setlength{\\tabcolsep}{", colsep, "}") else ""),
    paste0("\\caption{", caption, "}"),
    paste0("\\label{", label, "}"),
    "\\begin{threeparttable}",
    paste0("\\begin{tabular}{", colspec, "}"),
    "\\toprule",
    header_lines,
    "\\midrule",
    body_lines,
    "\\bottomrule",
    "\\end{tabular}",
    "\\begin{tablenotes}[para,flushleft]",
    "\\footnotesize",
    note,
    "\\end{tablenotes}",
    "\\end{threeparttable}",
    "\\end{table}")
}

# =============================================================================
# 1. BALTIC GDP PER CAPITA AND POPULATION (Data/Klimantas_2025_data.xlsx)
# =============================================================================

wb_path   <- "Data/Klimantas_2025_data.xlsx"
last_year <- 2024          # last year of the Baltic series in the workbook
last_cmp  <- 2023          # last year with comparator series (MPD 2023 + WDI)

raw_gdp <- as.data.frame(read_excel(wb_path, sheet = "GDP per capita", col_names = FALSE,
                                    .name_repair = "minimal"))
first_row <- which(suppressWarnings(as.numeric(raw_gdp[[1]])) == 1913)[1]
gdp_blk <- raw_gdp[first_row:nrow(raw_gdp), 1:4]
gdp_blk[] <- lapply(gdp_blk, function(z) suppressWarnings(as.numeric(z)))
names(gdp_blk) <- c("year", "Lithuania", "Latvia", "Estonia")
gdp_blk <- gdp_blk[!is.na(gdp_blk$year) & gdp_blk$year <= last_year, ]
stopifnot(abs(gdp_blk$Latvia[gdp_blk$year == 1938] - 3098.9) < 0.1,
          abs(gdp_blk$Latvia[gdp_blk$year == 1990] - 7965.0) < 0.01,
          abs(gdp_blk$Latvia[gdp_blk$year == 2024] - 17724.57) < 0.01)

years_all <- c(1913, 1919:last_year)
lv_gdp90 <- setNames(gdp_blk$Latvia[match(years_all, gdp_blk$year)], years_all)
lt_gdp90 <- setNames(gdp_blk$Lithuania[match(years_all, gdp_blk$year)], years_all)
ee_gdp90 <- setNames(gdp_blk$Estonia[match(years_all, gdp_blk$year)], years_all)
stopifnot(!anyNA(lv_gdp90), !anyNA(lt_gdp90), !anyNA(ee_gdp90))
# Int$2011 per Int$1990: Bolt & van Zanden (2024), MPD 2023 paper, p. 12
INT11_PER_INT90 <- 1.594
lv_gdp11 <- lv_gdp90 * INT11_PER_INT90

raw_pop <- as.data.frame(read_excel(wb_path, sheet = "Population", col_names = FALSE,
                                    .name_repair = "minimal"))
hdr <- which(apply(raw_pop, 1, function(r) any(r == "Latvia", na.rm = TRUE)))[1]
pop_blk <- raw_pop[(hdr + 1):nrow(raw_pop), ]
names(pop_blk) <- as.character(unlist(raw_pop[hdr, ]))
names(pop_blk)[2] <- "year"
pop_blk <- data.frame(year = suppressWarnings(as.numeric(pop_blk$year)),
                      Lithuania = suppressWarnings(as.numeric(pop_blk$Lithuania)),
                      Latvia    = suppressWarnings(as.numeric(pop_blk$Latvia)),
                      Estonia   = suppressWarnings(as.numeric(pop_blk$Estonia)))
pop_blk <- pop_blk[!is.na(pop_blk$year), ]
lv_pop <- setNames(pop_blk$Latvia[match(years_all, pop_blk$year)], years_all)
lt_pop <- setNames(pop_blk$Lithuania[match(years_all, pop_blk$year)], years_all)
ee_pop <- setNames(pop_blk$Estonia[match(years_all, pop_blk$year)], years_all)
stopifnot(abs(lv_pop["1913"] - 2275) < 0.01, !anyNA(lv_pop))

# population-weighted Baltic aggregate
bal_gdp90 <- (lv_gdp90 * lv_pop + lt_gdp90 * lt_pop + ee_gdp90 * ee_pop) / (lv_pop + lt_pop + ee_pop)

# =============================================================================
# 2. COMPARATOR SERIES (Datasheets/, cite from Datasheets/Sources.csv)
# =============================================================================

ds <- "Datasheets"
g_raw <- read_sc(file.path(ds, "GDPpc 1990usd.csv"))
g_year <- g_raw[[1]]
#' Read one comparator column of the Datasheets GDP file by name (copy j if the name is duplicated)
g_col <- function(name, which_copy = 1) {
  idx <- which(names(g_raw) == name)
  if (length(idx) < which_copy) stop("Datasheets column not found: ", name)
  v <- suppressWarnings(as.numeric(g_raw[[idx[which_copy]]]))
  setNames(v[match(years_all, g_year)], years_all)
}
# every Datasheets copy of a Baltic series (the file carries each one twice) must equal the
# workbook series through 2023; the count guard stops an all-NA column from passing vacuously
check_same <- function(ds_name, wb_series) {
  for (j in seq_along(which(names(g_raw) == ds_name))) {
    d <- abs(g_col(ds_name, j) - wb_series); d <- d[names(d) <= last_cmp]
    stopifnot(sum(!is.na(d)) > 100, max(d, na.rm = TRUE) < 0.01)
  }
}
check_same("Lithuania", lt_gdp90); check_same("Latvia", lv_gdp90); check_same("Estonia", ee_gdp90)
# The Datasheets 2024 row is an older vintage than the workbook (not compared: comparators end in 2023);
# the paper, the appendix workbook and every macro use the workbook series.

cmp <- list(
  Finland   = g_col("Finland"),
  Sweden    = g_col("Sweden"),
  Denmark   = g_col("Denmark"),
  Nordics   = g_col("Nordics (Denmark, Finland, Iceland, Norway, Sweden)"),
  Western   = g_col("Western core"),
  Periphery = g_col("Western periphery"),
  ECE       = g_col("ECE"),
  USSR      = g_col("USSR"),
  AdjUSSR   = g_col("Adjusted USSR"),
  Russia    = g_col("Russia"),
  Poland    = g_col("Poland"),
  Czechoslovakia = g_col("Czechoslovakia"),
  Hungary   = g_col("Hungary"),
  Greece    = g_col("Greece"),
  Ireland   = g_col("Ireland"),
  Portugal  = g_col("Portugal"),
  Spain     = g_col("Spain"),
  Italy     = g_col("Italy"),
  Lithuania = lt_gdp90,
  Estonia   = ee_gdp90,
  Latvia    = lv_gdp90,
  Baltics   = bal_gdp90
)
# USSR after 1991: the Datasheets carry the former-Soviet-Union aggregate in the USSR column.
# Two Soviet levels exist: Maddison's (6,894 Int$1990 in 1990) and Bolotin's (6,275), the latter being the
# benchmark to which the Baltic series are anchored. The 'Adjusted USSR' column rescales Maddison's level
# to Bolotin's from 1946 (growth rates are unchanged). Ratios of a Baltic level to the Soviet level and the
# level plot therefore use the Bolotin-consistent series; growth rates and the regressions, which need one
# internally consistent USSR series from 1913, use Maddison's.
stopifnot(abs(cmp$AdjUSSR["1990"] - 6275) < 1)
cmp$USSRb <- ifelse(is.na(cmp$AdjUSSR), cmp$USSR, cmp$AdjUSSR); names(cmp$USSRb) <- names(cmp$USSR)
bal_ds <- g_col("Baltics"); d_bal <- abs(bal_ds - bal_gdp90) / bal_gdp90; d_bal <- d_bal[names(d_bal) <= last_cmp]
message("Baltic aggregate: max. deviation of the Datasheets copy from the workbook-weighted one: ", round(100 * max(d_bal, na.rm = TRUE), 2), " per cent")

# Sectoral volume indices, Latvia, 1938 = 100
sv_raw <- read_sc(file.path(ds, "Sectoral volume indices Baltics 1919-1995.csv"))
sv_year <- sv_raw[[1]]
sv_cols <- grep("_index_latvia$", names(sv_raw), value = TRUE)
sv <- as.data.frame(lapply(sv_raw[sv_cols], function(z) suppressWarnings(as.numeric(z))))
names(sv) <- sub("_index_latvia$", "", sv_cols)
rownames(sv) <- sv_year
stopifnot(abs(sv["1938", "Total GVA/GDP"] - 100) < 1e-6)
sv_lt_cols <- grep("_index_lithuania$", names(sv_raw), value = TRUE)
sv_lt <- as.data.frame(lapply(sv_raw[sv_lt_cols], function(z) suppressWarnings(as.numeric(z))))
names(sv_lt) <- sub("_index_lithuania$", "", sv_lt_cols); rownames(sv_lt) <- sv_year
sv_ee_cols <- grep("_index_estonia$", names(sv_raw), value = TRUE)
sv_ee <- as.data.frame(lapply(sv_raw[sv_ee_cols], function(z) suppressWarnings(as.numeric(z))))
names(sv_ee) <- sub("_index_estonia$", "", sv_ee_cols); rownames(sv_ee) <- sv_year

# =============================================================================
# 3. BENCHMARKS (Data/latvia_benchmarks_1935_1990.csv) -> Table 1
# =============================================================================

bm <- read_sc("Data/latvia_benchmarks_1935_1990.csv")
bm$v35 <- suppressWarnings(as.numeric(bm$value_1935_mLVL))
bm$v90 <- suppressWarnings(as.numeric(bm$value_1990_mroubles))
tax35  <- bm$v35[bm$sector == "Taxes less subsidies on products"]
agg35  <- grepl("\\(1935 total\\)", bm$sector)
sec90  <- !is.na(bm$v90)
gva90  <- sum(bm$v90[sec90]); gva35 <- sum(bm$v35[!is.na(bm$v35) & bm$sector != "Taxes less subsidies on products"])
stopifnot(abs(gva90 - 11391.3) < 0.2, abs(gva35 - 1061.8) < 0.2)
bench90 <- unname(lv_gdp90["1990"]); bench35 <- unname(lv_gdp90["1935"])
stopifnot(abs(bench35 - 2776.05) < 0.1)   # Norkus et al. (2022) benchmark in Int$1990, as used in the thesis
# every 1938 = 100 sectoral index must be exactly 100 in 1938, or 'regained' and 'peak' lose their meaning
stopifnot(all(abs(unlist(sv["1938", grep("Commerce", names(sv), invert = TRUE, value = TRUE)]) - 100) < 1e-6, na.rm = TRUE))
pick1 <- function(x, what) { if (length(x) != 1 || is.na(x)) stop("expected exactly one value for ", what); x }
gdp35 <- gva35 + tax35

# Table 1 rows: 1990 detailed sectors with their 1935 counterparts (aggregates where needed)
t1_rows <- list(
  c("Agriculture, forestry and fishing", "Agriculture, forestry and fishing"),
  c("Industry", "Industry"), c("Construction", "Construction"),
  c("Transport and communications", "Transport and communications"),
  c("Trade, accommodation and catering", NA), c("Finance and insurance", NA), c("Housing", NA),
  c("Education and culture", NA), c("Health", NA), c("Science", NA),
  c("Public administration", NA), c("Defence", NA), c("Other services", "Other services"))
t1_body <- character(0)
for (r in t1_rows) {
  v90 <- pick1(bm$v90[bm$sector == r[1]], r[1])
  v35 <- if (!is.na(r[2])) pick1(bm$v35[bm$sector == r[2]], r[2]) else NA
  t1_body <- c(t1_body, sprintf("%s & %s & %s & %s & %s \\\\", esc(r[1]),
                                fmt1(v90), fmtg(v90 / gva90 * 100),
                                ifelse(is.na(v35), "", fmt1(v35)), ifelse(is.na(v35), "", fmtg(v35 / gva35 * 100))))
  if (r[1] == "Housing") {
    v35 <- bm$v35[grepl("Trade, finance, housing and other commercial services", bm$sector)]
    t1_body <- c(t1_body, sprintf("\\quad \\textit{Commercial services, 1935 total} & & & \\textit{%s} & \\textit{%s} \\\\",
                                  fmt1(v35), fmtg(v35 / gva35 * 100)))
  }
  if (r[1] == "Defence") {
    v35 <- bm$v35[grepl("Public administration, defence, education and health", bm$sector)]
    t1_body <- c(t1_body, sprintf("\\quad \\textit{Public services, 1935 total} & & & \\textit{%s} & \\textit{%s} \\\\",
                                  fmt1(v35), fmtg(v35 / gva35 * 100)))
  }
}
t1_body <- c(t1_body, "\\midrule",
  sprintf("Gross value-added & %s & 100.0 & %s & 100.0 \\\\", fmt1(gva90), fmt1(gva35)),
  sprintf("Taxes less subsidies on products & --- & & %s & \\\\", fmt1(tax35)),
  sprintf("GDP at market prices & %s & & %s & \\\\", fmt1(gva90), fmt1(gdp35)),
  sprintf("GDP per capita, national currency & %s & & %s & \\\\",
          fmt1(gva90 * 1e6 / (lv_pop["1990"] * 1e3)), fmt1(gdp35 * 1e6 / (lv_pop["1935"] * 1e3))),
  sprintf("\\textit{GDP per capita, \\intlnineteen{}} & \\textit{%s} & & \\textit{%s} & \\\\",
          fmt(bench90), fmt(bench35)))
t1 <- tex_table("tab:benchmarks",
  "Benchmark GDP of Latvia by sector of origin, 1990 and 1935, current prices",
  "lrrrr",
  c("& \\multicolumn{2}{c}{1990} & \\multicolumn{2}{c}{1935} \\\\",
    "\\cmidrule(lr){2-3}\\cmidrule(lr){4-5}",
    "Sector & m.\\,roubles & \\% & m.\\,lats & \\% \\\\"),
  t1_body,
  paste0("\\textit{Notes:} the 1990 benchmark is at market prices: taxes less subsidies on products are carried within the sectors ",
         "that bore them and are not reported separately (shown as `---'). ",
         "The 1935 benchmark reports commercial and public services as two aggregates, shown in italics. ",
         "Population: mid-year. ",
         "\\textit{Sources:} 1990: \\textcite[184--6]{bolotin1992}, converted back to roubles with Bolotin's sectoral purchasing-power parities, ",
         "services other than trade and transport split with the 1987 Soviet input--output table \\parencite{wbinputoutput1987}; ",
         "1935: \\textcite[263--6, 287, 312]{norkuslatvia1935}; per capita figures in \\intlnineteen{}: see online appendix.")
)
write_tex(t1, "T1_benchmarks.tex")

# =============================================================================
# 4. OVERLAPS (Data/latvia_overlaps.csv) -> Table 3
# =============================================================================

ov <- read_sc("Data/latvia_overlaps.csv")
ov$final <- lv_gdp90[as.character(ov$year)]
ov$a <- NA_real_; ov$b <- NA_real_
i37 <- ov$overlap == 1940
r <- 1 + ov$diff_pct[i37] / 100
ov$a[i37] <- ifelse(ov$year[i37] == 1940, ov$final[i37] * 2 / (1 + r), ov$final[i37])  # interwar (1935-based)
ov$b[i37] <- ov$a[i37] * r                                                               # Soviet-period (1990-based)
i90 <- ov$overlap == 1991
tot_idx <- sv[["Total GVA/GDP"]]; names(tot_idx) <- rownames(sv)
sov_level <- function(y) unname(bench90 * tot_idx[as.character(y)] / tot_idx["1990"] *
                                  lv_pop["1990"] / lv_pop[as.character(y)])
for (k in which(i90)) {
  y <- ov$year[k]
  if (y == 1990) { ov$a[k] <- ov$final[k]; ov$b[k] <- ov$a[k] * (1 - ov$diff_pct[k] / 100) }
  else {
    ov$a[k] <- sov_level(y)
    ov$b[k] <- if (y == 1991) 2 * ov$final[k] - ov$a[k] else ov$final[k]
    ov$diff_pct[k] <- round((ov$a[k] - ov$b[k]) / ov$a[k] * 100, 1)
  }
}
# the recomputed 1991 difference must agree with the thesis's +2.5, or the method differs
stopifnot(abs(ov$diff_pct[ov$year == 1991] - 2.5) < 0.3)
ov$grade <- feinstein(ov$diff_pct)
t3_body <- c(
  "\\multicolumn{5}{l}{\\textit{(a) Interwar series (1935 benchmark) and Soviet-period series (1990 benchmark)}} \\\\",
  sprintf("%d%s & %s & %s & %s & %s \\\\", ov$year[i37], ifelse(ov$year[i37] == 1940, "$^{\\dagger}$", ""),
          fmt(ov$a[i37]), fmt(ov$b[i37]), fmtsg(ov$diff_pct[i37]), ov$grade[i37]),
  "\\midrule",
  "\\multicolumn{5}{l}{\\textit{(b) Soviet-period series (1990 benchmark) and adjusted MPD series (2011 benchmark)}} \\\\",
  sprintf("%d%s & %s & %s & %s & %s \\\\", ov$year[i90], ifelse(ov$year[i90] == 1991, "$^{\\dagger}$", ""),
          fmt(ov$a[i90]), fmt(ov$b[i90]), fmtsg(ov$diff_pct[i90]), ov$grade[i90])
)
t3 <- tex_table("tab:overlaps",
  "Overlapping estimates of Latvian GDP per capita at the two splicing points",
  "lrrcc",
  c("Year & Earlier-benchmark series & Later-benchmark series & Difference (\\%) & Feinstein grade \\\\",
    "& (\\intlnineteen{}) & (\\intlnineteen{}) & & \\\\"),
  t3_body,
  paste0("\\textit{Notes:} Difference = (later $-$ earlier)/earlier in panel (a) and (earlier $-$ later)/earlier in panel (b), ",
         "so that a positive number always means that the 1990-based series is the higher one. ",
         "Feinstein's grades: firm, under 5 per cent; good, 5 to under 15; rough, 15 to under 25; conjectural, 25 and over \\parencite[21]{feinstein1972}. ",
         "$^{\\dagger}$~Splice year: the final series takes the arithmetic average of the two estimates. ",
         "\\textit{Sources:} see online appendix; adjusted MPD series from \\textcite{mpd2023} with 1990--2010 growth ",
         "replaced by World Bank constant-price growth backcast from the 2011 benchmark \\parencite{wdi2024}.")
)
write_tex(t3, "T3_overlaps.tex")

# =============================================================================
# 5. PREVIOUS ESTIMATES vs NEW SERIES -> Table 4
# =============================================================================

pe <- read_sc("Data/latvia_previous_estimates.csv")
pe$v90 <- ifelse(pe$source == "MPD 2023", pe$value_int90 / INT11_PER_INT90, pe$value_int90)
pe_years <- sort(unique(pe$year))
pe_src <- c("Roses and Wolf 2010", "Norkus and Markeviciute 2021", "MPD 2023")
pe_lab <- c("Ros\\'{e}s and Wolf (2010)", "Norkus and Markevi\\v{c}i\\={u}t\\.{e} (2021)", "MPD 2023")
t4_body <- sapply(pe_years, function(y) {
  vals <- sapply(pe_src, function(s) { v <- pe$v90[pe$source == s & pe$year == y]; if (length(v)) v else NA })
  new <- lv_gdp90[as.character(y)]
  diffs <- (vals / new - 1) * 100
  cell <- function(k) ifelse(is.na(vals[k]), "---", paste0(fmt(vals[k]), " (", fmtsg(diffs[k]), ")"))
  sprintf("%d & %s & %s & %s & %s \\\\", y, fmt(new), cell(1), cell(2), cell(3))
})
t4 <- tex_table("tab:previous",
  "Latvian GDP per capita: the new series and earlier estimates, selected years",
  "lrrrr",
  c("Year & This paper & \\multicolumn{3}{c}{Earlier estimates (difference from this paper, \\%)} \\\\",
    "\\cmidrule(lr){3-5}",
    paste0("& (\\intlnineteen{}) & ", paste(pe_lab, collapse = " & "), " \\\\")),
  t4_body,
  paste0("\\textit{Notes:} MPD figures are published in \\intltwenty{} and converted at 1.594. ",
         "The 1913 figure of this paper is that of Norkus and Markevi\\v{c}i\\={u}t\\.{e}, taken as published. ",
         "\\textit{Sources:} \\textcite[190]{roseswolf2010}; \\textcite[603]{norkusmark2021}; \\textcite{mpd2023}; this paper (online appendix).")
)
write_tex(t4, "T4_previous.tex")
mpd_gap <- setNames(sapply(c(1973, 1980, 1985, 1989, 1990), function(y)
  (pe$v90[pe$source == "MPD 2023" & pe$year == y] / lv_gdp90[as.character(y)] - 1) * 100), c(1973, 1980, 1985, 1989, 1990))

# =============================================================================
# 6. SENSITIVITY TABLE -> Table 5
# =============================================================================

sens <- read_sc("Data/latvia_sensitivity.csv")
t5_body <- sprintf("%s & %s & %s & %s & %s \\\\", sens$source, sens$years, sens$sectors, sens$bias, sens$impact)
t5_body <- append(t5_body, "\\midrule", after = sum(grepl("1919", sens$years)))
t5 <- tex_table("tab:sensitivity",
  "Sensitivity of the Latvian series to the main sources of bias",
  "p{4.6cm}lp{3.8cm}rr",
  c("Source of bias & Years & Sectors affected & Bias & Max.\\ impact \\\\",
    "& & & (\\%) & on GDP (\\%) \\\\"),
  t5_body,
  paste0("\\textit{Notes:} `Bias' is the assumed maximum error in the affected indicator, taken as 10 per cent in either direction unless an independent ",
         "estimate exists; `Max.\\ impact' is that error weighted by the affected sectors' share of GDP in the year in which it is largest. ",
         "A minus sign means that growth in the new series may be understated, so that backcast levels are too high, and vice versa. ",
         "Fixed value-added weights: Swedish single- versus double-deflated accounts \\parencites[19]{swedengdp_15602010}[148--53]{lobellschonkrantz2008}; ",
         "hidden inflation: difference between official and estimated real inflation in Soviet retail trade \\parencite[607]{hidden_inflation_sov}; ",
         "product taxes: in 1980--90 the ratio of product taxes less subsidies to value-added was 0.5 per cent in Bulgaria and Ukraine, the only socialist economies with data \\parencite{wdi2024}; ",
         "service productivity: British service-sector labour productivity rose by 147 per cent between 1948 and 1990 \\parencite{statisticsUKlabour}. ",
         "\\textit{Sources:} \\textcite[149--56]{klimantas2025thesis}; this paper."),
  size = "\\footnotesize")
write_tex(t5, "T5_sensitivity.tex")

# =============================================================================
# 7. SECTORAL GROWTH BY SUB-PERIOD, LATVIA -> Table 6
# =============================================================================

sec_pds <- list(c(1919, 1929), c(1929, 1938), c(1938, 1950), c(1950, 1968), c(1968, 1989), c(1989, 1991))
sec_lab <- sapply(sec_pds, function(p) paste0(p[1], "--", substr(p[2], 3, 4)))
sec_rows <- c("Crops", "Livestock", "Forestry & fishing", "Primary sector total",
              "Food", "Textiles", "Other light industries", "Heavy industries", "Industry total",
              "Construction", "Transport & communications", "Trade, accommodation & food service",
              "Finance & insurance", "Housing", "Public services total", "Total GVA/GDP")
sec_names <- c("Crops", "Livestock", "Forestry and fishing", "\\quad Primary sector",
               "Food", "Textiles", "Other light industries", "Heavy industries", "\\quad Industry",
               "Construction", "Transport and communications", "Trade, accommodation and catering",
               "Finance and insurance", "Housing", "Public services", "\\textbf{GDP}")
sec_key <- c("Crops", "Livestock", "Forestry", "Primary", "Food", "Textiles", "Otherlight", "Heavy", "Industry",
             "Construction", "Transport", "Trade", "Finance", "Housing", "Publicservices", "GDP")
sec_gr <- t(sapply(sec_rows, function(s) sapply(sec_pds, function(p) {
  v0 <- sv[as.character(p[1]), s]; v1 <- sv[as.character(p[2]), s]
  if (is.na(v0) || is.na(v1)) NA_real_ else cagr(v0, v1, p[2] - p[1]) })))
regain <- sapply(sec_rows, function(s) { v <- sv[[s]]; yrs <- as.numeric(rownames(sv))
  y <- yrs[yrs >= 1945 & !is.na(v) & v >= 100]; if (length(y)) min(y) else NA })
peak <- sapply(sec_rows, function(s) { v <- sv[[s]]; yrs <- as.numeric(rownames(sv))
  ok <- yrs <= 1990 & !is.na(v); yrs[ok][which.max(v[ok])] })
t6_body <- sprintf("%s & %s & %s & %s \\\\", sec_names,
                   apply(sec_gr, 1, function(r) paste(fmtg(r), collapse = " & ")),
                   ifelse(is.na(regain), "---", regain), peak)
t6_body <- append(t6_body, "\\midrule", after = 4)
t6_body <- append(t6_body, "\\midrule", after = 10)
t6_body <- append(t6_body, "\\midrule", after = 17)
t6 <- tex_table("tab:sectoral",
  "Average annual growth of sectoral value-added volume indices, Latvia (per cent)",
  "lrrrrrrcc",
  c(paste0("Sector & ", paste(sec_lab, collapse = " & "), " & 1938 level & Peak \\\\"),
    "& & & & & & & regained in & year \\\\"),
  t6_body,
  paste0("\\textit{Notes:} compound annual growth between end-point years of constant-price value-added indices (1938 = 100). ",
         "Industrial branch indices are available from 1938 only. `1938 level regained': first post-war year (1945 or later) ",
         "in which the index is at or above its 1938 value; `Peak year': year of the highest index value up to 1990. ",
         "Public services comprise administration, defence, health and education. Growth in 1938--50 is affected by the wartime ",
         "trough of 1944, for which Latvian sectoral movements are partly extrapolated from Lithuanian ratios (Section~\\ref{sec:method}). ",
         "The 1989--91 column ends in 1991, the splicing year beyond which the final series follows adjusted Maddison Project data. ",
         "\\textit{Sources:} see online appendix."),
  size = "\\scriptsize", colsep = "3pt")
write_tex(t6, "T6_sectoral.tex")

# =============================================================================
# 8. GROWTH BY REGIME AND SUB-PERIOD -> Table 7 ; relative levels -> Table 8
# =============================================================================

sub_pds <- list(c(1913, 1938), c(1913, 1929), c(1929, 1938),
                c(1938, 1989), c(1938, 1950), c(1950, 1968), c(1968, 1989),
                c(1989, last_cmp), c(1989, 1995), c(1995, 2007), c(2007, last_cmp),
                c(1913, last_cmp))
pd_lab <- sapply(sub_pds, function(p)
  paste0(p[1], "--", if (p[1] %/% 100 == p[2] %/% 100) substr(p[2], 3, 4) else p[2]))
gr_of <- function(v) sapply(sub_pds, function(p) cagr(v[as.character(p[1])], v[as.character(p[2])], p[2] - p[1]))
gr_cols <- c("Latvia", "Lithuania", "Estonia", "Baltics", "Finland", "Nordics", "Western", "Periphery", "ECE", "USSR")
gr_tab <- as.data.frame(sapply(gr_cols, function(k) gr_of(cmp[[k]])), row.names = pd_lab)
# USSR after 1991 is the former-Soviet-Union aggregate
t7_body <- sprintf("%s & %s \\\\", paste0("\\textit{", pd_lab, "}"),
                   apply(gr_tab, 1, function(r) paste(fmtg(r), collapse = " & ")))
t7_body <- c("\\multicolumn{11}{l}{\\textit{Interwar capitalism}} \\\\", t7_body[1:3], "\\midrule",
             "\\multicolumn{11}{l}{\\textit{Soviet socialism (Latvia, Lithuania and Estonia)}} \\\\", t7_body[4:7], "\\midrule",
             "\\multicolumn{11}{l}{\\textit{Restored independence}} \\\\", t7_body[8:11], "\\midrule",
             t7_body[12])
t7 <- tex_table("tab:growth",
  "Average annual growth of GDP per capita by regime and sub-period, 1913--2023 (per cent)",
  "lrrrrrrrrrr",
  c("Period & Latvia & Lithuania & Estonia & Baltics & Finland & Nordics & Western & Western & ECE & USSR \\\\",
    "& & & & & & & core & periphery & & \\\\"),
  t7_body,
  paste0("\\textit{Notes:} compound annual rates between end-point years, \\intlnineteen{}. Regional rates are growth rates of ",
         "population-weighted average GDP per capita. Baltics: Latvia, Lithuania and Estonia; Nordics: Denmark, Finland, Iceland, Norway ",
         "and Sweden; Western core: Austria, Belgium, Denmark, France, Germany (West Germany 1950--97), the Netherlands, Norway, Sweden, ",
         "Switzerland and the UK; Western periphery: Finland, Greece, Iceland, Ireland, Italy, Portugal and Spain; ECE (East-Central Europe): ",
         "Bulgaria, Czechoslovakia, Hungary, Poland, Romania and Yugoslavia; USSR: Soviet Union within 1990 borders, former Soviet Union after 1991. ",
         "\\textit{Sources:} Baltic states: this paper, \\textcite{klimantas2026soviet} and \\textcite{klimantas2025estonia}; ",
         "other series: \\textcite{mpd2023}, extended to 2023 with \\textcite{wdi2024} as documented in the online appendix."),
  size = "\\scriptsize", colsep = "2.5pt")
write_tex(t7, "T7_growth.tex")

rel_years <- c(1913, 1929, 1938, 1950, 1968, 1973, 1989, 1995, 2008, 2019, last_cmp)
pct_of <- function(num, den) num[as.character(rel_years)] / den[as.character(rel_years)] * 100
rel <- data.frame(year = rel_years,
  lv_wc = pct_of(lv_gdp90, cmp$Western), lt_wc = pct_of(lt_gdp90, cmp$Western), ee_wc = pct_of(ee_gdp90, cmp$Western),
  bal_wc = pct_of(bal_gdp90, cmp$Western), per_wc = pct_of(cmp$Periphery, cmp$Western), ece_wc = pct_of(cmp$ECE, cmp$Western),
  lv_no = pct_of(lv_gdp90, cmp$Nordics), lt_no = pct_of(lt_gdp90, cmp$Nordics), ee_no = pct_of(ee_gdp90, cmp$Nordics),
  lv_ussr = pct_of(lv_gdp90, cmp$USSRb))
rel$lv_ussr[rel$year < 1938 | rel$year > 1989] <- NA
t8_body <- sprintf("%d & %s & %s & %s & %s & %s & %s & %s & %s & %s & %s \\\\", rel$year,
                   fmtp(rel$lv_wc), fmtp(rel$lt_wc), fmtp(rel$ee_wc), fmtp(rel$bal_wc), fmtp(rel$per_wc), fmtp(rel$ece_wc),
                   fmtp(rel$lv_no), fmtp(rel$lt_no), fmtp(rel$ee_no), fmtp(rel$lv_ussr))
t8_body <- append(t8_body, "\\midrule", after = 3)
t8_body <- append(t8_body, "\\midrule", after = 8)
t8 <- tex_table("tab:relative",
  "GDP per capita relative to the Western core, the Nordic countries and the USSR, selected years (per cent)",
  "lrrrrrrrrrr",
  c("& \\multicolumn{6}{c}{Percentage of Western core} & \\multicolumn{3}{c}{Percentage of Nordics} & USSR \\\\",
    "\\cmidrule(lr){2-7}\\cmidrule(lr){8-10}\\cmidrule(lr){11-11}",
    "Year & Latvia & Lithuania & Estonia & Baltics & W.\\ periphery & ECE & Latvia & Lithuania & Estonia & Latvia \\\\"),
  t8_body,
  paste0("\\textit{Notes:} \\intlnineteen{}; regional aggregates are population-weighted. The last column gives Latvian GDP per capita ",
         "as a percentage of the Soviet average within 1990 borders; from 1946 the Soviet level is Maddison's series rescaled to Bolotin's 1990 ",
         "benchmark, to which the Latvian series is anchored (1938 uses Maddison's level and is the less certain). Country groups as in Table~\\ref{tab:growth}. ",
         "\\textit{Sources:} as Table~\\ref{tab:growth}."),
  size = "\\scriptsize", colsep = "2.5pt")
write_tex(t8, "T8_relative.tex")

# =============================================================================
# 9. STRUCTURE AND OPENNESS -> Table 9 (Datasheets + Data/baltic_structure_shares.csv)
# =============================================================================

st <- read_sc("Data/baltic_structure_shares.csv")
tr <- read_sc(file.path(ds, "Trade openness and exports to GDP world 1919-1940.csv"))
tr$trade_openness <- suppressWarnings(as.numeric(tr$trade_openness))
open_avg <- function(cn, y0, y1) { v <- tr$trade_openness[tr$country_name == cn & tr$year >= y0 & tr$year <= y1]
  if (length(v) == 0 || all(is.na(v))) NA else mean(v, na.rm = TRUE) * 100 }
emp <- read_sc(file.path(ds, "Sectoral GDP and population shares industrial output 1920s-1930s.csv"))
emp_name <- emp[[1]]
emp_col <- function(cn, col) { v <- suppressWarnings(as.numeric(emp[[col]][emp_name == cn])); if (length(v)) v[1] * 100 else NA }
st_map <- c(Lithuania = "Lithuania", Latvia = "Latvia", Estonia = "Estonia", Baltics = "Baltic states",
            Finland = "Finland", Iceland = "Iceland", Ireland = "Ireland", USSR = "USSR",
            Czechoslovakia = "Czechoslovakia", Hungary = "Hungary", Bulgaria = "Bulgaria", Portugal = "Portugal",
            Greece = "Greece", `Western core` = "Western core", `Western periphery` = "Western periphery",
            `East-Central Europe` = "East-Central Europe")
tr_map <- c(Lithuania = "Lithuania", Latvia = "Latvia", Estonia = "Estonia", Finland = "Finland", Iceland = "Iceland",
            Ireland = "Ireland", Portugal = "Portugal", Greece = "Greece", Italy = "Italy", Spain = "Spain", Austria = "Austria")
t9_body <- sapply(seq_len(nrow(st)), function(i) {
  cn <- st$country[i]
  agr38 <- emp_col(st_map[[cn]], "Agriculture employment share circa 1938")
  ind_gr <- emp_col(st_map[[cn]], "Industrial output annual growth rate, 1929-1938")
  o1 <- if (cn %in% names(tr_map)) open_avg(tr_map[[cn]], 1925, 1929) else NA
  o2 <- if (cn %in% names(tr_map)) open_avg(tr_map[[cn]], 1935, 1938) else NA
  sprintf("%s & %s & %s & %s & %s & %s & %s & %s & %s & %s & %s \\\\", cn,
          fmtp(st$agr_1937[i]), fmtp(st$ind_1937[i]), fmtp(st$serv_1937[i]),
          fmtp(st$agr_1990[i]), fmtp(st$ind_1990[i]), fmtp(st$serv_1990[i]),
          fmtp(agr38), fmtg(ind_gr), fmtp(o1), fmtp(o2))
})
t9_body <- append(t9_body, "\\midrule", after = 4)
t9_body <- append(t9_body, "\\midrule", after = 14)
t9 <- tex_table("tab:structure",
  "Economic structure, industrial growth and openness: the Baltic states and their peers, c.\\,1937 and c.\\,1990",
  "lrrrrrrrrrr",
  c("& \\multicolumn{3}{c}{Share of GDP, c.\\,1937} & \\multicolumn{3}{c}{Share of GDP, c.\\,1990} & Agr.\\ empl. & Ind.\\ growth & \\multicolumn{2}{c}{Trade openness} \\\\",
    "\\cmidrule(lr){2-4}\\cmidrule(lr){5-7}\\cmidrule(lr){8-8}\\cmidrule(lr){9-9}\\cmidrule(lr){10-11}",
    "& Agr. & Ind. & Serv. & Agr. & Ind. & Serv. & c.\\,1938 & 1929--38 & 1925/9 & 1935/8 \\\\"),
  t9_body,
  paste0("\\textit{Notes:} shares of gross value-added at current prices; `Ind.' includes construction. c.\\,1937 is the average of 1935--9 and c.\\,1990 ",
         "of 1985--93 where annual data exist, otherwise the nearest year (1990 for the Baltic states and ECE). Regional shares are simple averages. ",
         "Agricultural employment share and industrial output growth (compound annual rate) from the comparator datasheets of the online appendix, ",
         "which give the source of each cell; trade openness is exports plus imports as a percentage of GDP, averaged over the years shown; `---' not available. ",
         "\\textit{Sources:} GDP shares: this paper (benchmarks of Table~\\ref{tab:benchmarks}), \\textcite{klimantas2019}, \\textcite{klimantas2025estonia}, ",
         "\\textcite[179]{morysinterwarinmorys2021}, \\textcite{mitchelstat}, \\textcite[158]{portugal_economy}, \\textcite[24]{jonsson1999}, ",
         "\\textcite[460]{ivanov2012gdp}, \\textcite[184]{bolotin1992}, \\textcite[182]{un_yearbook1993}, \\textcite[346]{cameh_sectoral1945}; ",
         "employment and industrial growth: \\textcite[181]{morysinterwarinmorys2021}, \\textcite{mitchelstat}, \\textcite[2]{ostlandinzahlen}, ",
         "\\textcite[86]{east_industry_periphery1871}; trade: \\textcite{lidaexportslv,lidaimportslv}, \\textcite{worldtrade1949}, \\textcite[123, 161]{balticstates1938}, ",
         "\\textcite[21]{jonsson1999}."),
  size = "\\scriptsize", colsep = "2pt")
# eleven columns exceed the text width even at \scriptsize: scale the tabular to \textwidth
t9 <- sub("^\\\\begin\\{tabular\\}", "\\\\resizebox{\\\\textwidth}{!}{\\\\begin{tabular}", t9)
t9 <- sub("^\\\\end\\{tabular\\}", "\\\\end{tabular}}", t9)
write_tex(t9, "T9_structure.tex")

# =============================================================================
# 10. WAR IMPACT -> Table 10 (recompute Baltic rows; comparators from the thesis/MPD)
# =============================================================================

war <- read_sc("Data/baltic_war_impact.csv")
# each column is measured to its own trough (population, total GDP, GDP per capita) within the war window
trough_year <- function(v, y0, y1) { yy <- y0:y1; yy <- yy[yy %in% as.numeric(names(v))]; yy[which.min(v[as.character(yy)])] }
war_cols <- function(g, p, y0, w0, w1) {
  tot <- g * p
  c(pop = unname((p[as.character(trough_year(p, w0, w1))] / p[as.character(y0)] - 1) * 100),
    gdp = unname((tot[as.character(trough_year(tot, w0, w1))] / tot[as.character(y0)] - 1) * 100),
    pc  = unname((g[as.character(trough_year(g, w0, w1))] / g[as.character(y0)] - 1) * 100))
}
for (cc in c("Latvia", "Estonia", "Lithuania")) {
  g <- cmp[[cc]]; p <- list(Latvia = lv_pop, Estonia = ee_pop, Lithuania = lt_pop)[[cc]]
  w1 <- war_cols(g, p, 1913, 1919, 1919)          # 1914-18 not estimated: 1919 is the trough
  w2 <- war_cols(g, p, 1938, 1944, 1946)          # the 1944-6 trough named in the panel heading
  k1 <- war$war == "WWI" & war$country == cc; k2 <- war$war == "WWII" & war$country == cc
  stopifnot(abs(war$gdppc_pct[k1] - w1["pc"]) < 2.5)
  war$population_pct[k1] <- round(w1["pop"]); war$gdp_pct[k1] <- round(w1["gdp"]); war$gdppc_pct[k1] <- round(w1["pc"])
  if (cc != "Lithuania") {   # Lithuania's WWII figures within actual borders come from the companion paper
    stopifnot(abs(war$gdppc_pct[k2] - w2["pc"]) < 2.5)
    war$population_pct[k2] <- round(w2["pop"]); war$gdp_pct[k2] <- round(w2["gdp"]); war$gdppc_pct[k2] <- round(w2["pc"])
  }
}
war_lv1 <- war[war$war == "WWI" & war$country == "Latvia", ]; war_lv2 <- war[war$war == "WWII" & war$country == "Latvia", ]
t10_body <- c("\\multicolumn{4}{l}{\\textit{(a) First World War: decline from 1913 to the 1918/19 trough}} \\\\",
  sprintf("%s & %s & %s & %s \\\\", war$country[war$war == "WWI"], fmtpm(war$population_pct[war$war == "WWI"]),
          fmtpm(war$gdp_pct[war$war == "WWI"]), fmtpm(war$gdppc_pct[war$war == "WWI"])),
  "\\midrule",
  "\\multicolumn{4}{l}{\\textit{(b) Second World War: decline from 1938 to the 1944--6 trough}} \\\\",
  sprintf("%s & %s & %s & %s \\\\", war$country[war$war == "WWII"], fmtpm(war$population_pct[war$war == "WWII"]),
          fmtpm(war$gdp_pct[war$war == "WWII"]), fmtpm(war$gdppc_pct[war$war == "WWII"])))
t10 <- tex_table("tab:war",
  "Demographic and economic impact of the two world wars (percentage change)",
  "lrrr",
  "& Population & GDP & GDP per capita \\\\",
  t10_body,
  paste0("\\textit{Notes:} each column is measured from the pre-war year to its own trough within the window named. ",
         "Lithuania in panel (b) within actual borders (the 1939 loss of Klaip\\.{e}da and gain of Vilnius); within post-war ",
         "borders its population fell by 22 per cent. ",
         "\\textit{Sources:} Baltic states: this paper and the companion series; others: \\textcite{mpd2023}."))
write_tex(t10, "T10_war.tex")

# =============================================================================
# 11. COLLECTIVISATION -> Table 11 ; TRANSITION -> Table 12
# =============================================================================

col <- read_sc("Data/baltic_collectivisation.csv")
col_pct <- function(x) gsub("<", "${<}$", gsub(">", "${>}$", x))
t11_body <- sprintf("%d & %s & %s & %s & %s & %s & %s \\\\", col$year,
                    col_pct(col$LV_farms_pct), col$LV_output, col_pct(col$LT_farms_pct), col$LT_output,
                    col_pct(col$EE_farms_pct), col$EE_output)
dep <- read_sc("Data/baltic_deportations.csv")
dep_row <- function(cc, col) { v <- pick1(dep[[col]][dep$country == cc], paste(cc, col)); v }
t11_body <- c(t11_body, "\\midrule",
  sprintf("Deported, 1940--53 & \\multicolumn{2}{c}{%s (%d\\%%)} & \\multicolumn{2}{c}{%s (%d\\%%)} & \\multicolumn{2}{c}{%s (%d\\%%)} \\\\",
          fmt(dep_row("Latvia", "deported_1940_53")), dep_row("Latvia", "share_pct"),
          fmt(dep_row("Lithuania", "deported_1940_53")), dep_row("Lithuania", "share_pct"),
          fmt(dep_row("Estonia", "deported_1940_53")), dep_row("Estonia", "share_pct")),
  sprintf("\\quad of which 1948--53 & \\multicolumn{2}{c}{%s} & \\multicolumn{2}{c}{%s} & \\multicolumn{2}{c}{%s} \\\\",
          fmt(dep_row("Latvia", "deported_1948_53")), fmt(dep_row("Lithuania", "deported_1948_53")), fmt(dep_row("Estonia", "deported_1948_53"))))
t11 <- tex_table("tab:collectivisation",
  "Collectivisation of Baltic agriculture, 1947--55",
  "lrrrrrr",
  c("& \\multicolumn{2}{c}{Latvia} & \\multicolumn{2}{c}{Lithuania} & \\multicolumn{2}{c}{Estonia} \\\\",
    "\\cmidrule(lr){2-3}\\cmidrule(lr){4-5}\\cmidrule(lr){6-7}",
    "& Farms & Output & Farms & Output & Farms & Output \\\\",
    "& coll.\\ (\\%) & 1938 = 100 & coll.\\ (\\%) & 1938 = 100 & coll.\\ (\\%) & 1938 = 100 \\\\"),
  t11_body,
  paste0("\\textit{Notes:} `Farms coll.': share of farms collectivised at the beginning of the year (mid-year for Estonia in 1952--3); output is the volume index of ",
         "agricultural value-added (crops and livestock). Deportations in brackets as a share of the population. ",
         "\\textit{Sources:} output: this paper and companion series; collectivisation and deportations: \\textcite[69]{lv_collectiv}; ",
         "\\textcite[241--2]{lv_sovhist02}; \\textcite{lv_deportations}; \\textcite[471]{Girnius1988}; \\textcite{vlekolektyv}; ",
         "\\textcite[265]{taagepera_coll01}; \\textcite[12]{deportations_ee}."),
  size = "\\footnotesize")
write_tex(t11, "T11_collectivisation.tex")

trn <- read_sc("Data/baltic_transition_estimates.csv")
tcell <- function(a, t) ifelse(is.na(a) | a == "", "---", paste0(fmtpm(as.numeric(a)), " (", t, ")"))
t12_body <- sprintf("%s & %s & %s & %s & %s \\\\", trn$country,
                    tcell(trn$MPD_amp, trn$MPD_trough), tcell(trn$this_amp, trn$this_trough),
                    tcell(trn$aslund_amp, trn$aslund_trough), tcell(trn$hdv_amp, trn$hdv_trough))
t12_body <- append(t12_body, "\\midrule", after = 3)
t12 <- tex_table("tab:transition",
  "Decline in GDP per capita from 1989 to the 1990s trough: alternative estimates (per cent, trough year in brackets)",
  "lrrrr",
  "& MPD 2023 & This paper & \\AA{}slund & Hamilton and de Vries \\\\",
  t12_body,
  paste0("\\textit{Notes:} 1989/1991 and 1989/1990 ratios from this paper are applied to \\AA{}slund's and Hamilton and de Vries's series, ",
         "which begin in 1991 and 1990 respectively. `This paper' for Lithuania and Estonia refers to the companion series. ",
         "\\textit{Sources:} this paper; \\textcite{mpd2023}; \\textcite[15]{aslund_myth}; \\textcite{hamilton_transition}."),
  size = "\\footnotesize")
write_tex(t12, "T12_transition.tex")

# =============================================================================
# 12. SOURCES AND METHOD BY SECTOR -> Table 2 (text table)
# =============================================================================

t2_rows <- list(
  c("Crops", "Physical output of 9--10 crop categories, 1937--95; 1990 value-added weights from the World Bank's 1993 study, grains split with the 1995 Eurostat agricultural accounts; sown areas for 1945--55 from unpublished returns", "A.1"),
  c("Livestock", "Physical output of 7--16 animal products; 1941--9 yields obtained from animal numbers and the yields per animal of 1940, 1945 and 1950", "A.1"),
  c("Forestry and fishing", "Timber cut (cubic metres) and fish catch (tonnes); 1941, 1971 and 1974--6 catches interpolated", "A.1"),
  c("Industry", "129 physical product series in 11 branches (Table~\\ref{tab:products}); product weights from the 1987 input--output study and the 1993 World Bank study, products consolidated into 22 minor branches by index averages because no archival late-1980s output valuation survives for Latvia; branch weights from the 1990 benchmark", "A.2"),
  c("Construction", "Weighted index of material inputs into construction, 1987 input--output weights, following the CIA procedure", "A.3"),
  c("Transport and communications", "Freight tonne-kilometres and passenger-kilometres, all modes; postal, telegraph and telephone traffic and radio and television sets; 1945--50 from the Russian State Archive of the Economy; 1941--4 assumed to move with the rest of the economy; 1990s from sectoral employment", "A.4"),
  c("Trade, accommodation and catering", "Soviet retail and wholesale turnover indices at comparable prices (the only value series used), chained across base-year changes; early post-war years from the USSR domestic-trade compendia", "A.5"),
  c("Finance, insurance and housing", "Finance and insurance: employment by branch, adjusted for productivity with the ratio of trade turnover to trade employment, as the CIA did; housing: housing stock derived from construction and population", "A.5"),
  c("Public administration, health, education, science", "Employment by branch from Soviet yearbooks, the Ostland statistical bulletins and World Bank studies; 1941--4, 1946--9 and 1951--4 gaps interpolated", "A.6"),
  c("Defence", "Soviet garrison of 30,000 in 1940 and 80,000 in 1990 plus the republican forces and police of 1940; 1941--89 interpolated between the 1940 and 1990 totals in step with public-administration employment; 1991--5 from the withdrawal schedule and the new Latvian forces", "A.6"),
  c("Other services", "Employment", "A.6"),
  c("Population", "Year-end estimates and censuses of 1935, 1959, 1970, 1979 and 1989; wartime and deportation losses from the demographic literature; Soviet garrison added in 1940--1; present-day borders from 1945", "A.7")
)
t2_body <- sapply(t2_rows, function(r) sprintf("%s & %s & %s \\\\", r[1], r[2], r[3]))
t2 <- c("% tab:sources",
  "\\begin{table}[htbp]\\centering\\scriptsize\\setlength{\\tabcolsep}{3pt}",
  "\\caption{Indicators and sources of the Latvian Soviet-period series, 1937--95}",
  "\\label{tab:sources}",
  "\\begin{threeparttable}",
  "\\begin{tabular}{p{2.9cm}p{11.3cm}c}",
  "\\toprule",
  "Sector & Indicator and main sources & Appendix \\\\",
  "\\midrule",
  t2_body,
  "\\bottomrule",
  "\\end{tabular}",
  "\\begin{tablenotes}[para,flushleft]",
  "\\footnotesize",
  paste0("\\textit{Notes:} the appendix column refers to the sections of the online appendix in which every series is documented year by year with its sources: ",
         "the Soviet Latvian statistical yearbooks (\\textit{Latvijas PSR tautas saimniec\\={\\i}ba}, 1957--90), the \\textit{Statistische Berichte f\\\"{u}r das Ostland} (1942--4) and ",
         "\\textit{Ostland in Zahlen} (1942), the USSR domestic-trade compendia (\\textit{Sovetskaya torgovlya}, 1964 and 1989), the World Bank's \\textit{Latvia: the transition to a market economy} (1993) and ",
         "\\textit{Statistical handbook: states of the former USSR} (1994--6), the Russian State Archive of the Economy (RGAE) and the Latvian State Archives. ",
         "\\textit{Sources:} see online appendix."),
  "\\end{tablenotes}",
  "\\end{threeparttable}",
  "\\end{table}")
write_tex(t2, "T2_sources.tex")

prod <- data.frame(branch = c("Electricity", "Petroleum", "Other fuels", "Metals", "Chemicals",
                              "Machine-building and metal-working", "Wood and paper", "Construction materials",
                              "Light industry", "Food industry", "Other"),
                   LV = c(1, 0, 3, 4, 8, 30, 9, 22, 18, 25, 9), LT = c(1, 1, 1, 7, 10, 36, 14, 15, 18, 36, 4),
                   EE = c(1, 3, 2, 4, 11, 21, 10, 8, 9, 25, 7))
stopifnot(sum(prod$LV) == 129, sum(prod$LT) == 143, sum(prod$EE) == 101)
tp_body <- c(sprintf("%s & %d & %d & %d \\\\", prod$branch, prod$LV, prod$LT, prod$EE), "\\midrule",
             sprintf("Total & %d & %d & %d \\\\", sum(prod$LV), sum(prod$LT), sum(prod$EE)))
tp <- tex_table("tab:products", "Industrial product series compiled for the Soviet-period indices, 1937--95",
  "lrrr", "Branch & Latvia & Lithuania & Estonia \\\\", tp_body,
  "\\textit{Sources:} this paper; \\textcite{klimantas2026soviet}; \\textcite{klimantas2025estonia}.", size = "\\footnotesize")
write_tex(tp, "T2b_products.tex")

# =============================================================================
# 13. APPENDIX TABLES: annual series (A1) and sectoral indices (A2)
# =============================================================================

ser <- data.frame(year = years_all, gdp90 = lv_gdp90, gdp11 = lv_gdp11, pop = lv_pop,
                  lt = lt_gdp90, ee = ee_gdp90)
nblk <- 3; n <- nrow(ser); per <- ceiling(n / nblk)
blk <- lapply(seq_len(nblk), function(b) ser[((b - 1) * per + 1):min(b * per, n), ])
a1_lines <- sapply(seq_len(per), function(i) {
  cells <- sapply(blk, function(B) if (i <= nrow(B)) sprintf("%d & %s & %s & %s", B$year[i], fmt(B$gdp90[i]), fmt(B$gdp11[i]), fmt1(B$pop[i])) else " & & & ")
  paste0(paste(cells, collapse = " & "), " \\\\")
})
a1 <- c("% tab:series",
  "\\setlength{\\tabcolsep}{3pt}",
  "\\begin{longtable}{rrrr@{\\hspace{1em}}rrrr@{\\hspace{1em}}rrrr}",
  "\\caption{Latvian GDP per capita in 1990 and 2011 international dollars and mid-year population, 1913 and 1919--2024}\\label{tab:series}\\\\",
  "\\toprule",
  paste(rep("Year & \\intlnineteen{} & \\intltwenty{} & Pop.\\ (000)", 3), collapse = " & "), " \\\\",
  "\\midrule", "\\endfirsthead",
  "\\multicolumn{12}{l}{\\textit{Table~\\ref{tab:series} (continued)}} \\\\ \\toprule",
  paste(rep("Year & \\intlnineteen{} & \\intltwenty{} & Pop.\\ (000)", 3), collapse = " & "), " \\\\",
  "\\midrule", "\\endhead",
  "\\midrule \\multicolumn{12}{r}{\\textit{continued on next page}} \\\\", "\\endfoot",
  "\\bottomrule",
  "\\endlastfoot",
  a1_lines,
  "\\end{longtable}",
  # notes are set after the table: a \multicolumn{p{..}} note cell would stretch the last column
  "\\vspace{-1.2em}\\noindent\\begin{minipage}{\\textwidth}\\footnotesize \\textit{Notes:} 1913 from \\textcite{norkusmark2021} as published; 1919--39 from the interwar series of \\textcite{Klimantas2024} extended to 1919 (Section~\\ref{sec:method}); 1940 and 1991 are averages of the two overlapping series; 1941--90 from the Soviet-period series of this paper; 1992--2024 from \\textcite{mpd2023} with 1992--2010 growth from \\textcite{wdi2024}, extended to 2024 with World Bank and Eurostat data. \\intltwenty{} = \\intlnineteen{} $\\times$ 1.594. Population within the borders of the republic to 1944 and present-day borders thereafter; mid-year averages of year-end figures. \\textit{Sources:} see online appendix.\\end{minipage}\\vspace{1em}")
write_tex(a1, "A1_series.tex")

a2_cols_a <- c("Crops", "Livestock", "Forestry & fishing", "Primary sector total", "Food", "Textiles",
               "Other light industries", "Heavy industries", "Industry total", "Construction")
a2_hdr_a  <- c("Crops", "Live-stock", "Forestry, fishing", "Primary", "Food", "Textiles", "Other light", "Heavy", "Industry", "Constr.")
a2_cols_b <- c("Transport & communications", "Trade, accommodation & food service", "Finance & insurance", "Housing",
               "Public administration & soc. security", "Defence", "Health", "Education & culture", "Other services", "Total GVA/GDP")
a2_hdr_b  <- c("Transp., comm.", "Trade", "Finance", "Housing", "Public adm.", "Defence", "Health", "Educ., culture", "Other", "GDP")
a2_years <- 1919:1995
mk_a2 <- function(cols, hdr, label, title, note) {
  body <- sapply(a2_years, function(y) paste0(y, " & ", paste(fmt1(unlist(sv[as.character(y), cols])), collapse = " & "), " \\\\"))
  c(paste0("% ", label),
    "\\setlength{\\tabcolsep}{3pt}",
    "\\begin{longtable}{r*{10}{r}}",
    paste0("\\caption{", title, "}\\label{", label, "}\\\\"),
    "\\toprule", paste0("Year & ", paste(hdr, collapse = " & "), " \\\\"), "\\midrule", "\\endfirsthead",
    paste0("\\multicolumn{11}{l}{\\textit{Table~\\ref{", label, "} (continued)}} \\\\ \\toprule"),
    paste0("Year & ", paste(hdr, collapse = " & "), " \\\\"), "\\midrule", "\\endhead",
    "\\midrule \\multicolumn{11}{r}{\\textit{continued on next page}} \\\\", "\\endfoot",
    "\\bottomrule", "\\endlastfoot",
    body, "\\end{longtable}",
    paste0("\\vspace{-1.2em}\\noindent\\begin{minipage}{\\textwidth}\\footnotesize ", note, "\\end{minipage}\\vspace{1em}"))
}
write_tex(mk_a2(a2_cols_a, a2_hdr_a, "tab:appsec1",
  "Volume indices of sectoral value-added in Latvia, 1919--95: primary and secondary sectors (1938 = 100)",
  "\\textit{Notes:} industrial branch indices from 1938 only. 1941--4 movements partly interpolated; 1944 from Lithuanian 1943--5 ratios (Section~\\ref{sec:method}). Indices for 1992--5 are those of the Soviet-period series and are superseded in the final series by the modern series from 1992 (1991 being the average of the two). \\textit{Sources:} see online appendix."),
  "A2_sectoral_a.tex")
write_tex(mk_a2(a2_cols_b, a2_hdr_b, "tab:appsec2",
  "Volume indices of sectoral value-added in Latvia, 1919--95: services and GDP (1938 = 100)",
  "\\textit{Notes:} as Table~\\ref{tab:appsec1}. Defence in 1940 includes the Soviet garrison admitted in 1939--40. \\textit{Sources:} see online appendix."),
  "A2_sectoral_b.tex")

# =============================================================================
# 14. FIGURES (base R, PDF)
# =============================================================================

yrs_plot <- 1913:last_cmp
with_gap <- function(v) v[as.character(yrs_plot)]   # 1914-18 are absent from years_all and so plot as a gap
pdf_open <- function(f, w = 6.5, h = 4.2) pdf(file.path(fig_dir, f), width = w, height = h, family = "Times")

# F1: levels, log scale
pdf_open("F1_levels.pdf")
par(mar = c(3.2, 4.2, 0.8, 0.8), mgp = c(2.4, 0.7, 0), cex = 0.85)
series <- list(Latvia = cmp$Latvia, Lithuania = cmp$Lithuania, Estonia = cmp$Estonia, Finland = cmp$Finland,
               `Western core` = cmp$Western, `USSR` = cmp$USSRb)
ylim <- range(unlist(lapply(series, with_gap)), na.rm = TRUE)
plot(NA, xlim = range(yrs_plot), ylim = ylim, log = "y", xlab = "", ylab = "GDP per capita, Int$1990 (log scale)",
     yaxt = "n", xaxt = "n")
axis(1, at = seq(1920, 2020, 20)); axis(2, at = c(1000, 2000, 5000, 10000, 20000), labels = c("1,000", "2,000", "5,000", "10,000", "20,000"), las = 1)
abline(v = c(1940, 1991), col = "grey75", lty = 3)
lines(yrs_plot, with_gap(series$`Western core`), col = "grey55", lwd = 1.6)
lines(yrs_plot, with_gap(series$Finland), col = "grey55", lwd = 1.6, lty = 2)
lines(yrs_plot, with_gap(series$USSR), col = "grey55", lwd = 1.6, lty = 4)
lines(yrs_plot, with_gap(series$Lithuania), col = "black", lwd = 1.3, lty = 2)
lines(yrs_plot, with_gap(series$Estonia), col = "black", lwd = 1.3, lty = 3)
lines(yrs_plot, with_gap(series$Latvia), col = "black", lwd = 2.4)
legend("topleft", legend = c("Latvia", "Lithuania", "Estonia", "Western core", "Finland", "USSR / former USSR"),
       col = c("black", "black", "black", "grey55", "grey55", "grey55"), lwd = c(2.4, 1.3, 1.3, 1.6, 1.6, 1.6),
       lty = c(1, 2, 3, 1, 2, 4), bty = "n", cex = 0.85)
dev.off()

# F2: percentage of Western core, 5-year centred moving average
ma5 <- function(v) { out <- v; n <- length(v)
  for (i in seq_len(n)) { lo <- max(1, i - 2); hi <- min(n, i + 2); w <- v[lo:hi]; out[i] <- if (sum(!is.na(w)) >= 3) mean(w, na.rm = TRUE) else NA }
  out }
pct_wc <- function(v) ma5(with_gap(v) / with_gap(cmp$Western) * 100)
pdf_open("F2_relative.pdf")
par(mar = c(3.2, 4.2, 0.8, 0.8), mgp = c(2.4, 0.7, 0), cex = 0.85)
plot(NA, xlim = range(yrs_plot), ylim = c(25, 90), xlab = "", ylab = "Per cent of Western core GDP per capita", xaxt = "n", las = 1)
axis(1, at = seq(1920, 2020, 20)); abline(v = c(1940, 1991), col = "grey75", lty = 3)
lines(yrs_plot, pct_wc(cmp$Periphery), col = "grey55", lwd = 1.6)
lines(yrs_plot, pct_wc(cmp$ECE), col = "grey55", lwd = 1.6, lty = 2)
lines(yrs_plot, pct_wc(cmp$Lithuania), col = "black", lwd = 1.3, lty = 2)
lines(yrs_plot, pct_wc(cmp$Estonia), col = "black", lwd = 1.3, lty = 3)
lines(yrs_plot, pct_wc(cmp$Latvia), col = "black", lwd = 2.4)
legend("topleft", legend = c("Latvia", "Lithuania", "Estonia", "Western periphery", "East-Central Europe"),
       col = c("black", "black", "black", "grey55", "grey55"), lwd = c(2.4, 1.3, 1.3, 1.6, 1.6), lty = c(1, 2, 3, 1, 2), bty = "n", cex = 0.85)
dev.off()

# F3: beta-convergence, three regimes
eu_countries <- c("Albania", "Austria", "Belgium", "Bulgaria", "Switzerland", "Czechoslovakia", "Cyprus", "Germany",
                  "Denmark", "Spain", "Estonia", "Finland", "France", "United Kingdom", "Greece", "Hungary", "Ireland",
                  "Iceland", "Italy", "Lithuania", "Luxembourg", "Latvia", "Malta", "Netherlands", "Norway", "Poland",
                  "Portugal", "Romania", "USSR", "Sweden", "Yugoslavia", "Czech Republic", "Slovakia", "Slovenia",
                  "Croatia", "Serbia", "Bosnia and Herzegovina", "Macedonia", "Montenegro", "Belarus", "Ukraine",
                  "Moldova", "Russia", "Georgia", "Armenia", "Azerbaijan")
abbr <- c(Albania = "ALB", Austria = "AUT", Belgium = "BEL", Bulgaria = "BGR", Switzerland = "CHE", Czechoslovakia = "CSK",
          Cyprus = "CYP", Germany = "DEU", Denmark = "DNK", Spain = "ESP", Estonia = "EST", Finland = "FIN", France = "FRA",
          `United Kingdom` = "GBR", Greece = "GRC", Hungary = "HUN", Ireland = "IRL", Iceland = "ISL", Italy = "ITA",
          Lithuania = "LTU", Luxembourg = "LUX", Latvia = "LVA", Malta = "MLT", Netherlands = "NLD", Norway = "NOR",
          Poland = "POL", Portugal = "PRT", Romania = "ROU", USSR = "USSR", Sweden = "SWE", Yugoslavia = "YUG",
          `Czech Republic` = "CZE", Slovakia = "SVK", Slovenia = "SVN", Croatia = "HRV", Serbia = "SRB",
          `Bosnia and Herzegovina` = "BIH", Macedonia = "MKD", Montenegro = "MNE", Belarus = "BLR", Ukraine = "UKR",
          Moldova = "MDA", Russia = "RUS", Georgia = "GEO", Armenia = "ARM", Azerbaijan = "AZE")
socialist <- c("Albania", "Bulgaria", "Czechoslovakia", "Germany", "Hungary", "Poland", "Romania", "USSR", "Yugoslavia",
               "Lithuania", "Latvia", "Estonia")   # Germany excluded from the 1938-89 regression (divided country)
# One point per economy: before 1989 the historical units (USSR, Yugoslavia, Czechoslovakia) enter and their
# member or successor states do not, except the three Baltic states, which are the subject of the paper and
# are shown separately in every panel; after 1989 the successor states enter and the aggregates do not.
successors <- c("Russia", "Belarus", "Ukraine", "Moldova", "Georgia", "Armenia", "Azerbaijan",
                "Croatia", "Slovenia", "Serbia", "Bosnia and Herzegovina", "Macedonia", "Montenegro",
                "Czech Republic", "Slovakia")
aggregates <- c("USSR", "Yugoslavia", "Czechoslovakia")
beta_sample <- function(y0) if (y0 < 1989) setdiff(eu_countries, successors) else setdiff(eu_countries, aggregates)
beta_data <- function(y0, y1, spain_sub = FALSE) {
  do.call(rbind, lapply(beta_sample(y0), function(cn) {
    v <- if (cn %in% names(cmp)) cmp[[cn]] else g_col(cn)
    ys <- y0; if (spain_sub && cn == "Spain" && y0 <= 1938 && y1 >= 1938) ys <- if (y0 == 1913) 1913 else 1935
    ye <- y1; if (spain_sub && cn == "Spain" && y0 == 1913) ye <- 1935
    a <- v[as.character(ys)]; b <- v[as.character(ye)]
    if (is.na(a) || is.na(b) || (cn == "Germany" && y0 == 1938)) return(NULL)
    data.frame(country = cn, x = log(a), g = cagr(a, b, ye - ys), stringsAsFactors = FALSE)
  }))
}
beta_panel <- function(y0, y1, title, spain_sub) {
  d <- beta_data(y0, y1, spain_sub)
  stopifnot(!any(duplicated(d$country)), nrow(d) >= 15)
  plot(d$x, d$g, pch = ifelse(d$country %in% socialist & y0 >= 1938 & y0 < 1989, 17, 1), cex = 0.9,
       xlab = paste0("Log GDP per capita, ", y0), ylab = "Growth of GDP per capita, % p.a.", main = title, las = 1, font.main = 1, cex.main = 0.95)
  fit <- lm(g ~ x, data = d); abline(fit, lty = 2)
  if (y0 == 1938) { ds <- d[d$country %in% socialist, ]; dc <- d[!d$country %in% socialist, ]
    if (nrow(ds) > 3) abline(lm(g ~ x, data = ds), lty = 3); if (nrow(dc) > 3) abline(lm(g ~ x, data = dc), lty = 4) }
  wc <- cagr(cmp$Western[as.character(y0)], cmp$Western[as.character(y1)], y1 - y0); abline(h = wc, col = "grey60")
  lab <- d[d$country %in% c("Latvia", "Lithuania", "Estonia", "Finland", "Greece", "Ireland", "Portugal", "Spain", "Poland", "USSR", "Czechoslovakia", "Hungary", "Bulgaria", "Yugoslavia", "Romania", "Italy", "Albania", "Russia", "Slovenia"), ]
  text(lab$x, lab$g, labels = abbr[lab$country], pos = 4, cex = 0.62, offset = 0.3)
  points(d$x[d$country == "Latvia"], d$g[d$country == "Latvia"], pch = 16, cex = 1.3)
  res <- d[d$country %in% c("Latvia", "Lithuania", "Estonia"), ]
  res$resid <- res$g - predict(fit, newdata = res)
  cat("Beta residuals", y0, "-", y1, ": "); print(data.frame(country = res$country, growth = round(res$g, 2), resid = round(res$resid, 2)))
  invisible(list(coef = coef(fit), se = summary(fit)$coefficients[2, 2], sigma = summary(fit)$sigma, n = nrow(d),
                 resid = setNames(res$resid, res$country)))
}
pdf_open("F3_beta.pdf", w = 9.5, h = 3.6)
par(mfrow = c(1, 3), mar = c(3.6, 3.8, 2, 0.6), mgp = c(2.3, 0.7, 0), cex = 0.75)
b1 <- beta_panel(1913, 1938, "(a) Interwar capitalism, 1913-38", TRUE)
b2 <- beta_panel(1938, 1989, "(b) Cold War, 1938-89", TRUE)
b3 <- beta_panel(1989, 2019, "(c) Post-communist era, 1989-2019", FALSE)
dev.off()

# F4: Latvian sectoral indices, log scale
pdf_open("F4_sectoral.pdf")
par(mar = c(3.2, 4.2, 0.8, 0.8), mgp = c(2.4, 0.7, 0), cex = 0.85)
yy <- 1919:1995
sv_plot <- list(`GDP` = sv$`Total GVA/GDP`, `Primary sector` = sv$`Primary sector total`, `Industry` = sv$`Industry total`,
                `Construction` = sv$Construction, `Market services` = sv$`Market services total`, `Public services` = sv$`Public services total`)
plot(NA, xlim = range(yy), ylim = c(8, 1000), log = "y", xlab = "", ylab = "Index, 1938 = 100 (log scale)", yaxt = "n", xaxt = "n")
axis(1, at = seq(1920, 1990, 10)); axis(2, at = c(10, 20, 50, 100, 200, 500, 1000), las = 1)
abline(v = c(1940, 1991), col = "grey75", lty = 3); abline(h = 100, col = "grey85")
lines(yy, sv_plot$`Primary sector`[match(yy, as.numeric(rownames(sv)))], col = "grey45", lwd = 1.4, lty = 1)
lines(yy, sv_plot$Industry[match(yy, as.numeric(rownames(sv)))], col = "grey45", lwd = 1.4, lty = 2)
lines(yy, sv_plot$Construction[match(yy, as.numeric(rownames(sv)))], col = "grey45", lwd = 1.4, lty = 3)
lines(yy, sv_plot$`Market services`[match(yy, as.numeric(rownames(sv)))], col = "black", lwd = 1.2, lty = 2)
lines(yy, sv_plot$`Public services`[match(yy, as.numeric(rownames(sv)))], col = "black", lwd = 1.2, lty = 3)
lines(yy, sv_plot$GDP[match(yy, as.numeric(rownames(sv)))], col = "black", lwd = 2.4)
legend("topleft", legend = c("GDP", "Market services", "Public services", "Primary sector", "Industry", "Construction"),
       col = c("black", "black", "black", "grey45", "grey45", "grey45"), lwd = c(2.4, 1.2, 1.2, 1.4, 1.4, 1.4), lty = c(1, 2, 3, 1, 2, 3), bty = "n", cex = 0.85)
dev.off()

# =============================================================================
# 15. NUMBER MACROS FOR THE PROSE -> numbers.tex
# =============================================================================

mac <- character(0)
#' Define one number macro; refuses NA or empty values so that nothing reaches the prose silently
def <- function(name, value, allow_missing = FALSE) {
  if (length(value) != 1 || is.na(value)) stop("macro ", name, " has no value")
  if (!allow_missing && identical(value, "---")) stop("macro ", name, " is missing (---)")
  mac <<- c(mac, sprintf("\\expandafter\\newcommand\\csname %s\\endcsname{%s}", name, value))
}
cname <- function(x) gsub("[^A-Za-z0-9]", "", x)
# dispatchers (argument-taking macros): an undefined name raises a LaTeX error instead of printing nothing
disp <- function(cmd, nargs, prefix) {
  args <- paste0("Y#", seq_len(nargs), collapse = "")
  sprintf("\\newcommand{\\%s}[%d]{\\ifcsname %s%s\\endcsname\\csname %s%s\\endcsname\\else\\errmessage{numbers.tex: undefined %s%s}\\fi}",
          cmd, nargs, prefix, args, prefix, args, prefix, args)
}
mac <- c(mac,
  disp("lv", 1, "lv"),        # Latvia GDP pc Int$1990
  disp("lvb", 1, "lvb"),      # Latvia GDP pc Int$2011
  disp("lvpop", 1, "lvpop"),  # Latvia population (000)
  disp("gr", 2, "gr"),        # Latvia growth
  disp("gra", 2, "gra"),      # Latvia growth, absolute value (for 'fell by')
  disp("tgr", 2, "tgr"),      # Latvia total GDP growth
  disp("grx", 3, "grx"),      # comparator growth
  disp("pctwc", 1, "pctwc"), disp("pctnord", 1, "pctnord"), disp("pctfin", 1, "pctfin"),
  disp("pctussr", 1, "pctussr"), disp("pctper", 1, "pctper"),
  disp("pctx", 3, "pctx"),    # country as % of comparator
  disp("sgr", 3, "sgr"), disp("sgra", 3, "sgra"), disp("speak", 1, "speak"), disp("sregain", 1, "sregain"),
  disp("sidx", 2, "sidx"), disp("ovd", 1, "ovd"), disp("mpdgap", 1, "mpdgap"), disp("lvrank", 1, "lvrank"))
for (y in years_all) { def(paste0("lvY", y), fmt(lv_gdp90[as.character(y)])); def(paste0("lvbY", y), fmt(lv_gdp11[as.character(y)]))
  def(paste0("lvpopY", y), fmt(lv_pop[as.character(y)])) }
key_years <- c(1913, 1919, 1922, 1929, 1933, 1938, 1940, 1944, 1945, 1948, 1950, 1955, 1959, 1961, 1962, 1968, 1969, 1973, 1975, 1979, 1980, 1985, 1986,
               1987, 1989, 1991, 1993, 1995, 2000, 2004, 2007, 2008, 2009, 2010, 2011, 2019, 2023, 2024)
grx_keys <- c("Latvia", "Lithuania", "Estonia", "Baltics", "Finland", "Nordics", "Western", "Periphery", "ECE", "USSR", "Greece", "Ireland", "Portugal", "Spain", "Poland", "Italy")
for (y0 in key_years) for (y1 in key_years) if (y1 > y0) {
  def(paste0("grY", y0, "Y", y1), fmtg(cagr(lv_gdp90[as.character(y0)], lv_gdp90[as.character(y1)], y1 - y0)))
  def(paste0("graY", y0, "Y", y1), fmtg(abs(cagr(lv_gdp90[as.character(y0)], lv_gdp90[as.character(y1)], y1 - y0))))
  def(paste0("tgrY", y0, "Y", y1), fmtg(cagr(lv_gdp90[as.character(y0)] * lv_pop[as.character(y0)], lv_gdp90[as.character(y1)] * lv_pop[as.character(y1)], y1 - y0)))
  for (k in grx_keys) def(paste0("grxY", cname(k), "Y", y0, "Y", y1), fmtg(cagr(cmp[[k]][as.character(y0)], cmp[[k]][as.character(y1)], y1 - y0)), allow_missing = TRUE)
}
for (y in years_all) {
  def(paste0("pctwcY", y), fmtp(lv_gdp90[as.character(y)] / cmp$Western[as.character(y)] * 100), allow_missing = TRUE)
  def(paste0("pctnordY", y), fmtp(lv_gdp90[as.character(y)] / cmp$Nordics[as.character(y)] * 100), allow_missing = TRUE)
  def(paste0("pctfinY", y), fmtp(lv_gdp90[as.character(y)] / cmp$Finland[as.character(y)] * 100), allow_missing = TRUE)
  def(paste0("pctussrY", y), fmtp(lv_gdp90[as.character(y)] / cmp$USSRb[as.character(y)] * 100), allow_missing = TRUE)
  def(paste0("pctperY", y), fmtp(lv_gdp90[as.character(y)] / cmp$Periphery[as.character(y)] * 100), allow_missing = TRUE)
  for (k in c("Lithuania", "Estonia", "Baltics", "Periphery", "ECE", "Finland", "Latvia", "USSR", "Greece", "Ireland", "Portugal", "Poland", "Hungary", "Czechoslovakia", "Italy", "Spain"))
    for (d in c("Western", "Nordics", "Finland", "USSR")) { dd <- if (d == "USSR") "USSRb" else d
      def(paste0("pctxY", cname(k), "Y", cname(d), "Y", y), fmtp(cmp[[k]][as.character(y)] / cmp[[dd]][as.character(y)] * 100), allow_missing = TRUE) }
}
sec_all <- c(sec_rows, "Market services total", "Tertiary sector total", "Secondary sector total", "Public administration & soc. security",
             "Defence", "Health", "Education & culture", "Other services")
sec_all_key <- c(sec_key, "Market", "Tertiary", "Secondary", "Publicadm", "Defence", "Health", "Education", "Other")
sec_years <- c(1919, 1920, 1925, 1929, 1931, 1932, 1934, 1938, 1939, 1940, 1944, 1945, 1947, 1948, 1950, 1955, 1961, 1962, 1963, 1967, 1968,
               1969, 1973, 1974, 1975, 1980, 1982, 1985, 1986, 1987, 1989, 1990, 1991, 1995)
for (j in seq_along(sec_all)) { s <- sec_all[j]; k <- sec_all_key[j]
  v <- sv[[s]]; yrs <- as.numeric(rownames(sv))
  pk <- yrs[yrs <= 1990 & !is.na(v)][which.max(v[yrs <= 1990 & !is.na(v)])]
  rg <- yrs[yrs >= 1945 & !is.na(v) & v >= 100]; def(paste0("speakY", k), pk); def(paste0("sregainY", k), if (length(rg)) min(rg) else "---")
  for (y in sec_years) def(paste0("sidxY", k, "Y", y), fmt(sv[as.character(y), s]), allow_missing = TRUE)
  for (y0 in sec_years) for (y1 in sec_years) if (y1 > y0) {
    v0 <- sv[as.character(y0), s]; v1 <- sv[as.character(y1), s]
    def(paste0("sgrY", k, "Y", y0, "Y", y1), if (is.na(v0) || is.na(v1)) "---" else fmtg(cagr(v0, v1, y1 - y0)), allow_missing = TRUE)
    def(paste0("sgraY", k, "Y", y0, "Y", y1), if (is.na(v0) || is.na(v1)) "---" else fmtg(abs(cagr(v0, v1, y1 - y0))), allow_missing = TRUE) }
}
for (k in which(i90)) def(paste0("ovdY", ov$year[k]), fmtg(ov$diff_pct[k]))
for (y in names(mpd_gap)) def(paste0("mpdgapY", y), fmtp(mpd_gap[[y]]))
# transition and milestones
seg <- lv_gdp90[as.character(1989:2000)]; tr_y <- as.numeric(names(seg)[which.min(seg)]); tr_pct <- (1 - min(seg) / lv_gdp90["1989"]) * 100
def("lvTROUGHyear", tr_y); def("lvTROUGHpct", fmtp(tr_pct)); def("lvTROUGHval", fmt(min(seg)))
reg89 <- as.numeric(names(lv_gdp90)[names(lv_gdp90) > "1989" & lv_gdp90 >= lv_gdp90["1989"]][1]); def("lvREGAINeightynine", reg89)
lt_reg89 <- as.numeric(names(lt_gdp90)[names(lt_gdp90) > "1989" & lt_gdp90 >= lt_gdp90["1989"]][1]); def("ltREGAINeightynine", lt_reg89)
ee_reg89 <- as.numeric(names(ee_gdp90)[names(ee_gdp90) > "1989" & ee_gdp90 >= ee_gdp90["1989"]][1]); def("eeREGAINeightynine", ee_reg89)
last_year_where <- function(cond, lo, hi) { yy <- as.numeric(names(lv_gdp90)); sel <- yy > lo & yy <= hi & cond
  if (!any(sel)) stop("overtaking condition never holds"); max(yy[sel]) }
lt_over_ee <- last_year_where(ee_gdp90 > lt_gdp90, 1990, last_year) + 1; def("ltOVERTAKEee", lt_over_ee)
def("warLVoneBpop", fmtpm(war_lv1$population_pct)); def("warLVoneBgdp", fmtpm(war_lv1$gdp_pct)); def("warLVoneBpc", fmtpm(war_lv1$gdppc_pct))
def("warLVtwoBpop", fmtpm(war_lv2$population_pct)); def("warLVtwoBgdp", fmtpm(war_lv2$gdp_pct)); def("warLVtwoBpc", fmtpm(war_lv2$gdppc_pct))
reg13 <- as.numeric(names(lv_gdp90)[as.numeric(names(lv_gdp90)) > 1913 & lv_gdp90 >= lv_gdp90["1913"]][1]); def("lvREGAINthirteen", reg13)
reg38 <- as.numeric(names(lv_gdp90)[as.numeric(names(lv_gdp90)) > 1940 & lv_gdp90 >= lv_gdp90["1938"]][1]); def("lvREGAINthirtyeight", reg38)
sovpeak <- as.numeric(names(which.max(lv_gdp90[as.character(1945:1990)]))); def("lvSOVPEAKyear", sovpeak)
# Baltic ranking of Latvia (1 = richest) in a year
for (y in c(1913, 1929, 1938, 1950, 1968, 1989, 1995, 2008, 2019, 2024)) {
  r <- rank(-c(lv_gdp90[as.character(y)], lt_gdp90[as.character(y)], ee_gdp90[as.character(y)]))[1]
  def(paste0("lvrankY", y), c("first", "second", "third")[r]) }
# years in which Estonia overtook Latvia / Lithuania overtook Latvia
ee_over <- last_year_where(lv_gdp90 > ee_gdp90, 1950, 1990) + 1; def("eeOVERTAKElv", ee_over)
lt_over <- last_year_where(lv_gdp90 > lt_gdp90, 1950, last_year) + 1; def("ltOVERTAKElv", lt_over)
# The prose states the years to 1988 in which Latvia was not the richest Baltic economy; keep it honest.
yy_all <- as.numeric(names(lv_gdp90))
not_richest <- yy_all[yy_all <= 1988 & (ee_gdp90 > lv_gdp90 | lt_gdp90 > lv_gdp90)]
stopifnot(identical(not_richest, c(1919, 1921, 1922, 1923, 1947, 1948, 1962, 1963, 1964)))
def("lvFALLcrisis", fmtp(abs((lv_gdp90["2010"] / lv_gdp90["2007"] - 1) * 100)))   # 2007-10 peak-to-trough fall
lt_above_lv_1990s <- yy_all[yy_all >= 1990 & yy_all < lt_over & lt_gdp90 > lv_gdp90]
stopifnot(identical(lt_above_lv_1990s, c(1992:1999, 2003, 2008)))
# the agricultural (primary-sector) peak relative to 1938, quoted in the comparative section
def("primPEAKidx", fmt(max(sv[["Primary sector total"]][as.numeric(rownames(sv)) <= 1991], na.rm = TRUE)))
def("primPEAKyear", as.numeric(rownames(sv))[which.max(ifelse(as.numeric(rownames(sv)) <= 1991, sv[["Primary sector total"]], NA))])
# Finland log-gap
def("lvFINloggapINTERWAR", sprintf("%.2f", log(cmp$Finland["1938"] / lv_gdp90["1938"])))
def("lvFINloggapSOVIET", sprintf("%.2f", log(cmp$Finland["1989"] / lv_gdp90["1989"])))
# beta coefficients
fmt_beta <- function(b) { s <- sprintf("%.2f", abs(b)); if (b < 0) paste0("$-$", s) else s }
for (p in list(list("INTERWAR", b1), list("COLDWAR", b2), list("MODERN", b3))) {
  def(paste0("beta", p[[1]]), fmt_beta(p[[2]]$coef[2])); def(paste0("beta", p[[1]], "se"), sprintf("%.2f", p[[2]]$se))
  def(paste0("beta", p[[1]], "n"), p[[2]]$n); def(paste0("beta", p[[1]], "sigma"), sprintf("%.1f", p[[2]]$sigma))
  for (cc in c("Latvia", "Lithuania", "Estonia")) def(paste0("bres", p[[1]], cname(cc)), fmtsg(p[[2]]$resid[cc]))
}
# population changes
# population changes as unsigned percentages (the prose says 'fell by' / 'rose by')
def("lvPOPchangeWARtwo", fmtp(abs((lv_pop["1945"] / lv_pop["1939"] - 1) * 100)))
def("lvPOPchangeSOVIET", fmtp(abs((lv_pop["1989"] / lv_pop["1950"] - 1) * 100)))
def("lvPOPchangeMODERN", fmtp(abs((lv_pop["2024"] / lv_pop["1989"] - 1) * 100)))
def("lvPOPchangeWARone", fmtp(abs((lv_pop["1919"] / lv_pop["1913"] - 1) * 100)))
# dedupe guard
stopifnot(!any(duplicated(sub("\\\\expandafter\\\\newcommand\\\\csname ([^\\\\]+)\\\\endcsname.*", "\\1", mac))))
writeLines(c("% Generated by scripts/R/latvia_tables.R -- do not edit by hand", mac), file.path(out_dir, "numbers.tex"))
message("Written: ", file.path(out_dir, "numbers.tex"), " (", length(mac), " macros)")

# =============================================================================
# 16. ONLINE DATA APPENDIX WORKBOOK
# =============================================================================

wbx <- createWorkbook()
addWorksheet(wbx, "0 Description")
writeData(wbx, "0 Description", data.frame(Item = c("Paper", "Authors", "Citation", "Contents", "Units", "Borders", "Licence"),
  Value = c("Baltic growth puzzle: the first Latvian Soviet-period series and a Baltic comparative growth analysis, 1919-2025",
            "Adomas Klimantas, Stephen Broadberry, Martin Klesment, Gatis Krumins",
            "Klimantas, Broadberry, Klesment and Krumins (2026), online data appendix; underlying thesis: Klimantas (2025), University of Oxford",
            "1 GDP per capita 1913, 1919-2024 (Int$1990, Int$2011) and population for Latvia (with Lithuania and Estonia for comparison); 2 sectoral volume indices for Latvia 1919-1995; 3 benchmarks 1935 and 1990; 4 overlaps; 5 growth and relative levels; 6 sources",
            "GDP per capita in 1990 and 2011 international (Geary-Khamis) dollars; population in thousands, mid-year",
            "Republic borders to 1944, present-day borders from 1945",
            "Use permitted only with source indication")))
addWorksheet(wbx, "1 GDP pc and population")
writeData(wbx, "1 GDP pc and population", data.frame(year = years_all, Latvia_Int1990 = round(lv_gdp90, 1), Latvia_Int2011 = round(lv_gdp11, 1),
  Latvia_population_000 = round(lv_pop, 3), Lithuania_Int1990 = round(lt_gdp90, 1), Estonia_Int1990 = round(ee_gdp90, 1),
  Lithuania_population_000 = round(lt_pop, 3), Estonia_population_000 = round(ee_pop, 3)))
addWorksheet(wbx, "2 Sectoral indices LV")
writeData(wbx, "2 Sectoral indices LV", cbind(year = as.numeric(rownames(sv)), round(sv, 2)))
addWorksheet(wbx, "3 Benchmarks")
writeData(wbx, "3 Benchmarks", bm[, c("sector", "value_1935_mLVL", "value_1990_mroubles", "note")])
addWorksheet(wbx, "4 Overlaps")
writeData(wbx, "4 Overlaps", data.frame(year = ov$year, earlier_benchmark_series = round(ov$a, 1), later_benchmark_series = round(ov$b, 1),
  difference_pct = ov$diff_pct, grade = ov$grade, final_series = round(ov$final, 1)))
addWorksheet(wbx, "5 Growth and relative levels")
writeData(wbx, "5 Growth and relative levels", cbind(period = pd_lab, round(gr_tab, 2)))
writeData(wbx, "5 Growth and relative levels", round(rel, 1), startRow = nrow(gr_tab) + 4)
addWorksheet(wbx, "6 Sources")
src <- read_sc(file.path(ds, "Sources.csv"))
writeData(wbx, "6 Sources", src)
saveWorkbook(wbx, file.path(sup_dir, "Latvia_online_data_appendix.xlsx"), overwrite = TRUE)
message("Written: ", file.path(sup_dir, "Latvia_online_data_appendix.xlsx"))

# ---- console summary ----------------------------------------------------------
cat("\nGrowth table (per cent p.a.):\n"); print(round(gr_tab, 2))
cat("\nRelative levels:\n"); print(round(rel, 0))
cat("\nOverlaps:\n"); print(ov[, c("year", "a", "b", "diff_pct", "grade")])
cat("\nSectoral growth:\n"); print(round(sec_gr, 1)); print(regain); print(peak)
cat("\nMPD gap:", round(mpd_gap, 1), "\nTrough:", tr_y, round(tr_pct, 1), "regain 1989:", reg89, "regain 1913:", reg13, "regain 1938:", reg38,
    "Soviet peak:", sovpeak, "EE overtakes LV:", ee_over, "LT overtakes LV:", lt_over, "\nbeta:", b1$coef[2], b2$coef[2], b3$coef[2],
    "(SE", b1$se, b2$se, b3$se, "; n", b1$n, b2$n, b3$n, ")\n")
message("Done.")
