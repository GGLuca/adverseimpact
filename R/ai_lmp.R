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
#' @return A numeric value representing the LMP test statistic
#' @export
#'
#' @examples
#' NFmin <- 25
#' NPmin <- 75
#' NFmaj <- 100
#' NPmaj <- 300
#' ai_lmp(NFmin, NPmin, NFmaj, NPmaj)

ai_lmp <- function(NFmin, NPmin, NFmaj, NPmaj) {
  # Calculate the total number of minority and majority group members
  Nmin <- NFmin + NPmin
  Nmaj <- NFmaj + NPmaj
  NPt  <- NPmin + NPmaj

  # Calculate the Fisher's Exact Test statistic (FEThyp)
  FEThyp <- 0
  for (i in 0:NPmin) {
    FEThyp <- FEThyp + dhyper(NPmaj + i, Nmaj, Nmin, NPt)
  }
  FEThyp <- FEThyp * 2

  # Calculate the LMP test statistic
  LMPhyp <- dhyper(NPmaj, Nmaj, Nmin, NPt)
  LMP <- FEThyp - LMPhyp / 2

  return(LMP)
}
