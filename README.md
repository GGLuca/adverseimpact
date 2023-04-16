
<!-- README.md is generated from README.Rmd. Please edit that file -->

# advserseimpact

<!-- badges: start -->
<!-- badges: end -->

# Description:

This R package provides a suite of functions for assessing adverse
impact in employee selection and hiring procedures. Adverse impact
occurs when a selection procedure disproportionately excludes members of
a protected class, such as race or gender. The package includes
functions to compute statistical tests, such as the Z-test and LMP test,
as well as practical measures, like the h-statistic, Phi-coefficient,
and adjusted shortfall.

By offering a comprehensive set of tools, this package helps
organizations evaluate their selection procedures and make data-driven
decisions to minimize adverse impact and promote fairness in the hiring
process.

Main Functions:

1.  
2.  
3.  
4.  
5.  

# Use Cases

- Human resources professionals evaluating the fairness of their
  selection processes.
- Organizations aiming to reduce adverse impact and promote equal
  opportunity in their hiring practices.
- Researchers studying the impact of selection procedures on different
  demographic groups.

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
