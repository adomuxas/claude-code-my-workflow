# =============================================================================
# tables.R -- data pipeline for
#   "New GDP series for interwar and Soviet Estonia: a Finnish miracle that
#    never was" (Klimantas & Klesment)
#
# Inputs  (all relative to the repository root):
#   Data/Klimantas_2025_data.xlsx            GDP per capita, population (sheets 2-3)
#   Data/estonia_benchmarks_1938_1990.csv    1938 and 1990 benchmark value-added
#   Data/estonia_overlaps.csv                overlap differences 1937-40, 1990-95
#   Data/estonia_previous_estimates.csv      (optional) Valge 2003 / Klesment et al.
#   Datasheets/*.csv                         comparator series (cite Sources.csv)
# Outputs:
#   Tables/estonia/T*.tex, A*.tex            main-text and appendix tables
#   Tables/estonia/numbers.tex               LaTeX macros for numbers quoted in prose
#   Paper/estonia/supplementary/Estonia_online_data_appendix.xlsx
#
# Run from the repository root:  Rscript scripts/R/tables.R
# No stochastic operations; no set.seed() needed.
# Author: A. Klimantas (pipeline drafted with Claude Code)   Last revised: 2026-10-16
# =============================================================================

library(readxl)
library(openxlsx)

if (!file.exists("Data/Klimantas_2025_data.xlsx"))
  stop("Run this script from the repository root (Data/Klimantas_2025_data.xlsx not found).")

out_dir <- file.path("Tables", "estonia")
sup_dir <- file.path("Paper", "estonia", "supplementary")
dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
dir.create(sup_dir, recursive = TRUE, showWarnings = FALSE)

# ---- helpers -----------------------------------------------------------------

#' Write a character vector of LaTeX lines to Tables/estonia/<fname>
write_tex <- function(lines, fname) {
  path <- file.path(out_dir, fname)
  writeLines(lines, con = path, useBytes = FALSE)
  message("Written: ", path)
}

#' Read a semicolon-separated CSV with '.' decimals and a UTF-8 BOM
read_sc <- function(path) {
  read.csv(path, sep = ";", dec = ".", check.names = FALSE,
           stringsAsFactors = FALSE, fileEncoding = "UTF-8-BOM")
}

fmt   <- function(x, d = 0) ifelse(is.na(x), "---",
                                   formatC(round(x, d), format = "f", digits = d, big.mark = ","))
fmt1  <- function(x) fmt(x, 1)
# growth, 1 dp, true minus; the sign is tested after rounding so that -0.04 prints as 0.0, not -0.0
fmtg  <- function(x) { r <- round(x, 1)
  ifelse(is.na(r), "---", ifelse(r < 0, paste0("$-$", sprintf("%.1f", abs(r))), sprintf("%.1f", r))) }
fmtsg <- function(x) { r <- round(x, 1)
  ifelse(is.na(r), "---", paste0(ifelse(r >= 0, "+", "$-$"), sprintf("%.1f", abs(r)))) }
fmtp  <- function(x) ifelse(is.na(x), "---", sprintf("%.0f", x))             # percentage, 0 dp

cagr <- function(v0, v1, n) ((v1 / v0)^(1 / n) - 1) * 100

feinstein <- function(d) {
  ad <- abs(d)
  ifelse(ad < 5, "Firm", ifelse(ad < 15, "Good", ifelse(ad < 25, "Rough", "Conjectural")))
}

# A standard booktabs/threeparttable wrapper used by every main-text table
tex_table <- function(label, caption, colspec, header_lines, body_lines, note,
                      size = "\\small", placement = "[htbp]", colsep = NULL) {
  c(paste0("% ", label),
    paste0("\\begin{table}", placement),
    paste0("\\centering", size,
           if (!is.null(colsep)) paste0("\\setlength{\\tabcolsep}{", colsep, "}") else ""),
    paste0("\\caption[", caption, "]{\\textsc{", caption, "}}"),
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
# 1. ESTONIA: GDP PER CAPITA AND POPULATION (Data/Klimantas_2025_data.xlsx)
# =============================================================================

wb_path <- "Data/Klimantas_2025_data.xlsx"
last_year <- 2022

# Sheet 2 ("GDP per capita"): block of 1990$ values = cols 1-4 (year, LT, LV, EE)
raw_gdp <- as.data.frame(read_excel(wb_path, sheet = "GDP per capita", col_names = FALSE,
                                    .name_repair = "minimal"))
first_row <- which(suppressWarnings(as.numeric(raw_gdp[[1]])) == 1913)[1]
gdp_blk <- raw_gdp[first_row:nrow(raw_gdp), 1:4]
gdp_blk[] <- lapply(gdp_blk, function(z) suppressWarnings(as.numeric(z)))
names(gdp_blk) <- c("year", "Lithuania", "Latvia", "Estonia")
gdp_blk <- gdp_blk[!is.na(gdp_blk$year) & gdp_blk$year <= last_year, ]
stopifnot(abs(gdp_blk$Estonia[gdp_blk$year == 1938] - 2684.88) < 0.01,
          abs(gdp_blk$Estonia[gdp_blk$year == 2022] - 18862.86) < 0.01)

years_all <- c(1913, 1919:last_year)
ee_gdp90  <- setNames(gdp_blk$Estonia[match(years_all, gdp_blk$year)], years_all)
lt_gdp90  <- setNames(gdp_blk$Lithuania[match(years_all, gdp_blk$year)], years_all)
lv_gdp90  <- setNames(gdp_blk$Latvia[match(years_all, gdp_blk$year)], years_all)
stopifnot(!anyNA(ee_gdp90))
# Int$2011 per Int$1990: Bolt & van Zanden (2021), Maddison Project Database 2020 companion
# paper, p. 12 -- single definition, interpolated into every table note and the workbook
INT11_PER_INT90 <- 1.594
ee_gdp11  <- ee_gdp90 * INT11_PER_INT90

# Sheet 3 ("Population"): header row holds "Estonia"; data below, col 2 = year
raw_pop <- as.data.frame(read_excel(wb_path, sheet = "Population", col_names = FALSE,
                                    .name_repair = "minimal"))
hdr <- which(apply(raw_pop, 1, function(r) any(r == "Estonia", na.rm = TRUE)))[1]
pop_blk <- raw_pop[(hdr + 1):nrow(raw_pop), ]
names(pop_blk) <- as.character(unlist(raw_pop[hdr, ]))
names(pop_blk)[2] <- "year"
pop_blk <- data.frame(year = suppressWarnings(as.numeric(pop_blk$year)),
                      Estonia = suppressWarnings(as.numeric(pop_blk$Estonia)))
pop_blk <- pop_blk[!is.na(pop_blk$year), ]
ee_pop <- setNames(pop_blk$Estonia[match(years_all, pop_blk$year)], years_all)
stopifnot(abs(ee_pop["1913"] - 1164) < 0.01, !anyNA(ee_pop))

# =============================================================================
# 2. COMPARATOR SERIES (Datasheets/, cite from Datasheets/Sources.csv)
# =============================================================================

ds <- "Datasheets"
g_raw <- read_sc(file.path(ds, "GDPpc 1990usd.csv"))
g_year <- g_raw[[1]]
g_col <- function(name) {
  v <- suppressWarnings(as.numeric(g_raw[[which(names(g_raw) == name)[1]]]))
  setNames(v[match(years_all, g_year)], years_all)
}
# the Datasheets copies of the three Baltic series must equal the workbook series; the
# count guard stops an all-NA column from passing vacuously (max of nothing is -Inf)
check_same <- function(ds_name, wb_series) {
  d <- abs(g_col(ds_name) - wb_series)
  stopifnot(sum(!is.na(d)) > 100, max(d, na.rm = TRUE) < 0.01)
}
check_same("Estonia", ee_gdp90); check_same("Lithuania", lt_gdp90); check_same("Latvia", lv_gdp90)
cmp <- list(
  Finland  = g_col("Finland"),
  Sweden   = g_col("Sweden"),
  Denmark  = g_col("Denmark"),
  Nordics  = g_col("Nordics (Denmark, Finland, Iceland, Norway, Sweden)"),
  Western  = g_col("Western core"),
  Periphery = g_col("Western periphery"),   # Finland, Iceland, Ireland, Greece, Italy, Portugal, Spain
  USSR     = g_col("USSR"),
  Russia   = g_col("Russia"),
  ECE      = g_col("ECE"),
  Poland   = g_col("Poland"),
  Czechoslovakia = g_col("Czechoslovakia"),
  Hungary  = g_col("Hungary"),
  Austria  = g_col("Austria"),
  Ireland  = g_col("Ireland"),
  Greece   = g_col("Greece"),
  Lithuania = lt_gdp90,
  Latvia   = lv_gdp90
)

# Sectoral volume indices, Estonia, 1938 = 100
sv_raw <- read_sc(file.path(ds, "Sectoral volume indices Baltics 1919-1995.csv"))
sv_year <- sv_raw[[1]]
sv_cols <- grep("_index_estonia$", names(sv_raw), value = TRUE)
sv <- as.data.frame(lapply(sv_raw[sv_cols], function(z) suppressWarnings(as.numeric(z))))
names(sv) <- sub("_index_estonia$", "", sv_cols)
rownames(sv) <- sv_year
stopifnot(abs(sv["1938", "Total GVA/GDP"] - 100) < 1e-6)

# =============================================================================
# 3. BENCHMARKS (Data/estonia_benchmarks_1938_1990.csv)  -> Table 1
# =============================================================================

bm <- read_sc("Data/estonia_benchmarks_1938_1990.csv")
# taxes less subsidies on products (1938 only) travel in the CSV as their own row so that
# every Table 1 line is reproducible from Data/; they are not a sector
tax_row <- bm$sector == "Taxes less subsidies on products"
stopifnot(sum(tax_row) == 1)
taxes38 <- bm$value_1938_mEEK[tax_row]
bm <- bm[!tax_row, ]
gva38 <- sum(bm$value_1938_mEEK); gva90 <- sum(bm$value_1990_mroubles)
bm$share38 <- bm$value_1938_mEEK / gva38 * 100
bm$share90 <- bm$value_1990_mroubles / gva90 * 100
gdp38_eek <- gva38 + taxes38
bench38_int90 <- ee_gdp90["1938"]; bench90_int90 <- unname(ee_gdp90["1990"])
stopifnot(abs(bench90_int90 - 8425.0) < 0.01)   # Bolotin's 1990 benchmark, as in the dissertation
# share of non-transport services in 1938 GVA, quoted in the Table 7 sensitivity row
serv_share38 <- sum(bm$value_1938_mEEK[grepl("^Trade|^Public|^Other", bm$sector)]) / gva38 * 100

esc <- function(s) gsub("&", "\\\\&", s)
t1_body <- c(
  sprintf("%s & %s & %s & %s & %s \\\\", esc(bm$sector),
          fmt1(bm$value_1938_mEEK), fmtg(bm$share38),
          fmt1(bm$value_1990_mroubles), fmtg(bm$share90)),
  "\\midrule",
  sprintf("Gross value-added & %s & 100.0 & %s & 100.0 \\\\", fmt1(gva38), fmt1(gva90)),
  sprintf("Taxes less subsidies on products & %s & & --- & \\\\", fmt1(taxes38)),
  sprintf("GDP at market prices & %s & & %s & \\\\", fmt1(gdp38_eek), fmt1(gva90)),
  sprintf("GDP per capita, national currency & %s & & %s & \\\\",
          fmt1(gdp38_eek * 1e6 / (ee_pop["1938"] * 1e3)), fmt1(gva90 * 1e6 / (ee_pop["1990"] * 1e3))),
  sprintf("\\textit{GDP per capita, \\intlnineteen{}} & \\textit{%s} & & \\textit{%s} & \\\\",
          fmt(bench38_int90), fmt(bench90_int90))
)
t1 <- tex_table("tab:benchmarks",
  "Benchmark GDP by sector: Estonia 1938 and 1990, current prices",
  "lrrrr",
  c("& \\multicolumn{2}{c}{1938} & \\multicolumn{2}{c}{1990} \\\\",
    "\\cmidrule(lr){2-3}\\cmidrule(lr){4-5}",
    "Sector & m.\\,\\eek{} & \\% & m.\\,roubles & \\% \\\\"),
  t1_body,
  paste0("\\textit{Sources:} 1938: Valge's estimates for agriculture, industry, construction and housing, ",
         "with services re-estimated as described in Section~\\ref{sec:method} (see online appendix). ",
         "1990: \\cite[184--6]{bolotin1992}, converted to roubles with Bolotin's sectoral purchasing-power parities; ",
         "services other than trade and transport split using the 1987 Soviet input--output table (\\cite{wbinputoutput1987}). ",
         "\\textit{Notes:} the 1990 figure includes taxes less subsidies within sectoral values (`---': included in ",
         "sectoral values). Population: mid-year.")
)
write_tex(t1, "T1_benchmarks.tex")

# =============================================================================
# 4. OVERLAPS (Data/estonia_overlaps.csv) -> Table 3
#    Values of the two overlapping series are recovered from the final series and
#    the percentage differences reported in the dissertation (splice = average).
# =============================================================================

ov <- read_sc("Data/estonia_overlaps.csv")
ov$final <- ee_gdp90[as.character(ov$year)]
ov$a <- NA_real_; ov$b <- NA_real_
# 1937-40: a = interwar (1938-based) series, b = occupation (1990-based) series; diff = (b - a)/a
i37 <- ov$overlap == 1940
r <- 1 + ov$diff_pct[i37] / 100
ov$a[i37] <- ifelse(ov$year[i37] == 1940, ov$final[i37] * 2 / (1 + r), ov$final[i37])
ov$b[i37] <- ov$a[i37] * r
# 1990-95: a = Soviet-period series, b = modern (2011-based) series; diff = (a - b)/a.
# 1990: b is recovered from the dissertation difference (the final series is Bolotin's level).
# 1991-95: a is recomputed from the appendix GDP index and population, because the
# dissertation differences for 1992-95 came from an earlier vintage of those indices and
# no longer reproduce from Tables A1-A2; b is the final series from 1992 and, in the 1991
# splice year, 2 * final - a. The CSV values for 1991-95 are therefore overridden.
i90 <- ov$overlap == 1991
tot_idx <- sv[["Total GVA/GDP"]]; names(tot_idx) <- rownames(sv)
sov_level <- function(y) unname(bench90_int90 * tot_idx[as.character(y)] / tot_idx["1990"] *
                                  ee_pop["1990"] / ee_pop[as.character(y)])
for (k in which(i90)) {
  y <- ov$year[k]
  if (y == 1990) {
    ov$a[k] <- ov$final[k]; ov$b[k] <- ov$a[k] * (1 - ov$diff_pct[k] / 100)
  } else {
    ov$a[k] <- sov_level(y)
    ov$b[k] <- if (y == 1991) 2 * ov$final[k] - ov$a[k] else ov$final[k]
    ov$diff_pct[k] <- round((ov$a[k] - ov$b[k]) / ov$a[k] * 100, 1)
  }
}
# the recomputed 1991 difference must agree with the dissertation's -0.7, or the method differs
stopifnot(abs(ov$diff_pct[ov$year == 1991] - (-0.7)) < 0.15)
ov$grade <- feinstein(ov$diff_pct)

t3_body <- c(
  "\\multicolumn{5}{l}{\\textit{(a) Interwar series (1938 benchmark) and Soviet-period series (1990 benchmark)}} \\\\",
  sprintf("%d%s & %s & %s & %s & %s \\\\", ov$year[i37], ifelse(ov$year[i37] == 1940, "$^{\\dagger}$", ""),
          fmt(ov$a[i37]), fmt(ov$b[i37]), fmtsg(ov$diff_pct[i37]), ov$grade[i37]),
  "\\midrule",
  "\\multicolumn{5}{l}{\\textit{(b) Soviet-period series (1990 benchmark) and adjusted MPD series (2011 benchmark)}} \\\\",
  sprintf("%d%s & %s & %s & %s & %s \\\\", ov$year[i90], ifelse(ov$year[i90] == 1991, "$^{\\dagger}$", ""),
          fmt(ov$a[i90]), fmt(ov$b[i90]), fmtsg(ov$diff_pct[i90]), ov$grade[i90])
)
t3 <- tex_table("tab:overlaps",
  "Overlapping estimates of Estonian GDP per capita at the two splicing points",
  "lrrcc",
  c("Year & Earlier-benchmark series & Later-benchmark series & Difference (\\%) & Feinstein grade \\\\",
    "& (\\intlnineteen{}) & (\\intlnineteen{}) & & \\\\"),
  t3_body,
  paste0("\\textit{Sources:} see online appendix; adjusted MPD series from \\cite{mpd2023} with 1990--2010 growth ",
         "replaced by World Bank constant-price growth backcast from the 2011 benchmark (\\cite{wdi2024}). ",
         "\\textit{Notes:} Difference = (later $-$ earlier)/earlier in panel (a) and (earlier $-$ later)/earlier in panel (b), ",
         "so that a positive number always means that the 1990-based series is the higher one. ",
         "Feinstein's grades: firm ${<}5$ per cent, good 5--15, rough 15--25, conjectural ${>}25$ (\\cite[21]{feinstein1972}). ",
         "$^{\\dagger}$~Splice year: the final series takes the arithmetic average of the two estimates.")
)
write_tex(t3, "T3_overlaps.tex")

# =============================================================================
# 5. GROWTH BY SUB-PERIOD -> Table 5 ; relative levels -> Table 8
# =============================================================================

sub_pds <- list(c(1913, 1938), c(1919, 1929), c(1929, 1938), c(1938, 1950), c(1950, 1968),
                c(1968, 1989), c(1938, 1989), c(1989, 1995), c(1995, 2022))
# "1929--38" within a century, "1995--2022" across one
pd_lab  <- sapply(sub_pds, function(p)
  paste0(p[1], "--", if (p[1] %/% 100 == p[2] %/% 100) substr(p[2], 3, 4) else p[2]))
gr_of <- function(v) sapply(sub_pds, function(p) cagr(v[as.character(p[1])], v[as.character(p[2])], p[2] - p[1]))
gr_tab <- data.frame(
  Estonia = gr_of(ee_gdp90), Lithuania = gr_of(lt_gdp90), Finland = gr_of(cmp$Finland),
  Nordics = gr_of(cmp$Nordics), Western = gr_of(cmp$Western), Periphery = gr_of(cmp$Periphery),
  ECE = gr_of(cmp$ECE), USSR = gr_of(cmp$USSR), row.names = pd_lab)
t5_body <- sprintf("%s & %s \\\\", paste0("\\textit{", pd_lab, "}"),
                   apply(gr_tab, 1, function(r) paste(fmtg(r), collapse = " & ")))
t5_body <- append(t5_body, "\\midrule", after = 1)
t5_body <- append(t5_body, "\\midrule", after = 4)
t5_body <- append(t5_body, "\\midrule", after = 9)
t5 <- tex_table("tab:growth",
  "Average annual growth of GDP per capita by sub-period (per cent)",
  "lrrrrrrrr",
  "Period & Estonia & Lithuania & Finland & Nordics & Western core & Western periphery & ECE & USSR \\\\",
  t5_body,
  paste0("\\textit{Sources:} Estonia: see online appendix. Lithuania: \\cite{klimantas2026soviet}. ",
         "Other series: \\cite{mpd2023}, supplemented as documented in the online appendix. ",
         "\\textit{Notes:} compound annual rates between end-point years, \\intlnineteen{}. ",
         "Nordics: Denmark, Finland, Iceland, Norway and Sweden; Western periphery: Finland, Greece, Iceland, ",
         "Ireland, Italy, Portugal and Spain; Western core: Austria, Belgium, Denmark, France, Germany (West Germany ",
         "1950--97), the Netherlands, Norway, Sweden, Switzerland and the UK; ECE (East-Central Europe): Bulgaria, ",
         "Czechoslovakia, Hungary, Poland, Romania and Yugoslavia; USSR: Soviet Union within 1990 borders ",
         "(former Soviet Union after 1991).")
)
write_tex(t5, "T5_growth.tex")

rel_years <- c(1913, 1919, 1929, 1938, 1940, 1950, 1968, 1973, 1980, 1989, 1995, 2022)
rel <- data.frame(year = rel_years, ee = ee_gdp90[as.character(rel_years)])
pct <- function(v) ee_gdp90[as.character(rel_years)] / v[as.character(rel_years)] * 100
rel$fin <- pct(cmp$Finland); rel$swe <- pct(cmp$Sweden); rel$wc <- pct(cmp$Western)
rel$ussr <- pct(cmp$USSR); rel$lt <- pct(cmp$Lithuania); rel$lv <- pct(cmp$Latvia)
rel$lv[rel$year > 1938 & rel$year < 1995] <- NA   # Latvia 1940-95 reserved for a separate paper
t8_body <- sprintf("%d & %s & %s & %s & %s & %s & %s & %s \\\\", rel$year, fmt(rel$ee),
                   fmtp(rel$fin), fmtp(rel$swe), fmtp(rel$wc), fmtp(rel$ussr), fmtp(rel$lt), fmtp(rel$lv))
t8_body <- append(t8_body, "\\midrule", after = 4)
t8_body <- append(t8_body, "\\midrule", after = 11)
t8 <- tex_table("tab:relative",
  "Estonian GDP per capita relative to comparators, selected years",
  "lrrrrrrr",
  c("& Estonia & \\multicolumn{6}{c}{Estonia as a percentage of} \\\\",
    "\\cmidrule(lr){3-8}",
    "Year & (\\intlnineteen{}) & Finland & Sweden & Western core & USSR & Lithuania & Latvia \\\\"),
  t8_body,
  paste0("\\textit{Sources:} Estonia: see online appendix. Lithuania: \\cite{klimantas2026soviet}; Latvia: ",
         "\\cite{Klimantas2024} (1940--89 not shown). Finland, Sweden, Western core and USSR: \\cite{mpd2023} ",
         "and online appendix. \\textit{Notes:} USSR within 1990 borders; 1995 and 2022 refer to the former Soviet Union aggregate.")
)
write_tex(t8, "T8_relative.tex")

# =============================================================================
# 6. SECTORAL GROWTH BY SUB-PERIOD -> Table 6
# =============================================================================

sec_pds <- list(c(1919, 1929), c(1929, 1938), c(1938, 1950), c(1950, 1968), c(1968, 1989), c(1989, 1991))
sec_lab <- sapply(sec_pds, function(p) paste0(p[1], "--", substr(p[2], 3, 4)))
sec_rows <- c("Crops", "Livestock", "Forestry & fishing", "Primary sector total",
              "Food", "Textiles", "Other light industries", "Heavy industries", "Industry total",
              "Construction", "Transport & communications", "Trade, accommodation & food service",
              "Housing", "Public services total", "Total GVA/GDP")
sec_names <- c("Crops", "Livestock", "Forestry and fishing", "\\quad Primary sector",
               "Food", "Textiles", "Other light industries", "Heavy industries", "\\quad Industry",
               "Construction", "Transport and communications", "Trade, accommodation and catering",
               "Housing", "Public services", "\\textbf{GDP}")
sec_gr <- t(sapply(sec_rows, function(s) sapply(sec_pds, function(p) {
  v0 <- sv[as.character(p[1]), s]; v1 <- sv[as.character(p[2]), s]
  if (is.na(v0) || is.na(v1)) NA_real_ else cagr(v0, v1, p[2] - p[1]) })))
regain <- sapply(sec_rows, function(s) {
  v <- sv[[s]]; yrs <- as.numeric(rownames(sv))
  y <- yrs[yrs >= 1945 & !is.na(v) & v >= 100]; if (length(y)) min(y) else NA })
peak <- sapply(sec_rows, function(s) { v <- sv[[s]]; yrs <- as.numeric(rownames(sv))
  ok <- yrs <= 1990 & !is.na(v); yrs[ok][which.max(v[ok])] })
t6_body <- sprintf("%s & %s & %s & %s \\\\", sec_names,
                   apply(sec_gr, 1, function(r) paste(fmtg(r), collapse = " & ")),
                   ifelse(is.na(regain), "---", regain), peak)
t6_body <- append(t6_body, "\\midrule", after = 4)
t6_body <- append(t6_body, "\\midrule", after = 10)
t6_body <- append(t6_body, "\\midrule", after = 16)
t6 <- tex_table("tab:sectoral",
  "Average annual growth of sectoral value-added volume indices, Estonia (per cent)",
  "lrrrrrrcc",
  c(paste0("Sector & ", paste(sec_lab, collapse = " & "), " & 1938 level & Peak \\\\"),
    "& & & & & & & regained in & year \\\\"),
  t6_body,
  paste0("\\textit{Sources:} see online appendix. \\textit{Notes:} compound annual growth between end-point years of constant-price ",
         "value-added indices (1938 = 100). Industrial branch indices are available from 1938 only. ",
         "`1938 level regained': first post-war year (1945 or later) in which the index is at or above its 1938 value; ",
         "`Peak year': year of the highest index value up to 1990. Public services comprise administration, defence, ",
         "health and education. Growth in 1938--50 is affected by the wartime trough of 1944, for which Estonian sectoral ",
         "movements are partly extrapolated from Lithuanian ratios (Section~\\ref{sec:limitations}). The 1989--91 column ends ",
         "in 1991, the splicing year beyond which the final series follows adjusted Maddison Project data."),
  size = "\\scriptsize", colsep = "3pt"
)
write_tex(t6, "T6_sectoral.tex")

# =============================================================================
# 6b. SOURCES AND METHOD BY SECTOR -> Table 2 (text table; content from the
#     online appendix / dissertation description of the Estonian series)
# =============================================================================

t2_rows <- list(
  c("Crops", "Physical output of 15 crops weighted by 1938 value-added (Valge; 1939 agricultural survey); yields from \\cite{klesment2007}",
    "Physical output; weights from World Bank (1996) and Eurostat agricultural accounts; 1945--65 minor crops interpolated between quinquennial observations", "A.1"),
  c("Livestock", "Physical output of meat, milk, eggs and wool; 1938 value-added weights",
    "Physical output; during 1941--4 animal numbers multiplied by pre-war yields", "A.1"),
  c("Forestry and fishing", "Timber removals and fish catch; timber for 1919--21 and fish for 1919--27 extrapolated from the crops-and-livestock index",
    "Timber removals and fish catch; 1941--4 interpolated", "A.1"),
  c("Industry", "Employment adjusted for real wages (no usable annual output data; Valge's current-price series cannot be deflated by branch)",
    "101 physical product series in 11 branches; branch weights from the 1990 benchmark, product weights from 1986 archival output data (Estonian National Archives)", "A.2"),
  c("Construction", "Domestic cement use (production plus net imports), as in Valge; 1919--21 from population",
    "Weighted index of material inputs (1987 Soviet input--output weights), following the CIA procedure", "A.3"),
  c("Transport and communications", "Railway passenger- and tonne-kilometres, merchant fleet tonnage, postal items, telegrams and telephone calls",
    "Freight tonne-kilometres and passenger-kilometres for all modes; postal, telephone and broadcasting indicators; 1941--5 interpolated between 1940 and the first post-war observation, with 1943--5 movements from Lithuanian ratios (Section~\\ref{sec:method})", "A.4"),
  c("Trade, finance and insurance", "Marketed value-added of agriculture and industry plus deflated imports (`commerce' index); finance assumed to move with commerce",
    "Soviet retail and wholesale turnover at comparable prices (archival and published); finance and insurance from employment with a productivity adjustment", "A.5"),
  c("Housing", "Valge's housing value-added for 1929--38, extrapolated with the urban population",
    "Housing stock from construction and population data", "A.5"),
  c("Public administration, defence, health and education", "Civil services assumed to move with GDP; defence from military personnel (15,900 in 1921--39)",
    "Employment by branch (Soviet yearbooks, archival records); defence from the 1940 and 1990 totals", "A.6"),
  c("Other services", "Total population", "Employment", "A.6")
)
t2_body <- sapply(t2_rows, function(r) sprintf("%s & %s & %s & %s \\\\", r[1], r[2], r[3], r[4]))
t2 <- c("% tab:sources",
  "\\begin{table}[htbp]",
  "\\centering\\footnotesize",
  "\\caption[Volume indicators and sources by sector]{\\textsc{Volume indicators and sources by sector}}",
  "\\label{tab:sources}",
  "\\begin{threeparttable}",
  "\\begin{tabular}{>{\\RaggedRight}p{2.6cm}>{\\RaggedRight}p{5.3cm}>{\\RaggedRight}p{5.3cm}c}",
  "\\toprule",
  "Sector & Interwar series, 1919--40 (1938 weights) & Soviet-period series, 1937--95 (1990 weights) & App. \\\\",
  "\\midrule",
  t2_body,
  "\\bottomrule",
  "\\end{tabular}",
  "\\begin{tablenotes}[para,flushleft]",
  "\\footnotesize",
  paste0("\\textit{Sources:} Interwar: \\cite{valge2003all}; \\cite{klesment2007}; interwar statistical yearbooks and ",
         "agricultural surveys. Soviet period: \\textit{Eesti NSV rahvamajandus} statistical yearbooks (1957--89), ",
         "\\textit{Eesti statistika aastaraamat} (1990--98), Estonian National Archives (ERA, fond R-10 and R-1969), ",
         "German occupation statistical bulletins (\\textit{Statistische Berichte f\\\"ur das Ostland}, 1942--44), ",
         "and World Bank (1993, 1996). Full source lists by series are given in the online appendix, sections A.1--A.7."),
  "\\end{tablenotes}",
  "\\end{threeparttable}",
  "\\end{table}")
write_tex(t2, "T2_sources.tex")

# =============================================================================
# 6c. SENSITIVITY -> Table 7 (maximum impact on total GDP; dissertation Table)
# =============================================================================

t7_rows <- list(
  c("Interwar, 1919--40", "Service-sector value-added in the 1938 benchmark",
    sprintf("Services (%s\\%% of GDP)", fmtp(serv_share38)), "$\\pm$3"),
  c("", "Fixed value-added weights (`single deflation')", "All", "$\\pm$2"),
  c("", "Industrial output proxied by employment and real wages", "Industry", "$\\pm$1"),
  c("", "Taxes less subsidies not tracked annually", "All", "$\\pm$1"),
  c("", "No productivity adjustment in public services", "Public services", "$\\pm$3"),
  c("", "Other services proxied by population", "Other services", "$\\pm$1"),
  c("", "Military personnel known only for 1919--20 and 1939", "Defence", "$\\pm$1"),
  c("Soviet period, 1940--90", "Service-sector allocation in the 1990 benchmark", "Services", "$\\pm$4"),
  c("", "Taxes less subsidies absorbed in sectoral values", "All", "$-$0.5"),
  c("", "Fixed value-added weights (`single deflation')", "All", "$-$14"),
  c("", "Hidden inflation in comparable-price trade turnover", "Trade", "+2"),
  c("", "Size of Soviet forces stationed in Estonia unknown", "Defence", "$\\pm$5"),
  c("", "No productivity adjustment in employment-based services", "Services", "$-$10"),
  c("", "Wartime movements 1943--5 partly borrowed from Lithuania", "All (1941--5 only)", "15--25")
)
t7_body <- sapply(t7_rows, function(r) sprintf("%s & %s & %s & %s \\\\", r[1], r[2], r[3], r[4]))
t7_body <- append(t7_body, "\\midrule", after = 7)
t7 <- tex_table("tab:sensitivity",
  "Sources of potential bias and their maximum impact on the level of GDP",
  "p{2.5cm}p{6.6cm}p{2.4cm}r",
  c("Period & Source of bias & Sectors affected & Max. impact \\\\",
    "& & & (\\% of GDP) \\\\"),
  t7_body,
  paste0("\\textit{Sources:} authors' assessment; see Section~\\ref{sec:limitations} and the online appendix for the ",
         "derivation of each bound. \\textit{Notes:} signed entries indicate the direction in which the published series would be revised ",
         "if the bias were corrected; $\\pm$ entries are symmetric. The bounds are not additive."),
  size = "\\footnotesize", colsep = "4pt"
)
write_tex(t7, "T7_sensitivity.tex")

# =============================================================================
# 7. INTERWAR COMPARATORS -> Table 9 ; trade openness -> Table 10
# =============================================================================

iw_years <- c(1913, 1919, 1929, 1932, 1938)
iw_ctr <- c("Estonia", "Latvia", "Lithuania", "Finland", "Sweden", "Denmark", "Poland",
            "Czechoslovakia", "Hungary", "Austria", "Ireland", "Greece", "USSR")
iw_ser <- c(list(Estonia = ee_gdp90), cmp)[iw_ctr]
iw_tab <- t(sapply(iw_ser, function(v) v[as.character(iw_years)]))
iw_g   <- sapply(iw_ser, function(v) c(cagr(v["1919"], v["1929"], 10), cagr(v["1929"], v["1938"], 9),
                                       cagr(v["1913"], v["1938"], 25)))
ord <- order(iw_tab[, "1938"], decreasing = TRUE)
t9_body <- sprintf("%s & %s & %s \\\\",
                   ifelse(iw_ctr[ord] %in% c("Estonia", "Finland"), paste0("\\textbf{", iw_ctr[ord], "}"), iw_ctr[ord]),
                   apply(iw_tab[ord, ], 1, function(r) paste(fmt(r), collapse = " & ")),
                   apply(t(iw_g)[ord, ], 1, function(r) paste(fmtg(r), collapse = " & ")))
t9 <- tex_table("tab:interwar",
  "GDP per capita in Estonia and European comparators, 1913--38",
  "lrrrrrrrr",
  c("& \\multicolumn{5}{c}{\\intlnineteen{}} & \\multicolumn{3}{c}{Growth, \\% p.a.} \\\\",
    "\\cmidrule(lr){2-6}\\cmidrule(lr){7-9}",
    paste0("Country & ", paste(iw_years, collapse = " & "), " & 1919--29 & 1929--38 & 1913--38 \\\\")),
  t9_body,
  paste0("\\textit{Sources:} Estonia: see online appendix. Latvia and Lithuania: \\cite{Klimantas2024}; ",
         "\\cite{klimantas2023lithuania}. Other countries: \\cite{mpd2023}. \\textit{Notes:} countries ordered by 1938 level.")
)
write_tex(t9, "T9_interwar.tex")

tr_raw <- read_sc(file.path(ds, "Trade to GDP 1919-1940.csv"))
tr_ctr <- c("Estonia", "Latvia", "Lithuania", "Finland", "Denmark", "Norway", "Sweden",
            "Poland", "Czechoslovakia", "Hungary", "Germany", "United Kingdom")
tr_win <- list(c(1924, 1929), c(1930, 1934), c(1935, 1938))
tr_lab <- sapply(tr_win, function(w) paste0(w[1], "--", substr(w[2], 3, 4)))
stopifnot(all(tr_ctr %in% tr_raw[[1]]))   # a renamed country must fail here, not print "---"
tr_avg <- t(sapply(tr_ctr, function(ct) {
  row <- tr_raw[tr_raw[[1]] == ct, ]
  stopifnot(nrow(row) == 1)
  sapply(tr_win, function(w) {
    v <- suppressWarnings(as.numeric(unlist(row[as.character(w[1]:w[2])])))
    if (all(is.na(v))) NA_real_ else mean(v, na.rm = TRUE) * 100 })
}))
t10_body <- sprintf("%s & %s \\\\",
                    ifelse(tr_ctr %in% c("Estonia", "Finland"), paste0("\\textbf{", tr_ctr, "}"), tr_ctr),
                    apply(tr_avg, 1, function(r) paste(fmtg(r), collapse = " & ")))
t10 <- tex_table("tab:trade",
  "Trade openness (exports plus imports as a percentage of GDP), period averages",
  "lrrr",
  paste0("Country & ", paste(tr_lab, collapse = " & "), " \\\\"),
  t10_body,
  paste0("\\textit{Sources:} see the online appendix for the compilation of trade and GDP series ",
         "(\\cite{mitchelstat}; \\cite{mpd2023}; national statistical yearbooks). ",
         "\\textit{Notes:} unweighted averages of annual ratios; missing years omitted.")
)
write_tex(t10, "T10_trade.tex")

# =============================================================================
# 8. STRUCTURAL COMPARATORS c.1930 -> Table 11
# =============================================================================

lit <- read_sc(file.path(ds, "Literacy and agriculture population share 1930.csv"))
uni <- read_sc(file.path(ds, "University students per capita world 1919-2022.csv"))
uni$country_name[uni$country_name == "UK"] <- "United Kingdom"
sg  <- read_sc(file.path(ds, "Sectoral GDP and population shares industrial output 1920s-1930s.csv"))
st_ctr <- c("Estonia", "Finland", "Latvia", "Lithuania", "Denmark", "Norway", "Sweden", "Ireland",
            "Austria", "Czechoslovakia", "Hungary", "Poland", "Romania", "Bulgaria", "Yugoslavia",
            "Greece", "Italy", "Portugal", "Spain", "USSR", "Germany", "United Kingdom")
st <- data.frame(country = st_ctr,
  literacy = lit$literacy_1930[match(st_ctr, lit$country)] * 100,
  agri_emp = lit$agric_share[match(st_ctr, lit$country)] * 100,
  uni_1930 = sapply(st_ctr, function(ct) { v <- uni$university_students_per_thousand_people[
    uni$country_name == ct & uni$year == 1930]; if (length(v)) v[1] else NA_real_ }),
  agri_gdp37 = suppressWarnings(as.numeric(sg[["Agriculture share of GDP circa 1937"]][match(st_ctr, sg[[1]])])) * 100,
  stringsAsFactors = FALSE)
# every comparator must exist in the literacy and sectoral-GDP files; the university file has no
# rows for the East European group and lists Germany only as "FRG", so those gaps are an explicit
# allow-list -- any other NA means a country name drifted in Datasheets/
stopifnot(all(st_ctr %in% lit$country), all(st_ctr %in% sg[[1]]))
uni_expected_na <- c("Czechoslovakia", "Hungary", "Poland", "Romania", "Bulgaria", "Yugoslavia",
                     "USSR", "Germany")
stopifnot(setequal(st$country[is.na(st$uni_1930)], uni_expected_na))
st <- st[order(-st$literacy, st$agri_emp), ]
t11_body <- sprintf("%s & %s & %s & %s & %s \\\\",
                    ifelse(st$country %in% c("Estonia", "Finland"), paste0("\\textbf{", st$country, "}"), st$country),
                    fmtg(st$literacy), fmtg(st$agri_emp), fmtg(st$uni_1930), fmtg(st$agri_gdp37))
t11 <- tex_table("tab:structure",
  "Social capability and economic structure around 1930: Estonia, Finland and European comparators",
  "lrrrr",
  c("Country & Literacy & Agriculture & University & Agriculture \\\\",
    "& (\\% of adults) & (\\% of employment) & students (per 1,000) & (\\% of GDP) \\\\",
    "& c.\\,1930 & c.\\,1930 & 1930 & c.\\,1937 \\\\"),
  t11_body,
  paste0("\\textit{Sources:} literacy: \\cite{cronin_literacy}; \\cite[246--77]{kirk_literacy}; ",
         "\\cite[528]{bostonencikl_rast}. Agricultural employment: \\cite[181]{morysinterwarinmorys2021}; ",
         "\\cite{mitchelstat}; \\cite[395, 409, 418]{sov_labour1939}. University students and agricultural ",
         "shares of GDP: see online appendix, section A.7. \\textit{Notes:} countries ordered by literacy; a literacy value of 97.5 ",
         "denotes near-universal literacy where the source gives no census figure. `---': not available."),
  size = "\\footnotesize", colsep = "4pt"
)
write_tex(t11, "T11_structure.tex")

# =============================================================================
# 9. PREVIOUS ESTIMATES -> Table 4 (only if Data/estonia_previous_estimates.csv exists)
#    columns: year;source;value_int90   (source in {Valge 2003, Klesment et al. 2010, MPD 2023})
# =============================================================================

pe_path <- "Data/estonia_previous_estimates.csv"
if (file.exists(pe_path)) {
  pe <- read_sc(pe_path)
  pe_src <- unique(pe$source)
  pe_years <- sort(unique(pe$year))
  pe_mat <- sapply(pe_src, function(s) { sub <- pe[pe$source == s, ]; sub$value_int90[match(pe_years, sub$year)] })
  pe_mat <- matrix(pe_mat, ncol = length(pe_src), dimnames = list(pe_years, pe_src))
  new_v <- ee_gdp90[as.character(pe_years)]
  diffs <- sweep(pe_mat, 1, new_v, function(a, b) (a / b - 1) * 100)
  t4_body <- sprintf("%d & %s & %s \\\\", pe_years, fmt(new_v),
                     sapply(seq_along(pe_years), function(i) paste(
                       paste0(fmt(pe_mat[i, ]), " & ", fmtsg(diffs[i, ])), collapse = " & ")))
  t4 <- tex_table("tab:previous",
    "The new series compared with previous estimates of Estonian GDP per capita",
    paste0("lr", paste(rep("rr", length(pe_src)), collapse = "")),
    c(paste0("& This paper & ", paste(sprintf("\\multicolumn{2}{c}{%s}", pe_src), collapse = " & "), " \\\\"),
      paste(sprintf("\\cmidrule(lr){%d-%d}", 3 + 2 * (seq_along(pe_src) - 1), 4 + 2 * (seq_along(pe_src) - 1)), collapse = ""),
      paste0("Year & (\\intlnineteen{}) & ", paste(rep("Level & Diff.\\,\\%", length(pe_src)), collapse = " & "), " \\\\")),
    t4_body,
    paste0("\\textit{Sources:} this paper: see online appendix. Valge: \\cite[2726]{valge2003all}, Table 50, ",
           "Geary--Khamis dollars obtained by scaling Finnish income with Colin Clark's 1925--34 ratio. ",
           "Klesment et al.: \\cite[44]{klesment2010}, Table 2.2, UNECE 2005 purchasing-power parities deflated to ",
           "1990 US dollars with the consumer price index, four sectors only. MPD: \\cite{mpd2020}, as quoted in ",
           "\\cite[155]{norkus_restorations}, converted from \\intltwenty{} at ", INT11_PER_INT90, ". ",
           "\\textit{Notes:} Diff. = previous estimate relative to this paper, per cent. `---': not available.")
  )
  write_tex(t4, "T4_previous.tex")
} else {
  message("NOTE: ", pe_path, " not found; Table 4 (previous estimates) not generated.")
}

# =============================================================================
# 10. APPENDIX TABLES: A1 annual series ; A2 sectoral indices
# =============================================================================

yrs_l <- c(1913, 1919:1970); yrs_r <- 1971:last_year
n_rows <- max(length(yrs_l), length(yrs_r))
cell <- function(y) if (is.na(y)) " & & & " else
  sprintf("%d & %s & %s & %s", y, fmt(ee_gdp90[as.character(y)]), fmt(ee_gdp11[as.character(y)]), fmt1(ee_pop[as.character(y)]))
a1_hdr <- "Year & \\intlnineteen{} & \\intltwenty{} & Population & Year & \\intlnineteen{} & \\intltwenty{} & Population \\\\"
a1 <- c("% tab:series -- appendix table A1",
  "\\begingroup\\setlength{\\tabcolsep}{3pt}\\footnotesize",
  "\\begin{longtable}{rrrr@{\\hspace{1.2em}}rrrr}",
  "\\caption[Estonian GDP per capita and population, 1913 and 1919--2022]{\\textsc{Estonian GDP per capita and population, 1913 and 1919--2022}}\\label{tab:series}\\\\",
  "\\toprule", a1_hdr, "\\midrule", "\\endfirsthead",
  "\\multicolumn{8}{l}{\\textit{Table~\\ref{tab:series} (continued)}}\\\\", "\\toprule", a1_hdr, "\\midrule", "\\endhead",
  "\\midrule\\multicolumn{8}{r}{\\textit{continued}}\\\\", "\\endfoot",
  "\\bottomrule",
  paste0("\\multicolumn{8}{p{0.96\\linewidth}}{\\footnotesize\\textit{Sources:} see online appendix. \\textit{Notes:} GDP per capita in ",
         "international Geary--Khamis dollars of 1990 and of 2011 (\\intltwenty{} = \\intlnineteen{} $\\times$ ",
         INT11_PER_INT90, ", ",
         "\\cite[12]{bolt_zanden_newgdp2021}); population in thousands, mid-year, within the borders of the republic to 1944 and present-day borders thereafter. ",
         "No estimates for 1914--18.}\\\\"),
  "\\endlastfoot")
for (i in seq_len(n_rows)) {
  a1 <- c(a1, paste0(cell(if (i <= length(yrs_l)) yrs_l[i] else NA), " & ",
                     cell(if (i <= length(yrs_r)) yrs_r[i] else NA), " \\\\"))
  if (i == 1) a1 <- c(a1, "\\cmidrule(r){1-4}")   # separates 1913 from 1919 in the left block only
}
a1 <- c(a1, "\\end{longtable}", "\\endgroup")
write_tex(a1, "A1_series.tex")

sv_years <- as.numeric(rownames(sv))
a2_block <- function(cols, labels, label, caption, widths) {
  hdr <- paste0("Year & ", paste(labels, collapse = " & "), " \\\\")
  spec <- paste0("r", paste(rep("r", length(cols)), collapse = ""))
  out <- c(paste0("% ", label),
    "\\begingroup\\setlength{\\tabcolsep}{2.5pt}\\scriptsize",
    paste0("\\begin{longtable}{", spec, "}"),
    paste0("\\caption[", caption, "]{\\textsc{", caption, "}}\\label{", label, "}\\\\"),
    "\\toprule", hdr, "\\midrule", "\\endfirsthead",
    paste0("\\multicolumn{", length(cols) + 1, "}{l}{\\textit{Table~\\ref{", label, "} (continued)}}\\\\"),
    "\\toprule", hdr, "\\midrule", "\\endhead",
    paste0("\\midrule\\multicolumn{", length(cols) + 1, "}{r}{\\textit{continued}}\\\\"), "\\endfoot",
    "\\bottomrule",
    paste0("\\multicolumn{", length(cols) + 1, "}{p{0.96\\linewidth}}{\\scriptsize\\textit{Sources:} see online appendix. ",
           "\\textit{Notes:} constant-price value-added volume indices, 1938 = 100; `---': not available. ",
           "Commerce$^{*}$: interwar index of trade, finance and insurance combined.}\\\\"),
    "\\endlastfoot")
  for (i in seq_along(sv_years)) {
    vals <- sapply(cols, function(cn) fmt1(sv[i, cn]))
    out <- c(out, paste0(sv_years[i], " & ", paste(vals, collapse = " & "), " \\\\"))
  }
  c(out, "\\end{longtable}", "\\endgroup")
}
write_tex(a2_block(
  c("Crops", "Livestock", "Forestry & fishing", "Primary sector total", "Food", "Textiles",
    "Other light industries", "Heavy industries", "Industry total", "Construction", "Secondary sector total"),
  c("Crops", "Livestock", "Forestry, fishing", "Primary", "Food", "Textiles", "Other light", "Heavy",
    "Industry", "Construction", "Secondary"),
  "tab:appsec1", "Sectoral volume indices, Estonia 1919--95: primary and secondary sectors"),
  "A2_sectoral_a.tex")
write_tex(a2_block(
  c("Transport & communications", "Trade, accommodation & food service", "Commerce*", "Housing",
    "Finance & insurance", "Public administration & soc. security", "Defence", "Health",
    "Education & culture", "Other services", "Tertiary sector total", "Total GVA/GDP"),
  c("Transport, comm.", "Trade", "Commerce$^{*}$", "Housing", "Finance", "Administration", "Defence",
    "Health", "Education", "Other", "Tertiary", "GDP"),
  "tab:appsec2", "Sectoral volume indices, Estonia 1919--95: services and total GDP"),
  "A2_sectoral_b.tex")

# =============================================================================
# 11. NUMBER MACROS FOR THE PROSE -> Tables/estonia/numbers.tex
#   \ee{1938} GDP pc Int$1990 ; \eeb{1938} Int$2011 ; \pop{1938} population ;
#   \gr{1919}{1929} growth ; \pctfin{1938} etc. ; \idx{Textiles}{1987}
# =============================================================================

def <- function(name, value) sprintf("\\expandafter\\def\\csname %s\\endcsname{%s}", name, value)
# public macro names use \newcommand (not \providecommand) so that a clash with a package macro
# stops the build instead of silently printing something else in the prose
nm <- c("% Auto-generated by scripts/R/tables.R -- do not edit by hand",
  "\\newcommand{\\ee}[1]{\\csname eeGDP#1\\endcsname}",
  "\\newcommand{\\eeb}[1]{\\csname eeGDPb#1\\endcsname}",
  "\\newcommand{\\pop}[1]{\\csname eePOP#1\\endcsname}",
  "\\newcommand{\\gr}[2]{\\csname eeGR#1x#2\\endcsname}",
  "\\newcommand{\\grx}[3]{\\csname GR#1x#2x#3\\endcsname}",
  "\\newcommand{\\pctfin}[1]{\\csname eePCTfin#1\\endcsname}",
  "\\newcommand{\\pctswe}[1]{\\csname eePCTswe#1\\endcsname}",
  "\\newcommand{\\pctwc}[1]{\\csname eePCTwc#1\\endcsname}",
  "\\newcommand{\\pctussr}[1]{\\csname eePCTussr#1\\endcsname}",
  "\\newcommand{\\pctlt}[1]{\\csname eePCTlt#1\\endcsname}",
  "\\newcommand{\\pctlv}[1]{\\csname eePCTlv#1\\endcsname}",
  "\\newcommand{\\cum}[2]{\\csname eeCUM#1x#2\\endcsname}",
  def("eeGDPbench1990", fmt(bench90_int90)))
# Latvia 1940-94 is reserved for a separate paper: mask it in the macros exactly as in Table 8
lv_masked <- lv_gdp90; lv_masked[years_all > 1938 & years_all < 1995] <- NA
for (y in years_all) nm <- c(nm,
  def(paste0("eeGDP", y), fmt(ee_gdp90[as.character(y)])),
  def(paste0("eeGDPb", y), fmt(ee_gdp11[as.character(y)])),
  def(paste0("eePOP", y), fmt1(ee_pop[as.character(y)])),
  def(paste0("eePCTfin", y), fmtp(ee_gdp90[as.character(y)] / cmp$Finland[as.character(y)] * 100)),
  def(paste0("eePCTswe", y), fmtp(ee_gdp90[as.character(y)] / cmp$Sweden[as.character(y)] * 100)),
  def(paste0("eePCTwc", y), fmtp(ee_gdp90[as.character(y)] / cmp$Western[as.character(y)] * 100)),
  def(paste0("eePCTussr", y), fmtp(ee_gdp90[as.character(y)] / cmp$USSR[as.character(y)] * 100)),
  def(paste0("eePCTlt", y), fmtp(ee_gdp90[as.character(y)] / lt_gdp90[as.character(y)] * 100)),
  def(paste0("eePCTlv", y), fmtp(ee_gdp90[as.character(y)] / lv_masked[as.character(y)] * 100)))
all_pairs <- c(sub_pds, list(c(1913, 1919), c(1919, 1938), c(1940, 1944), c(1944, 1950), c(1950, 1973), c(1950, 1978),
                             c(1973, 1989), c(1938, 1968), c(1987, 1989), c(1968, 1973), c(1980, 1989)))
for (p in all_pairs) {
  a <- as.character(p[1]); b <- as.character(p[2]); n <- p[2] - p[1]
  nm <- c(nm, def(paste0("eeGR", a, "x", b), fmtg(cagr(ee_gdp90[a], ee_gdp90[b], n))),
          def(paste0("eeCUM", a, "x", b), fmtp((ee_gdp90[b] / ee_gdp90[a] - 1) * 100)))
  for (cn in names(cmp)) nm <- c(nm, def(paste0("GR", cn, "x", a, "x", b), fmtg(cagr(cmp[[cn]][a], cmp[[cn]][b], n))))
}
# sectoral index facts used in the prose
for (s in sec_rows) {
  key <- gsub("[^A-Za-z]", "", s)
  nm <- c(nm, def(paste0("eePEAK", key), peak[s]), def(paste0("eeREGAIN", key), ifelse(is.na(regain[s]), "---", regain[s])))
  for (p in sec_pds) nm <- c(nm, def(paste0("eeSGR", key, "x", p[1], "x", p[2]),
                                     fmtg(sec_gr[s, which(sapply(sec_pds, identical, p))])))
}
nm <- c(nm, "\\newcommand{\\speak}[1]{\\csname eePEAK#1\\endcsname}",
        "\\newcommand{\\sregain}[1]{\\csname eeREGAIN#1\\endcsname}",
        "\\newcommand{\\sgr}[3]{\\csname eeSGR#1x#2x#3\\endcsname}")
# growth of total GDP (volume index) over selected spans; unique() because sec_pds overlaps the list
tot <- sv[["Total GVA/GDP"]]; names(tot) <- rownames(sv)
tot_pairs <- unique(c(sec_pds, list(c(1950, 1978), c(1950, 1973), c(1973, 1989), c(1938, 1989),
                                    c(1919, 1938), c(1989, 1991))))
for (p in tot_pairs) {
  a <- as.character(p[1]); b <- as.character(p[2])
  nm <- c(nm, def(paste0("eeTGR", a, "x", b), fmtg(cagr(tot[a], tot[b], p[2] - p[1]))))
}
nm <- c(nm, "\\newcommand{\\tgr}[2]{\\csname eeTGR#1x#2\\endcsname}")
# first year after 1989 at or above the 1989 level
nm <- c(nm, def("eeREGAINnineteen", min(years_all[years_all > 1989 & ee_gdp90 >= ee_gdp90["1989"]])))
# trough of the transition and war
tr_idx <- which.min(ee_gdp90[as.character(1989:1999)]); tr_year <- (1989:1999)[tr_idx]
nm <- c(nm, def("eeTROUGHyear", tr_year), def("eeTROUGHval", fmt(ee_gdp90[as.character(tr_year)])),
        def("eeTROUGHpct", fmtp((1 - ee_gdp90[as.character(tr_year)] / ee_gdp90["1989"]) * 100)))
# absolute overlap differences by year, for the prose of Section IV (\ovd{1992} etc.)
for (k in seq_len(nrow(ov))) nm <- c(nm, def(paste0("eeOVD", ov$year[k]), fmtp(abs(ov$diff_pct[k]))))
nm <- c(nm, "\\newcommand{\\ovd}[1]{\\csname eeOVD#1\\endcsname}")
# \def overwrites silently, so a name produced twice with different values would never be
# noticed in the prose: fail here instead
macro_names <- sub("^\\\\expandafter\\\\def\\\\csname ([^\\\\]+)\\\\endcsname.*$", "\\1",
                   grep("^\\\\expandafter\\\\def", nm, value = TRUE))
if (anyDuplicated(macro_names))
  stop("numbers.tex: duplicate macro definitions: ",
       paste(unique(macro_names[duplicated(macro_names)]), collapse = ", "))
write_tex(nm, "numbers.tex")

# =============================================================================
# 12. ONLINE DATA APPENDIX WORKBOOK (openxlsx)
# =============================================================================

cite <- paste0("Klimantas, A. and Klesment, M. (forthcoming). New GDP series for interwar and Soviet Estonia: ",
               "a Finnish miracle that never was. Online data appendix.")
desc <- data.frame(Item = c("Source", "Short citation", "Use", "", "Sheets", "1. Population",
                            "2. Sectoral indices", "3. GDP per capita", "4. Benchmarks", "5. Overlaps", "",
                            "International comparability", "", "Generated by", "R version", "Generated on"),
  Content = c(cite, "Klimantas and Klesment (forthcoming)", "USE PERMITTED ONLY WITH THE SOURCE INDICATION", "",
              "", "Mid-year population, thousands, 1913 and 1919-2022 (borders of the republic to 1944, present-day borders thereafter)",
              "Constant-price value-added volume indices, 1938 = 100, 1919-1995",
              "GDP per capita in international 1990 and 2011 Geary-Khamis dollars, 1913 and 1919-2022",
              "1938 and 1990 benchmark GDP by sector at current prices (taxes and totals as in Table 1)",
              "Overlapping estimates at the 1940 and 1991 splicing points", "",
              paste0("Int$2011 = Int$1990 x ", INT11_PER_INT90, ", compatible with the Maddison Project Database (version 2023)"),
              "", "scripts/R/tables.R (repository: latvia-estonia-gdp-paper)", R.version.string,
              format(Sys.Date(), "%Y-%m-%d")),
  stringsAsFactors = FALSE)
# Table 1 totals, so that the workbook reproduces every line of the printed benchmark table
bm_sheet <- rbind(
  data.frame(Sector = bm$sector, v38 = bm$value_1938_mEEK, s38 = round(bm$share38, 1),
             v90 = bm$value_1990_mroubles, s90 = round(bm$share90, 1)),
  data.frame(Sector = c("Gross value-added", "Taxes less subsidies on products", "GDP at market prices",
                        "GDP per capita, national currency (kroon / roubles)"),
             v38 = c(gva38, taxes38, gdp38_eek, gdp38_eek * 1e6 / (ee_pop["1938"] * 1e3)),
             s38 = c(100, NA, NA, NA),
             v90 = c(gva90, NA, gva90, gva90 * 1e6 / (ee_pop["1990"] * 1e3)),
             s90 = c(100, NA, NA, NA)))
names(bm_sheet) <- c("Sector", "1938, m. EEK", "1938, %", "1990, m. roubles", "1990, %")
wb <- createWorkbook()
addWorksheet(wb, "0. Description"); writeData(wb, 1, desc)
addWorksheet(wb, "1. Population")
writeData(wb, 2, data.frame(Year = years_all, `Estonia (thousands, mid-year)` = round(ee_pop, 1), check.names = FALSE))
addWorksheet(wb, "2. Sectoral indices")
writeData(wb, 3, cbind(Year = sv_years, round(sv, 2)))
addWorksheet(wb, "3. GDP per capita")
writeData(wb, 4, data.frame(Year = years_all, `Int$1990` = round(ee_gdp90, 1), `Int$2011` = round(ee_gdp11, 1),
                            check.names = FALSE))
addWorksheet(wb, "4. Benchmarks")
writeData(wb, 5, bm_sheet)
addWorksheet(wb, "5. Overlaps")
writeData(wb, 6, data.frame(Year = ov$year, Splice = ov$overlap, `Earlier-benchmark series` = round(ov$a, 1),
                            `Later-benchmark series` = round(ov$b, 1), `Difference, %` = ov$diff_pct,
                            Grade = ov$grade, check.names = FALSE))
for (i in 1:6) setColWidths(wb, i, cols = 1:30, widths = "auto")
xlsx_out <- file.path(sup_dir, "Estonia_online_data_appendix.xlsx")
saveWorkbook(wb, xlsx_out, overwrite = TRUE)
message("Written: ", xlsx_out)

message("\n=== Pipeline complete: tables in ", out_dir, " ===")
