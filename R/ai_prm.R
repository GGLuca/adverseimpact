#' Compute the sample and selection parameters and the probability to trigger the Adverse impact
#'
#' This function calculates the overall sample size, Overall selection ratio,
#' Proportion of Minority Group and Minority Selection Ratio parameters and
#' the probability to trigger the Adverse impact related to corresponding indicator at
#'  different effect sizes (Cohen's d 0.00, 0.20, 0.50 and 0.80).
#'
#' The calculation method was referenced from:
#' Oswald, F.L., Dunleavy, E.M., & Shaw, A. (2017). Measuring practical significance in adverse
#' impact analysis. In S.B. Morris & E.M. Dunleavy (Eds.), Adverse Impact Analysis:
#' Understanding Data, Statistics, and Risk (p. 105). Routledge.
#'
#' @param NFmin Number of participants failing the selection procedure from the minority group
#' @param NPmin Number of participants passing the selection procedure from the minority group
#' @param NFmaj Number of participants failing the selection procedure from the majority group
#' @param NPmaj Number of participants passing the selection procedure from the majority group
#' @param ds Monte Carlo simulated dataset with all probability to trigger the Adverse impact
#'
#' @return
#' A dataset with all information related to 0, 0.20, 0.50 and 0.80 effect size
#'
#' @importFrom dplyr filter
#' @export
#' @examples
#' # Example data
#' NFmin <- 10 # Number of participants failing the selection procedure from the minority group
#' NPmin <- 5  # Number of participants passing the selection procedure from the minority group
#' NFmaj <- 30 # Number of participants failing the selection procedure from the majority group
#' NPmaj <- 15 # Number of participants passing the selection procedure from the majority group
#' prm <- ai_prm(NFmin, NPmin, NFmaj, NPmaj)
#' print(prm)
#'
ai_prm <- function(NFmin, NPmin, NFmaj, NPmaj, ds = data("d")) {
  if(!require(dplyr)) install.packages("dplyr")
  library(dplyr)

  # Computing sample and selection parameters
  oss = NFmin + NPmin + NFmaj + NPmaj # Overall Sample Size (N)
  osr = (NPmin + NPmaj) / oss         # Overall Selection Ratio: number of applicants hired/number of applicants applied
  pmg = (NFmin + NPmin) / oss         # Proportion of Minority Group Members: number of minority candidates / overall sample size (Nmin/N)
  msr = NPmin / (NFmin + NPmin)       # Minority Selection Ratio: number of minority applicants hired / number of minority applicants applied (SRmin)

  # Computing categories
  lo = c(10,20,50,100,200,300,500,1000,2000,3000,5000); hi = c(19,49,99,199,299,499,999,1999,2999,4999,9999)
  cat_oss = as.data.frame(cbind(lo, hi))
  lo = c(0.0500,0.1000,0.2000,0.3000,0.5000,0.7000,0.9000); hi = c(0.0999,0.1999,0.2999,0.4999,0.6999,0.8999,0.9999)
  cat_osr = as.data.frame(cbind(lo, hi))
  lo = c(0.0500,0.1000,0.1500,0.2000,0.2500,0.3000,0.3500,0.4000,0.4500); hi = c(0.0999,0.1499,0.1999,0.2499,0.2999,0.3499,0.3999,0.4499,0.5000)
  cat_pmg = as.data.frame(cbind(lo,hi))
  lo = c(0.0100,0.0500,0.1000,0.2000,0.3000,0.4000,0.5000,0.6000,0.7000,0.8000); hi = c(0.0499,0.0999,0.1999,0.2999,0.3999,0.4999,0.5999,0.6999,0.7999,0.8999)
  cat_msr = as.data.frame(cbind(lo, hi))

  # Computing categories
  t.1 <- cat_oss %>% dplyr::filter(hi >= oss, lo <= oss)
  t.1 <- paste("[", t.1$lo, "-", t.1$hi, "]", sep = "")

  t.2 <- cat_osr %>% dplyr::filter(hi >= osr, lo <= osr)
  t.2 <- paste("[", t.2$lo, "-", t.2$hi, "]", sep = "")

  t.3 <- cat_pmg %>% dplyr::filter(hi >= pmg, lo <= pmg)
  t.3 <- paste("[", t.3$lo, "-", t.3$hi, "]", sep = "")

  t.4 <- cat_msr %>% dplyr::filter(hi >= msr, lo <= msr)
  t.4 <- paste("[", t.4$lo, "-", t.4$hi, "]", sep = "")

  # Extracting probabilities and removing dataset
  Prob <- ds %>%dplyr::filter(ti1 == t.1, ti2 == t.2, ti3 == t.3, ti4 == t.4)

  # Returning results
  return(data.frame(Prob))
}
