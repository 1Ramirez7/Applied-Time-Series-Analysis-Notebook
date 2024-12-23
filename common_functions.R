# Load packages ----


if (!require("pacman")) install.packages("pacman")
pacman::p_load(tidyverse,
               tsibble, 
               tsibbledata,
               fable,
               fable.prophet,
               feasts,
               patchwork,
               lubridate,
               rio,
               ggplot2,
               kableExtra, 
               tidyquant,
               plotly)
               




# display_partial_table


row_of_vdots <- function(df) {
  temp_df <- df |>
    # mutate(across(everything(), as.character)) |>
    head(1)
  
  for (j in 1:ncol(temp_df)) {
    if (names(temp_df[j]) == "sign") {
      temp_df[1,j] = " "
    } else {
      temp_df[1,j] = "⋮"
    }
  } # for
  
  return(temp_df)
}


convert_df_to_char <- function(df, decimals = 3) {
  out_df <- df |>
    as.data.frame() |>
    mutate_if(is.numeric, round, digits=decimals) |>
    mutate(across(everything(), as.character))
  return(out_df)
}

concat_partial_table <- function(df, nrow_head, nrow_tail, decimals = 3) {
  temp_df <- convert_df_to_char(df, decimals)
  
  out_df <- head(temp_df, nrow_head) |>
    bind_rows(row_of_vdots(temp_df)) |>
    bind_rows(tail(temp_df, nrow_tail))
  
  return(out_df)
}

display_table <- function(df, min_col_width = "0in") {
  df |>
    knitr::kable(format = "html", align='ccccccccccccccccc', escape = FALSE, width = NA, row.names = FALSE) |>
    kable_styling(full_width = FALSE, "striped") |>
    column_spec(1:ncol(df), width_min = min_col_width)
}

display_partial_table <- function(df, nrow_head, nrow_tail, decimals = 3, min_col_width = "0in") {
  concat_partial_table(df, nrow_head, nrow_tail, decimals) |>
    display_table(min_col_width)
}





