
<!-- README.md is generated from README.Rmd. Please edit that file -->

# advserseimpact

<!-- badges: start -->
<!-- badges: end -->

## Goal

The goal of advserseimpact is to compute a number of important
statistical indicators of adverse impact in selection decisions. The
package containts functions that compute a total of 6 indicators in 2
large categories:

1.  Statistical significance measures: the Z-test, and the LMP
    (Lancaster’s Mid-P) test, and

2.  Practical significance measures: the h-statistic, the
    Phi-coefficient, the SF (ShortFall) statistic, and the impact ratio.

The functions require the 2x2 minority-majority selection matrix,
containing 4 values:

- `NPmin` (number of participants passing the selection procedure from
  the minority group),
- `NPmaj` (number of participants passing the selection procedure from
  the majority group),
- `NFmin` (number of participants failing the selection procedure from
  the minority group),
- `NFmaj` (number of participants failing the selection procedure from
  the majority group).

## Installation

You can install the development version of advserseimpact from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("GGLuca/adverseimpact")
```

## Example

We consider a selection scenario in which disparity is considered
between men and women hires. Women are designated as the minority group.
A total of 35 applicants participate, out of which 10 women and 25 men.
From the female candidates, 2 are selected and 8 are rejected, and from
the male candidates 15 are selected and 10 are rejected. A total of 17
candidates are thus selected, and 18 are rejected.

In this case,

`NFmin` = 9, `NPmin` = 2, `NFmaj` = 10, `NPmaj` = 15

``` r
library(advserseimpact)
## basic example code
```
