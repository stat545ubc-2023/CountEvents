<!-- README.md is generated from README.Rmd. Please edit that file -->

# CountEvents

The goal of `CountEvents` is to take a data frame or Tibble, and two variable names as argument.

It performs data validation, filtering out rows with missing values. Then, counts the number of events in the data, grouped by the two specified variables, and returns the result as a data frame

## Installation

You can install the development version of `CountEvents` from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2023/CountEvents")
```

## Example

This is a basic example which shows you how to use `CountEvents`:

``` r
library(CountEvents)
library(palmerpenguins)
suppressPackageStartupMessages(library(dplyr))
#> Warning: package 'dplyr' was built under R version 4.3.2


### *Using the penguins data*

# How many penguins of each species per island in the data??
specie_by_island <- count_events(penguins, species, island)
print(specie_by_island)
#> # A tibble: 5 × 3
#>   species   island    count
#>   <fct>     <fct>     <int>
#> 1 Adelie    Biscoe       44
#> 2 Adelie    Dream        55
#> 3 Adelie    Torgersen    47
#> 4 Chinstrap Dream        68
#> 5 Gentoo    Biscoe      119
```
