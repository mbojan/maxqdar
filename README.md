`maxqdar` – Interfacing MAXQDA’s exchange files with R
================

<!-- badges: start -->

[![R-CMD-check](https://github.com/mbojan/maxqdar/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mbojan/maxqdar/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

# Installation

``` r
devtools::install_github("mbojan/maxqdar")
```

# Usage

Extracting coded fragments as a data frame with start and end character
positions:

``` r
library(maxqdar)
f <- system.file("exdata/test.mex", package="maxqdar")
extract_mex_codings(f)
```

    ## Warning in extract_mex_codings(f): number of preview strings 63 chars long = 17

    ## # A tibble: 402 × 9
    ##       ID TextID WordID Preview                 start   end file_…¹ tag   previ…²
    ##    <int>  <int>  <int> <chr>                   <int> <int> <chr>   <chr>   <int>
    ##  1     1      2      8 AVISO                      30    35 0_229   TYPE        5
    ##  2     2      2      7 secretário de estado,      39    61 0_229   ROLE       21
    ##  3     3      2      5 Diogo de Mendonça Cort…    61    90 0_229   PERS…      28
    ##  4     4      2      5 Aires de Saldanha de A…   123   155 0_229   PERS…      32
    ##  5     5      2      5 José de Sousa Valdez      254   274 0_229   PERS…      20
    ##  6     6      2      5 Lucas Ribeiro de Almei…   392   417 0_229   PERS…      24
    ##  7     7      2      7 capitão-mor de Vila Re…   366   392 0_229   ROLE       25
    ##  8     8      2      7 governador do Rio de J…    93   121 0_229   ROLE       28
    ##  9     9      2      7 soldados                  311   319 0_229   ROLE        8
    ## 10    10      2      4 1722, Maio, 28              7    21 0_229   DATE       14
    ## # … with 392 more rows, and abbreviated variable names ¹​file_name,
    ## #   ²​preview_length

-   **CAUTION**: The `Preview` column provides at most 63-character long
    part of the coded string. If the limit is reached the function gives
    a warning.

# License

GPL-3
