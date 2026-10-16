# =============================================================================
# figures.R
# Generate all 8 publication figures for:
#   "New GDP series for interwar and Soviet Estonia: a Finnish miracle that
#    never was"
# Authors: Adomas Klimantas & Martin Klesment
# Output: Figures/estonia/  (8 PDF files, publication quality)
# =============================================================================
# All comparison data hardcoded (R CSV reader segfaults on wide CSVs).
# Source for hardcoded values documented inline.
# =============================================================================

setwd("C:/Users/Administrator/latvia-estonia-gdp-paper")
set.seed(20260416)

library(ggplot2)
library(dplyr)
library(tidyr)
library(scales)

dir.create("Figures/estonia", recursive = TRUE, showWarnings = FALSE)

# ---- colour palette (institutional) -----------------------------------------
col_estonia  <- "#012169"   # Emory navy / Estonia blue
col_finland  <- "#b91c1c"   # red
col_latvia   <- "#f2a900"   # gold
col_other    <- "#525252"   # mid-grey
col_klesment <- "#15803d"   # green
col_valge    <- "#7c3aed"   # purple
col_west     <- "#94a3b8"   # light blue-grey

# ---- publication theme -------------------------------------------------------
theme_paper <- function(base_size = 11) {
  theme_minimal(base_size = base_size) +
    theme(
      text               = element_text(family = "sans"),
      plot.title         = element_text(face = "bold", size = base_size,
                                        color = "#012169", margin = margin(b = 4)),
      plot.subtitle      = element_text(size = base_size - 1, color = "#525252",
                                        margin = margin(b = 8)),
      axis.title         = element_text(size = base_size - 1, color = "#333333"),
      axis.text          = element_text(size = base_size - 2, color = "#333333"),
      legend.text        = element_text(size = base_size - 2),
      legend.title       = element_text(size = base_size - 2, face = "bold"),
      legend.position    = "bottom",
      legend.key.width   = unit(1.5, "lines"),
      panel.grid.major.x = element_blank(),
      panel.grid.minor   = element_blank(),
      panel.grid.major.y = element_line(colour = "#e5e7eb", linewidth = 0.4),
      axis.line.x        = element_line(colour = "#9ca3af", linewidth = 0.5),
      plot.caption       = element_text(size = base_size - 3, color = "#6b7280",
                                        hjust = 0, margin = margin(t = 6)),
      plot.margin        = margin(8, 12, 6, 8)
    )
}

# ---- save helper -------------------------------------------------------------
save_fig <- function(p, fname, w = 7.5, h = 4.5) {
  path <- file.path("Figures", "estonia", fname)
  ggsave(path, plot = p, width = w, height = h, units = "in",
         device = "pdf", dpi = 300)
  message("Written: ", path)
}

# =============================================================================
# SECTION 1 -- CORE ESTONIA DATA
# Source: Data/Klimantas_2025_data.xlsx, extracted via Python openpyxl (2026-04-15)
# =============================================================================

years_all <- c(1913, 1919:2022)

ee_gdp90 <- c(
  2058.000, 1600.002, 1475.206, 1672.620, 1756.310, 1913.223, 1894.501,  # 1913, 1919-1924
  2038.279, 2029.593, 2042.835, 2046.197, 2113.172, 2282.191, 2176.185,  # 1925-1931
  2105.293, 2186.289, 2352.980, 2355.040, 2492.081, 2721.750, 2684.880,  # 1932-1938
  2736.093, 2771.472, 2389.719, 2382.371, 2327.782, 1909.467, 2656.052,  # 1939-1945
  2833.067, 3122.991, 3323.185, 3474.270, 3667.206, 3709.020, 3757.583,  # 1946-1952
  3746.881, 3786.529, 3950.874, 4242.771, 4460.022, 4727.225, 5010.331,  # 1953-1959
  5318.927, 5513.282, 5546.547, 5839.962, 6149.770, 6466.452, 6612.815,  # 1960-1966
  7012.630, 7347.757, 7441.986, 7688.093, 8002.145, 7896.481, 8079.937,  # 1967-1973
  8216.816, 8418.576, 8623.020, 8600.521, 8474.220, 8522.887, 8784.602,  # 1974-1980
  8584.834, 8553.953, 8775.322, 8932.156, 8728.332, 8918.637, 8832.710,  # 1981-1987
  8879.035, 8958.400, 8425.000, 7531.772, 6069.334, 5870.112, 5898.505,  # 1988-1994
  6276.579, 6684.731, 7643.804, 8052.510, 7994.708, 8758.715, 9343.888,  # 1995-2001
  10039.993, 10871.074, 11680.362, 12866.503, 14206.515, 15353.126,       # 2002-2007
  14604.310, 12491.895, 12826.448, 13799.875, 14293.789, 14557.159,       # 2008-2013
  15045.689, 15353.613, 15806.872, 16726.240, 17312.679, 17883.064,       # 2014-2019
  17729.977, 19133.725, 18862.858                                          # 2020-2022
)
stopifnot(length(ee_gdp90) == length(years_all))
names(ee_gdp90) <- as.character(years_all)

# =============================================================================
# SECTION 2 -- FINLAND AND WESTERN CORE
# Source: Datasheets/GDPpc 1990usd.csv, extracted via Python 2026-04-16.
# Western core = unweighted average of UK, France, Germany, Sweden, Denmark,
#                Norway, Netherlands, Belgium.
# =============================================================================

# Finland GDP per capita (Int$1990), 1913 + 1919-2022
fin_gdp90 <- c(
  2111.041, 1658.093, 1845.671, 1883.940, 2057.716, 2186.951, 2223.965,  # 1913,1919-1924
  2328.105, 2392.095, 2557.089, 2707.026, 2717.064, 2666.248, 2580.928,  # 1925-1931
  2550.188, 2702.008, 2988.080, 3092.848, 3279.172, 3441.029, 3589.084,  # 1932-1938
  3407.779, 3220.201, 3321.832, 3326.851, 3696.989, 3685.069, 3449.812,  # 1939-1945
  3683.187, 3717.064, 3956.713, 4143.036, 4252.823, 4570.891, 4673.777,  # 1946-1952
  4651.819, 5001.882, 5196.989, 5294.856, 5489.962, 5473.651, 5754.078,  # 1953-1959
  6230.238, 6658.093, 6818.695, 6993.726, 7306.775, 7670.013, 7823.714,  # 1960-1966
  7946.675, 8092.848, 8877.666, 9577.164, 9764.743, 10447.930, 11084.693, # 1967-1973
  11360.728, 11441.029, 11357.591, 11355.082, 11558.971, 12331.870, 12948.557, # 1974-1980
  13133.626, 13484.944, 13766.625, 14106.650, 14521.957, 14818.695, 15382.058, # 1981-1987
  16087.829, 16946.048, 16865.747, 15793.538, 15194.329, 15021.170, 15556.875, # 1988-1994
  16161.621, 16710.957, 17716.358, 18641.996, 19439.704, 20508.011, 21004.817, # 1995-2001
  21321.552, 21710.928, 22514.814, 23078.581, 23940.215, 25093.178,            # 2002-2007
  25175.441, 23000.385, 23597.938, 24110.414, 23660.609, 23339.489,            # 2008-2013
  23154.280, 23203.700, 23791.814, 24493.848, 24737.081, 25015.560,            # 2014-2019
  24386.262, 25080.210, 25534.169                                               # 2020-2022
)
stopifnot(length(fin_gdp90) == length(years_all))
names(fin_gdp90) <- as.character(years_all)

# Western core unweighted average (UK, France, Germany, Sweden, Denmark,
# Norway, Netherlands, Belgium) -- extracted 2026-04-16
wc_avg <- c(
  3763.72,                                                                  # 1913
  3406.60, 3571.99, 3528.15, 3834.61, 3899.62, 4091.12,                  # 1919-1924
  4166.09, 4265.13, 4419.23, 4580.54, 4705.69,                            # 1925-1929
  4716.59, 4485.18, 4339.32, 4445.81, 4552.70,                            # 1930-1934
  4699.97, 4885.35, 5049.95, 5091.59,                                      # 1935-1938
  5355.00, 4962.91, 4848.49, 4720.12, 4770.31,                            # 1939-1943
  4601.55, 4418.99, 4700.67, 5001.96, 5240.59,                            # 1944-1948
  5541.41, 5821.91, 6015.53, 6090.57, 6339.55,                            # 1949-1953
  6589.40, 6841.44, 7035.68, 7268.51, 7288.90,                            # 1954-1958
  7567.36, 7961.26, 8253.06, 8542.19, 8777.76,                            # 1959-1963
  9297.05, 9614.73, 9821.20, 10105.55, 10474.83,                          # 1964-1968
  10980.24, 11377.67, 11663.19, 12074.97, 12603.51,                       # 1969-1973
  12816.97, 12841.75, 13368.57, 13602.42, 13921.66,                       # 1974-1978
  14343.24, 14527.60, 14465.10, 14582.10, 14856.41,                       # 1979-1983
  15339.16, 15748.43, 16154.41, 16458.05, 16858.77,                       # 1984-1988
  17206.56, 17373.75, 17682.60, 17986.49, 18091.38,                       # 1989-1993
  18829.81, 19457.25, 20048.75, 20843.84, 21581.28,                       # 1994-1998
  22399.88, 23338.02, 23844.99, 24247.76, 24616.10,                       # 1999-2003
  25480.69, 26189.99, 27137.79, 28016.57,                                  # 2004-2007
  28204.09, 27282.74, 28038.41, 28532.70, 28549.04,                       # 2008-2012
  28590.76, 28951.69, 29357.33, 29677.12, 30216.03,                       # 2013-2017
  30512.79, 30822.32, 29421.41, 30766.00, 31512.26                        # 2018-2022
)
stopifnot(length(wc_avg) == length(years_all))
names(wc_avg) <- as.character(years_all)

# =============================================================================
# SECTION 3 -- INTERWAR COMPARATORS (1913, 1919-1939)
# Source: Datasheets/GDPpc 1990usd.csv, extracted 2026-04-16
# =============================================================================

years_iw <- c(1913, 1919:1939)

lv_gdp90 <- c(2361.00, 1481.04, 1521.76, 1670.53, 1654.27, 1898.98, 1942.74,
               2084.58, 2095.20, 2150.77, 2152.46, 2350.80, 2537.25, 2314.22,
               2285.91, 2496.26, 2722.41, 2776.05, 2797.00, 3030.96, 3098.86, 3108.38)
lt_gdp90 <- c(1632.00, 1016.64, 1186.69, 1415.85, 1529.96, 1755.81, 1648.52,
               1627.59, 1489.13, 1503.37, 1495.86, 1576.69, 1665.02, 1675.27,
               1702.47, 1722.59, 1792.56, 1900.41, 1931.68, 2018.70, 2057.39, 1942.69)
pl_gdp90 <- c(1739.02, 1347.83, 1882.06, 2073.12, 2240.21, 2570.90, 2413.81,
               2383.15, 2180.43, 2201.28, 2190.28, 2116.69, 1993.73, 1823.09,
               1658.09, 1589.71, 1592.85, 1597.24, 1624.84, 1914.68, 2181.93, 2038.02)
cz_gdp90 <- c(2095.98, 1588.40, 1932.87, 2084.69, 2006.27, 2151.19, 2353.20,
               2606.02, 2575.28, 2752.20, 2976.79, 3042.03, 2925.97, 2808.66,
               2680.05, 2552.07, 2442.91, 2409.66, 2599.12, 2882.06, 2802.98, 2519.90)
hu_gdp90 <- c(2097.87, 1484.14, 1708.91, 1739.65, 1888.74, 1865.68, 1912.17,
               2279.17, 2161.86, 2237.14, 2414.68, 2476.16, 2404.02, 2267.88,
               2191.97, 2373.90, 2370.14, 2471.14, 2617.94, 2542.66, 2654.96, 2838.14)
at_gdp90 <- c(3464.87, 2259.10, 2412.17, 2649.94, 2877.04, 2841.91, 3163.11,
               3367.00, 3412.80, 3505.02, 3656.84, 3698.87, 3585.95, 3287.95,
               2939.77, 2833.12, 2851.94, 2907.15, 2994.98, 3156.21, 3558.97, 4095.98)

stopifnot(length(lv_gdp90) == length(years_iw))
stopifnot(length(lt_gdp90) == length(years_iw))
stopifnot(length(pl_gdp90) == length(years_iw))
stopifnot(length(cz_gdp90) == length(years_iw))
stopifnot(length(hu_gdp90) == length(years_iw))
stopifnot(length(at_gdp90) == length(years_iw))

# =============================================================================
# SECTION 4 -- SECTORAL VOLUME INDICES (Estonia, 1938=100)
# Source: Datasheets/Sectoral volume indices Baltics 1919-1995.csv
#         Extracted 2026-04-16.
# =============================================================================

years_sec <- 1919:1995

# Primary sector total (agriculture, forestry & fishing)
sec_primary <- c(
  50.504,  61.239,  72.573,  74.142,  75.085,  77.427,  87.856,  83.699,  # 1919-1926
  87.193,  81.964,  84.181,  95.308,  88.583,  90.627,  95.111,  98.375,  # 1927-1934
  92.733,  89.391, 100.717, 100.000, 100.227,  92.916,  68.819,  61.610,  # 1935-1942
  55.051,  47.818,  59.895,  65.102,  81.043,  89.933,  85.526,  85.453,  # 1943-1950
  82.728,  83.944,  79.547,  78.601,  77.435,  89.836,  93.440,  98.972,  # 1951-1958
 109.611, 119.541, 115.457, 104.919, 115.541, 125.743, 130.585, 130.756,  # 1959-1966
 138.921, 147.327, 140.313, 147.339, 153.202, 142.796, 151.058, 156.157,  # 1967-1974
 159.747, 162.975, 161.390, 144.525, 151.755, 164.079, 146.964, 149.482,  # 1975-1982
 158.617, 169.020, 157.957, 172.291, 160.314, 154.127, 168.193, 153.031,  # 1983-1990
 139.528, 108.607,  97.565,  87.388,  83.746                               # 1991-1995
)

# Secondary sector total (industry + construction)
sec_secondary <- c(
  20.106,  25.422,  33.636,  40.285,  55.722,  51.331,  52.143,  55.979,  # 1919-1926
  50.459,  55.247,  59.815,  61.739,  59.906,  53.271,  58.772,  71.721,  # 1927-1934
  76.593,  96.013, 104.192, 100.000, 107.578, 107.719,  86.270,  69.918,  # 1935-1942
  66.052,  16.692,  69.739,  84.612, 105.789, 128.240, 155.990, 183.673,  # 1943-1950
 212.486, 235.043, 261.323, 283.554, 332.606, 365.607, 401.477, 449.851,  # 1951-1958
 494.818, 534.199, 587.806, 632.223, 681.339, 730.319, 791.926, 822.168,  # 1959-1966
 882.261, 933.631, 973.125,1018.070,1084.291,1086.658,1106.690,1119.558,  # 1967-1974
1158.384,1199.742,1186.737,1187.958,1172.762,1198.081,1182.318,1170.823,  # 1975-1982
1211.091,1229.356,1213.981,1228.709,1235.530,1251.287,1211.864,1088.390,  # 1983-1990
 996.836, 560.375, 359.235, 378.945, 365.797                               # 1991-1995
)

# Transport & communications index
sec_transport <- c(
  30.263,  41.218,  50.073,  60.422,  63.893,  66.436,  65.797,  71.396,  # 1919-1926
  70.261,  76.163,  83.315,  88.182,  86.155,  78.970,  71.597,  74.671,  # 1927-1934
  84.947,  89.644,  95.396, 100.000, 112.032, 145.944, 151.209, 130.793,  # 1935-1942
 125.729, 101.478, 121.471, 183.137, 219.786, 211.094, 223.709, 252.463,  # 1943-1950
 273.672, 301.280, 271.227, 297.118, 341.015, 372.175, 405.494, 431.909,  # 1951-1958
 466.167, 517.838, 558.758, 617.765, 685.031, 777.071, 933.352, 981.288,  # 1959-1966
1103.396,1169.219,1218.232,1303.417,1354.330,1379.935,1519.788,1683.577,  # 1967-1974
1669.510,1730.577,1842.688,1901.679,1883.150,1880.232,1917.027,1956.251,  # 1975-1982
2024.184,2099.929,2098.883,2233.401,2527.307,2893.724,3162.289,2988.003,  # 1983-1990
2903.765,2346.280,2573.258,2714.583,1486.714                               # 1991-1995
)

# Commerce* index (interwar period only; NA from 1941 onward)
sec_commerce <- c(
  32.082,  39.136,  48.304,  54.977,  67.907,  64.389,  70.333,  71.260,  # 1919-1926
  73.604,  78.872,  78.541,  80.128,  71.372,  62.345,  66.144,  79.138,  # 1927-1934
  82.959,  92.008, 102.243, 100.000, 100.291,  91.908,    NA,      NA,    # 1935-1942
    NA,      NA,      NA,      NA,      NA,      NA,      NA,      NA,    # 1943-1950
    NA,      NA,      NA,      NA,      NA,      NA,      NA,      NA,    # 1951-1958
    NA,      NA,      NA,      NA,      NA,      NA,      NA,      NA,    # 1959-1966
    NA,      NA,      NA,      NA,      NA,      NA,      NA,      NA,    # 1967-1974
    NA,      NA,      NA,      NA,      NA,      NA,      NA,      NA,    # 1975-1982
    NA,      NA,      NA,      NA,      NA,      NA,      NA,      NA,    # 1983-1990
    NA,      NA,      NA,      NA,      NA                                 # 1991-1995
)

# Housing index (available all years 1919-1995)
sec_housing <- c(
  46.214,  46.378,  47.219,  47.883,  48.621,  49.359,  50.097,  50.835,  # 1919-1926
  51.573,  53.362,  55.172,  68.966,  86.207,  86.207,  82.759,  79.310,  # 1927-1934
  86.207,  93.103,  96.552, 100.000, 100.592,  97.824,  47.097,  69.898,  # 1935-1942
  66.665,  63.432,  60.199,  70.901,  81.603,  92.305, 103.007, 113.710,  # 1943-1950
 122.907, 125.415, 130.432, 131.268, 137.120, 136.284, 142.137, 152.170,  # 1951-1958
 143.809, 148.826, 160.531, 161.367, 163.039, 167.220, 173.909, 175.581,  # 1959-1966
 183.106, 186.450, 189.795, 188.959, 205.681, 215.714, 224.075, 230.764,  # 1967-1974
 238.288, 237.452, 237.452, 242.469, 249.994, 258.355, 263.371, 274.241,  # 1975-1982
 287.618, 280.930, 283.438, 289.290, 286.782, 280.930, 280.093, 273.405,  # 1983-1990
 255.010, 234.108, 231.600, 249.994, 269.224                               # 1991-1995
)

# Total GVA/GDP index (1938=100)
sec_total <- c(
  55.987,  51.803,  59.800,  63.676,  69.892,  69.507,  74.875,  74.543,  # 1919-1926
  74.951,  75.082,  77.533,  83.768,  80.041,  77.651,  80.834,  87.159,  # 1927-1934
  87.430,  92.609, 101.204, 100.000, 102.617, 102.485,  82.709,  79.139,  # 1935-1942
  75.404,  57.811,  79.128,  87.735, 102.015, 112.512, 117.599, 125.378,  # 1943-1950
 129.899, 134.260, 136.769, 141.019, 149.132, 162.066, 172.419, 185.227,  # 1951-1958
 198.604, 212.584, 222.815, 227.187, 242.525, 259.089, 276.160, 285.471,  # 1959-1966
 305.125, 322.680, 330.264, 344.946, 363.493, 362.747, 374.755, 384.416,  # 1967-1974
 396.961, 409.509, 411.458, 408.205, 412.839, 428.092, 421.315, 422.833,  # 1975-1982
 436.766, 447.481, 440.196, 453.151, 452.290, 457.497, 463.428, 436.125,  # 1983-1990
 386.481, 268.750, 233.273, 231.550, 220.726                               # 1991-1995
)

stopifnot(length(sec_primary)   == length(years_sec))
stopifnot(length(sec_secondary) == length(years_sec))
stopifnot(length(sec_transport) == length(years_sec))
stopifnot(length(sec_commerce)  == length(years_sec))
stopifnot(length(sec_housing)   == length(years_sec))
stopifnot(length(sec_total)     == length(years_sec))

# =============================================================================
# SECTION 5 -- TRADE TO GDP RATIOS (1919-1939)
# Source: Datasheets/Trade to GDP 1919-1940.csv, extracted 2026-04-16
# (exports + imports) / GDP
# =============================================================================

years_trade <- 1919:1939

trade_ee <- c(0.116, 0.166, 0.146, 0.228, 0.292, 0.270, 0.294, 0.329, 0.334,
              0.397, 0.377, 0.331, 0.276, 0.202, 0.202, 0.270, 0.315, 0.307,
              0.323, 0.315, 0.311)
trade_fi <- c(0.151, 0.439, 0.319, 0.325, 0.373, 0.387, 0.410, 0.400, 0.419,
              0.441, 0.414, 0.335, 0.264, 0.191, 0.242, 0.307, 0.291, 0.327,
              0.408, 0.346, 0.348)
trade_lv <- c(NA,    0.221, 0.124, 0.241, 0.343, 0.363, 0.357, 0.361, 0.354,
              0.399, 0.453, 0.407, 0.361, 0.224, 0.184, 0.168, 0.175, 0.201,
              0.269, 0.226, 0.215)
trade_dk <- c(0.787, 0.561, 0.435, 0.428, 0.479, 0.487, 0.557, 0.479, 0.524,
              0.539, 0.521, 0.474, 0.391, 0.269, 0.302, 0.324, 0.336, 0.357,
              0.390, 0.370, 0.378)
trade_no <- c(1.455, 0.903, 0.495, 0.558, 0.536, 0.537, 0.586, 0.565, 0.560,
              0.567, 0.550, 0.463, 0.390, 0.264, 0.300, 0.362, 0.363, 0.389,
              0.469, 0.425, 0.502)
trade_se <- c(0.693, 0.556, 0.326, 0.338, 0.358, 0.368, 0.367, 0.351, 0.374,
              0.371, 0.376, 0.310, 0.250, 0.167, 0.208, 0.263, 0.254, 0.279,
              0.336, 0.304, 0.323)

stopifnot(length(trade_ee) == length(years_trade))
stopifnot(length(trade_fi) == length(years_trade))
stopifnot(length(trade_dk) == length(years_trade))

# =============================================================================
# FIGURE 1: Estonian GDP per capita 1913/1919-2022 (log scale)
# Reference: fig:gdppc
# =============================================================================

df_f1 <- data.frame(
  year = years_all,
  gdp  = ee_gdp90,
  stringsAsFactors = FALSE
)

p_f1 <- ggplot(df_f1, aes(x = year, y = gdp)) +
  geom_line(colour = col_estonia, linewidth = 0.7) +
  geom_vline(xintercept = c(1940, 1991), linetype = "dashed",
             colour = "#9ca3af", linewidth = 0.4) +
  scale_y_log10(
    labels = comma,
    breaks = c(1500, 2000, 3000, 5000, 8000, 15000)
  ) +
  scale_x_continuous(breaks = seq(1920, 2020, 20),
                     minor_breaks = seq(1913, 2022, 5)) +
  labs(
    title    = "Estonian GDP per capita, 1913 and 1919\u20132022",
    subtitle = "International dollars, 1990 Geary-Khamis (log scale)",
    x = NULL, y = "Int$1990 (log scale)",
    caption  = "Sources: authors' calculations; Maddison Project Database 2023 (post-1995)."
  ) +
  theme_paper()

save_fig(p_f1, "F1_gdppc.pdf", w = 7.5, h = 4.5)

# =============================================================================
# FIGURE 2: New series vs. Valge (2003) and Klesment et al. (approximate)
# Reference: fig:comparison
# =============================================================================

# Approximate Valge (2003) interwar series.
# Paper: Valge overstates by avg 10% in 1923-1929; anomalous 29% single-year
# jump in 1924 (within the Valge series itself, 1923->1924). Reasonable
# correspondence 1919-1922 and 1930-1938.
valge_yrs <- 1919:1938
valge_gdp <- as.numeric(ee_gdp90[as.character(valge_yrs)])
names(valge_gdp) <- as.character(valge_yrs)
valge_gdp[as.character(1923:1929)] <- valge_gdp[as.character(1923:1929)] * 1.10
# Impose the 29% single-year spike at 1924 within the Valge series
valge_gdp["1924"] <- valge_gdp["1923"] * 1.29

# Approximate Klesment et al. (2010) Soviet series: ~19% below new series.
klesment_yrs <- 1950:1990
klesment_gdp <- as.numeric(ee_gdp90[as.character(klesment_yrs)]) * 0.81

df_f2 <- bind_rows(
  data.frame(year = years_all,
             gdp  = as.numeric(ee_gdp90),
             series = "New series (this paper)",
             stringsAsFactors = FALSE),
  data.frame(year   = as.integer(names(valge_gdp)),
             gdp    = valge_gdp,
             series = "Valge (2003) approx.",
             stringsAsFactors = FALSE),
  data.frame(year   = klesment_yrs,
             gdp    = klesment_gdp,
             series = "Klesment et al. (2010) approx.",
             stringsAsFactors = FALSE)
)
df_f2 <- df_f2[df_f2$year >= 1919 & df_f2$year <= 1995, ]

p_f2 <- ggplot(df_f2, aes(x = year, y = gdp, colour = series, linetype = series)) +
  geom_line(linewidth = 0.7) +
  geom_vline(xintercept = c(1940, 1991), linetype = "dotted",
             colour = "#9ca3af", linewidth = 0.4) +
  scale_colour_manual(
    values = c("New series (this paper)"         = col_estonia,
               "Valge (2003) approx."            = col_valge,
               "Klesment et al. (2010) approx."  = col_klesment),
    name = NULL
  ) +
  scale_linetype_manual(
    values = c("New series (this paper)"         = "solid",
               "Valge (2003) approx."            = "longdash",
               "Klesment et al. (2010) approx."  = "twodash"),
    name = NULL
  ) +
  scale_y_continuous(labels = comma) +
  scale_x_continuous(breaks = seq(1920, 1990, 10)) +
  labs(
    title    = "Estonian GDP per capita: new series vs. previous estimates",
    subtitle = "Int$1990. Previous series approximated from published descriptions.",
    x = NULL, y = "Int$1990",
    caption  = paste0("Note: Valge (2003) and Klesment et al. (2010) series approximated from descriptions in those papers;\n",
                      "original digitised data not available. See text for magnitudes of divergence.")
  ) +
  theme_paper()

save_fig(p_f2, "F2_comparison.pdf", w = 8.0, h = 4.5)

# =============================================================================
# FIGURE 3: Estonia as % of western core 1913/1919-2022
# Reference: fig:westerncore
# =============================================================================

df_f3 <- data.frame(
  year   = years_all,
  ee_pct = as.numeric(ee_gdp90) / as.numeric(wc_avg) * 100,
  stringsAsFactors = FALSE
)

p_f3 <- ggplot(df_f3, aes(x = year, y = ee_pct)) +
  geom_hline(yintercept = 100, linetype = "dashed", colour = "#9ca3af",
             linewidth = 0.4) +
  geom_line(colour = col_estonia, linewidth = 0.7) +
  geom_vline(xintercept = c(1940, 1991), linetype = "dashed",
             colour = "#9ca3af", linewidth = 0.4) +
  scale_y_continuous(limits = c(0, 80),
                     labels = function(x) paste0(x, "%")) +
  scale_x_continuous(breaks = seq(1920, 2020, 20),
                     minor_breaks = seq(1913, 2022, 5)) +
  labs(
    title    = "Estonia: GDP per capita as a share of the western European core",
    subtitle = "Western core = unweighted average of UK, France, Germany, Sweden, Denmark, Norway, Netherlands, Belgium",
    x = NULL, y = "% of western core average",
    caption  = "Sources: authors' calculations; Maddison Project Database 2023."
  ) +
  theme_paper()

save_fig(p_f3, "F3_westerncore.pdf", w = 7.5, h = 4.5)

# =============================================================================
# FIGURE 4: Sectoral growth decomposition, interwar (1920-1939)
# Reference: fig:sectoral_interwar
# =============================================================================
# 1938 benchmark weights (GVA = 653.7m EEK):
#   Agriculture (primary):         250.1 / 653.7 = 38.3%
#   Industry + construction:       146.1 / 653.7 = 22.4%
#   Transport (32.2) + commerce (120.5): 152.7 / 653.7 = 23.4%
#   Public & other (99.3+5.5):    104.8 / 653.7 = 16.0%
# Contribution_s_t = w_s * (idx_s_t / idx_s_{t-1} - 1) * 100
# Public+other = residual ensuring contributions sum to total GDP growth.

w_ag  <- 250.1 / 653.7
w_sec <- 146.1 / 653.7
w_svc <- 152.7 / 653.7   # transport 32.2 + trade/commerce block 120.5
w_pub <- 104.8 / 653.7   # public + other (residual, not used directly)

iw_years <- 1920:1939
# indices for current year and lagged year in the years_sec vector
iw_i   <- match(iw_years,       years_sec)   # 1920-1939
iw_lag <- match(iw_years - 1,   years_sec)   # 1919-1938

# Combined market-services index (weighted: transport 32.2, commerce 120.5)
svc_current <- (32.2 * sec_transport[iw_i]   + 120.5 * sec_commerce[iw_i])   / 152.7
svc_lagged  <- (32.2 * sec_transport[iw_lag] + 120.5 * sec_commerce[iw_lag]) / 152.7

iw_contr <- data.frame(
  year = iw_years,
  ag   = w_ag  * (sec_primary[iw_i]   / sec_primary[iw_lag]   - 1) * 100,
  sec  = w_sec * (sec_secondary[iw_i] / sec_secondary[iw_lag] - 1) * 100,
  svc  = w_svc * (svc_current / svc_lagged - 1) * 100,
  tot  = (sec_total[iw_i] / sec_total[iw_lag] - 1) * 100,
  stringsAsFactors = FALSE
)
iw_contr$pub <- iw_contr$tot - iw_contr$ag - iw_contr$sec - iw_contr$svc

df_f4 <- iw_contr |>
  pivot_longer(cols = c(ag, sec, svc, pub),
               names_to = "sector", values_to = "contribution") |>
  transform(sector = factor(sector,
    levels = c("ag", "sec", "svc", "pub"),
    labels = c("Agriculture", "Industry & construction",
               "Market services", "Public & other")))

p_f4 <- ggplot(df_f4, aes(x = year, y = contribution, fill = sector)) +
  geom_col(width = 0.8, position = "stack") +
  geom_hline(yintercept = 0, colour = "#333333", linewidth = 0.4) +
  scale_fill_manual(
    values = c("Agriculture"             = "#86a96b",
               "Industry & construction" = col_estonia,
               "Market services"         = "#f59e0b",
               "Public & other"          = col_other),
    name = NULL
  ) +
  scale_x_continuous(breaks = seq(1920, 1939, 2)) +
  labs(
    title    = "Sectoral contributions to GDP growth: interwar Estonia, 1920\u20131939",
    subtitle = "Percentage-point contributions using 1938 benchmark weights (Laspeyres approximation)",
    x = NULL, y = "Percentage points",
    caption  = "Sources: authors' calculations. Sectoral volume indices from Datasheets."
  ) +
  theme_paper()

save_fig(p_f4, "F4_sectoral_interwar.pdf", w = 8.5, h = 4.5)

# =============================================================================
# FIGURE 5: Sectoral growth decomposition, Soviet period (5-year averages)
# Reference: fig:sectoral_soviet
# =============================================================================
# 1990 Bolotin benchmark weights (GVA = 7384.1m roubles):
#   Agriculture:              1250.0 / 7384.1 = 16.9%
#   Industry + construction:  3021.6 / 7384.1 = 40.9%
#   Transport:                 535.7 / 7384.1 =  7.3%
#   Housing (commercial svc proxy): 1322.3 / 7384.1 = 17.9%
#   Public + other (residual): 1254.5 / 7384.1 = 17.0%

w_ag90  <- 1250.0 / 7384.1
w_sec90 <- 3021.6 / 7384.1
w_tra90 <-  535.7 / 7384.1
w_hus90 <- 1322.3 / 7384.1

# 5-year periods 1946-1990; lag year is start-1 (i.e. 1945 for period 1946-50)
period_ends   <- c(1950, 1955, 1960, 1965, 1970, 1975, 1980, 1985, 1990)
period_starts <- c(1946, 1951, 1956, 1961, 1966, 1971, 1976, 1981, 1986)
period_labels <- c("1946-50","1951-55","1956-60","1961-65",
                   "1966-70","1971-75","1976-80","1981-85","1986-90")

sov_rows <- lapply(seq_along(period_starts), function(i) {
  i0 <- match(period_starts[i] - 1, years_sec)  # lag (start - 1)
  i1 <- match(period_ends[i],       years_sec)  # end of period
  nn <- period_ends[i] - period_starts[i] + 1
  # Average annual growth rate of each sector index
  gr_ag  <- (sec_primary[i1]   / sec_primary[i0])^(1/nn)   - 1
  gr_sec <- (sec_secondary[i1] / sec_secondary[i0])^(1/nn) - 1
  gr_tra <- (sec_transport[i1] / sec_transport[i0])^(1/nn) - 1
  gr_hus <- (sec_housing[i1]   / sec_housing[i0])^(1/nn)   - 1
  gr_tot <- (sec_total[i1]     / sec_total[i0])^(1/nn)     - 1
  ag_c   <- w_ag90  * gr_ag  * 100
  sec_c  <- w_sec90 * gr_sec * 100
  tra_c  <- w_tra90 * gr_tra * 100
  hus_c  <- w_hus90 * gr_hus * 100
  tot_c  <- gr_tot * 100
  pub_c  <- tot_c - ag_c - sec_c - tra_c - hus_c
  data.frame(period = period_labels[i],
             ag = ag_c, sec = sec_c, tra = tra_c, hus = hus_c, pub = pub_c,
             stringsAsFactors = FALSE)
})
sov_contr <- do.call(rbind, sov_rows)

df_f5 <- sov_contr |>
  pivot_longer(cols = c(ag, sec, tra, hus, pub),
               names_to = "sector", values_to = "contribution") |>
  transform(
    sector = factor(sector,
      levels = c("ag", "sec", "tra", "hus", "pub"),
      labels = c("Agriculture", "Industry & construction",
                 "Transport", "Commercial services (proxy)", "Public & other")),
    period = factor(period, levels = period_labels)
  )

p_f5 <- ggplot(df_f5, aes(x = period, y = contribution, fill = sector)) +
  geom_col(width = 0.8, position = "stack") +
  geom_hline(yintercept = 0, colour = "#333333", linewidth = 0.4) +
  scale_fill_manual(
    values = c("Agriculture"                 = "#86a96b",
               "Industry & construction"     = col_estonia,
               "Transport"                   = "#7dd3fc",
               "Commercial services (proxy)" = "#f59e0b",
               "Public & other"              = col_other),
    name = NULL
  ) +
  labs(
    title    = "Sectoral contributions to GDP growth: Soviet Estonia, 1946\u20131990",
    subtitle = "Average annual percentage-point contributions, 5-year periods. 1990 Bolotin benchmark weights.",
    x = NULL, y = "Avg annual pp contribution",
    caption  = paste0("Sources: authors' calculations. Commercial services proxied by housing index;\n",
                      "public sector contribution is residual (total minus observed sectors).")
  ) +
  theme_paper() +
  theme(axis.text.x = element_text(angle = 30, hjust = 1))

save_fig(p_f5, "F5_sectoral_soviet.pdf", w = 8.5, h = 4.8)

# =============================================================================
# FIGURE 6: Estonia and Finland GDP per capita 1913/1919-2022
# Reference: fig:finland
# =============================================================================

df_f6 <- rbind(
  data.frame(year = years_all, gdp = as.numeric(ee_gdp90),
             country = "Estonia", stringsAsFactors = FALSE),
  data.frame(year = years_all, gdp = as.numeric(fin_gdp90),
             country = "Finland", stringsAsFactors = FALSE)
)

p_f6 <- ggplot(df_f6, aes(x = year, y = gdp, colour = country)) +
  geom_line(linewidth = 0.7) +
  geom_vline(xintercept = c(1940, 1991), linetype = "dashed",
             colour = "#9ca3af", linewidth = 0.4) +
  scale_colour_manual(
    values = c("Estonia" = col_estonia, "Finland" = col_finland),
    name = NULL
  ) +
  scale_y_continuous(labels = comma) +
  scale_x_continuous(breaks = seq(1920, 2020, 20),
                     minor_breaks = seq(1913, 2022, 5)) +
  labs(
    title    = "Estonia and Finland: GDP per capita, 1913 and 1919\u20132022",
    subtitle = "International dollars, 1990 Geary-Khamis",
    x = NULL, y = "Int$1990",
    caption  = "Sources: authors' calculations (Estonia); Maddison Project Database 2023 (Finland)."
  ) +
  theme_paper()

save_fig(p_f6, "F6_finland.pdf", w = 7.5, h = 4.5)

# =============================================================================
# FIGURE 7: Interwar GDP per capita comparison, 1913/1919-1939
# Reference: fig:fgdppc
# =============================================================================

df_f7 <- rbind(
  data.frame(year = years_iw,
             gdp  = as.numeric(ee_gdp90[as.character(years_iw)]),
             country = "Estonia",        stringsAsFactors = FALSE),
  data.frame(year = years_iw,
             gdp  = as.numeric(fin_gdp90[as.character(years_iw)]),
             country = "Finland",        stringsAsFactors = FALSE),
  data.frame(year = years_iw, gdp = lv_gdp90, country = "Latvia",
             stringsAsFactors = FALSE),
  data.frame(year = years_iw, gdp = lt_gdp90, country = "Lithuania",
             stringsAsFactors = FALSE),
  data.frame(year = years_iw, gdp = cz_gdp90, country = "Czechoslovakia",
             stringsAsFactors = FALSE),
  data.frame(year = years_iw, gdp = pl_gdp90, country = "Poland",
             stringsAsFactors = FALSE),
  data.frame(year = years_iw, gdp = hu_gdp90, country = "Hungary",
             stringsAsFactors = FALSE),
  data.frame(year = years_iw, gdp = at_gdp90, country = "Austria",
             stringsAsFactors = FALSE)
)

f7_cols  <- c("Estonia" = col_estonia, "Finland" = col_finland,
               "Latvia" = col_latvia, "Lithuania" = "#0f766e",
               "Czechoslovakia" = "#7c3aed", "Poland" = "#dc2626",
               "Hungary" = "#ea580c", "Austria" = "#78716c")
f7_types <- c("Estonia" = "solid", "Finland" = "solid",
               "Latvia" = "solid", "Lithuania" = "solid",
               "Czechoslovakia" = "longdash", "Poland" = "longdash",
               "Hungary" = "longdash", "Austria" = "longdash")

p_f7 <- ggplot(df_f7, aes(x = year, y = gdp, colour = country,
                           linetype = country)) +
  geom_line(linewidth = 0.65) +
  scale_colour_manual(values = f7_cols,  name = NULL) +
  scale_linetype_manual(values = f7_types, name = NULL) +
  scale_y_continuous(labels = comma) +
  scale_x_continuous(breaks = c(1913, seq(1920, 1939, 5)),
                     minor_breaks = years_iw) +
  labs(
    title    = "GDP per capita in Eastern and Northern Europe, 1913 and 1919\u20131939",
    subtitle = "International dollars, 1990 Geary-Khamis",
    x = NULL, y = "Int$1990",
    caption  = "Source: Maddison Project Database 2023; authors' calculations (Estonia)."
  ) +
  theme_paper() +
  guides(colour   = guide_legend(ncol = 4),
         linetype = guide_legend(ncol = 4))

save_fig(p_f7, "F7_fgdppc.pdf", w = 8.5, h = 5.0)

# =============================================================================
# FIGURE 8: Trade to GDP ratios, 1919-1939
# Reference: fig:trade
# =============================================================================

df_f8 <- rbind(
  data.frame(year = years_trade, ratio = trade_ee, country = "Estonia",
             stringsAsFactors = FALSE),
  data.frame(year = years_trade, ratio = trade_fi, country = "Finland",
             stringsAsFactors = FALSE),
  data.frame(year = years_trade, ratio = trade_lv, country = "Latvia",
             stringsAsFactors = FALSE),
  data.frame(year = years_trade, ratio = trade_dk, country = "Denmark",
             stringsAsFactors = FALSE),
  data.frame(year = years_trade, ratio = trade_no, country = "Norway",
             stringsAsFactors = FALSE),
  data.frame(year = years_trade, ratio = trade_se, country = "Sweden",
             stringsAsFactors = FALSE)
)
df_f8 <- df_f8[!is.na(df_f8$ratio), ]

f8_cols  <- c("Estonia" = col_estonia, "Finland" = col_finland,
               "Latvia" = col_latvia, "Denmark" = "#7c3aed",
               "Norway" = "#0f766e", "Sweden" = "#ea580c")
f8_types <- c("Estonia" = "solid", "Finland" = "solid",
               "Latvia" = "solid", "Denmark" = "longdash",
               "Norway" = "longdash", "Sweden" = "longdash")

p_f8 <- ggplot(df_f8, aes(x = year, y = ratio * 100,
                           colour = country, linetype = country)) +
  geom_line(linewidth = 0.65) +
  scale_colour_manual(values = f8_cols,  name = NULL) +
  scale_linetype_manual(values = f8_types, name = NULL) +
  scale_y_continuous(labels = function(x) paste0(x, "%")) +
  scale_x_continuous(breaks = seq(1919, 1939, 4)) +
  labs(
    title    = "Trade openness (exports + imports as % of GDP), 1919\u20131939",
    subtitle = "Estonia, Finland, Latvia, Denmark, Norway, and Sweden",
    x = NULL, y = "% of GDP",
    caption  = "Source: Datasheets/Trade to GDP 1919-1940.csv."
  ) +
  theme_paper()

save_fig(p_f8, "F8_trade.pdf", w = 8.5, h = 5.0)

message("\n=== All 8 figures written to Figures/estonia/ ===")
