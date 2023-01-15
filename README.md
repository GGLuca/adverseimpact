
<!-- README.md is generated from README.Rmd. Please edit that file -->

# advserseimpact

<!-- badges: start -->
<!-- badges: end -->

The goal of advserseimpact is to compute a number of important
statistical indicators of adverse impact in selection decisions.

The package computes a total of 6 indicators in 2 large categories:

statistical significance measures: the Z-test, and the LMP (Lancaster’s
Mid-P) test, and

practical significance measures: the h-statistic, the Phi-coefficient,
the SF (ShortFall) statistic, and the impact ratio.

Input in the function is the 2x2 minority-majority selection matrix,
containing 4 values: NPmin (number of participants passing the selection
procedure from the minority group), NPmaj (number of participants
passing the selection procedure from the majority group), NFmin (number
of participants failing the selection procedure from the minority
group), NFmaj (number of participants failing the selection procedure
from the majority group).

## Installation

You can install the development version of advserseimpact from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("GGLuca/adverseimpact")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(advserseimpact)
## basic example code
```
