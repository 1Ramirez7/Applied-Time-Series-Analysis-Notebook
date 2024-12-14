---
title: "Linear Models, GLS, and Seasonal Indicator Variables"
subtitle: "Ch 5.1 Code Notes"
format: 
  html:
    error: false
    message: false
    warning: false
    embed-resources: true
    toc: true
    code-fold: false
---






transfer from chapter_5_lesson_1_notes.qmd old repo

notes taken during class




::: {.cell}

```{.r .cell-code}
# Loading R packages
if (!require("pacman")) install.packages("pacman")
pacman::p_load(tidyverse,
               tsibble, fable,
               feasts, tsibbledata,
               fable.prophet,
               patchwork,
               lubridate,
               rio,
               ggplot2,
               kableExtra
               )
```
:::

::: {.cell}

```{.r .cell-code}
chocolate_month2 <- rio::import("https://byuistats.github.io/timeseries/data/chocolate.csv") |>
  mutate(
    dates = yearmonth(ym(Month)),
    month = month(dates),
    year = year(dates),
    stats_time = year + (month - 1) / 12,
    month_seq = 1:n()
  ) |>
  mutate(month = factor(month)) |>
  as_tsibble(index = dates)

# Fit regression model
chocolate_lm <- chocolate_month2 |>
  model(TSLM(chocolate ~ 0 + stats_time + month))

# Estimated parameter values
param_est <- chocolate_lm |>
  tidy() |>
  pull(estimate)

param_est
```

::: {.cell-output .cell-output-stdout}

```
 [1]     1.131642 -2227.910370 -2219.304673 -2233.148977 -2233.443280
 [6] -2234.837584 -2237.931887 -2236.476190 -2237.370494 -2237.514797
[11] -2232.659101 -2223.003404 -2200.097708
```


:::
:::





when removing 0 + from the tslm function. it makes january as the mt





::: {.cell}

```{.r .cell-code}
chocolate_month2 |> # <- #1 rio::import("https://byuistats.github.io/timeseries/data/chocolate.csv") |>
  mutate(
    dates = yearmonth(ym(Month)),
    month = month(dates),
    year = year(dates),
    stats_time = year + (month - 1) / 12,
    month_seq = 1:n()
  ) |> #2
  mutate(month = factor(month)) |> # factor converts numerical month into categorical levels. eg january = 1. so this parts gets us b1 jan + b2 feb ... + b12 dec. 
  as_tsibble(index = dates)
```

::: {.cell-output .cell-output-stdout}

```
# A tsibble: 240 x 7 [1M]
   Month   chocolate    dates month  year stats_time month_seq
   <chr>       <int>    <mth> <fct> <dbl>      <dbl>     <int>
 1 2004-01        36 2004 Jan 1      2004      2004          1
 2 2004-02        45 2004 Feb 2      2004      2004.         2
 3 2004-03        29 2004 Mar 3      2004      2004.         3
 4 2004-04        32 2004 Apr 4      2004      2004.         4
 5 2004-05        29 2004 May 5      2004      2004.         5
 6 2004-06        26 2004 Jun 6      2004      2004.         6
 7 2004-07        27 2004 Jul 7      2004      2004.         7
 8 2004-08        27 2004 Aug 8      2004      2005.         8
 9 2004-09        29 2004 Sep 9      2004      2005.         9
10 2004-10        33 2004 Oct 10     2004      2005.        10
# ℹ 230 more rows
```


:::

```{.r .cell-code}
# Fit regression model
chocolate_lm <- chocolate_month2 |>
  model(TSLM(chocolate ~ stats_time + month))

# Estimated parameter values
param_est <- chocolate_lm |>
  tidy() |>
  pull(estimate)

param_est
```

::: {.cell-output .cell-output-stdout}

```
 [1] -2227.910370     1.131642     8.605697    -5.238607    -5.532910
 [6]    -6.927214   -10.021517    -8.565821    -9.460124    -9.604428
[11]    -4.748731     4.906965    27.812662
```


:::
:::