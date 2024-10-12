#' Compute the LMP Test Statistic
#'
#' This function calculates the LMP test statistic, which is a measure used in
#' adverse impact analysis. The LMP test is based on the Fisher's Exact Test.
#'
#' @param NFmin The number of non-favored outcomes for the minority group
#' @param NPmin The number of favored outcomes for the minority group
#' @param NFmaj The number of non-favored outcomes for the majority group
#' @param NPmaj The number of favored outcomes for the majority group
#'
#' @return A dataset representing the LMP test statistic (One-tailed only)
#' @export
#'
#' @examples
#' #'
#' NFmin <- 25
#' NPmin <- 75
#' NFmaj <- 100
#' NPmaj <- 300
#' ai_lancaster(NFmin, NPmin, NFmaj, NPmaj)
#'
ai_lancaster <- function(NFmin, NPmin, NFmaj, NPmaj) {
  #NFmin <- 10;  NPmin <- 5;  NFmaj <- 30; NPmaj <- 15

  # Extract total statistics
  ts <- ai_tot(NFmin, NPmin, NFmaj, NPmaj)

  # Computing Fisher exact tests
  FET <- ai_fet(NFmin, NPmin, NFmaj, NPmaj)

  # Calculate the LMP test statistic
  LMPhyp <- dhyper(NPmaj, ts$Nmaj, ts$Nmin, ts$Npas)
  LMPhyp <- FET$FEThyp - LMPhyp / 2

  return(data.frame(LMPhyp = LMPhyp, p_value = LMPhyp, tails = "One-tailed"))
}
