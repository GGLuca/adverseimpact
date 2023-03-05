
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

The data in this example stems from

In this selection scenario, we take into account the disparity between
male and female hires, with women being designated as the minority
group. Out of 35 applicants, 10 are women and 25 are men. Among the
female candidates, 2 are chosen and 8 are not, while 15 of the male
candidates are selected and 10 are not. Therefore, a total of 17
candidates are chosen and 18 are not.

As such,

`NFmin` = 9, `NPmin` = 2, `NFmaj` = 10, `NPmaj` = 15

``` r
library(advserseimpact)
## basic example code
```
