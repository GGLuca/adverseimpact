
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

# Some Use Cases

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

The data in this example stems from Morris (2017). In this selection
scenario, we take into account the disparity between male and female
hires, with women being designated as the minority group. Out of 35
applicants, 10 are women and 25 are men. Among the female candidates, 2
are chosen and 8 are not, while 15 of the male candidates are selected
and 10 are not. Therefore, a total of 17 candidates are chosen and 18
are not.

| Group | Fail        | Pass        | Total |
|-------|-------------|-------------|-------|
| Women | 8 (NF_min)  | 2 (NP_min)  | 10    |
| Men   | 10 (NF_maj) | 15 (NP_maj) | 25    |
| Total | 18 (NN_t)   | 17 (NP_t)   | 35    |

``` r
library(advserseimpact)
## basic example code

# Z (Two Standard Deviation) Test
ai_ztest(8, 2, 10, 15)
#>     z_score    p_value
#> 1 -2.138963 0.03243865
```

# References

Morris, S. B. (2017). Statistical significance testing in adverse impact
analysis. In Adverse impact analysis. Routledge.
