#' Compute the Fisher's Exact Test (FET) Statistic
#'
#' This function calculates the Fisher's Exact Test (FET) statistic, a measure used
#' in adverse impact analysis. The FET is a statistical test used to determine if
#' there are nonrandom associations between two categorical variables.
#'
#' @param NFmin The number of non-favored outcomes for the minority group
#' @param NPmin The number of favored outcomes for the minority group
#' @param NFmaj The number of non-favored outcomes for the majority group
#' @param NPmaj The number of favored outcomes for the majority group
#'
#' @return A dataframe representing the FET statistic (One-tailed on;y).
#' @export
#'
#' @examples
#' NFmin <- 25
#' NPmin <- 75
#' NFmaj <- 100
#' NPmaj <- 300
#' ai_fet(NFmin, NPmin, NFmaj, NPmaj)
#'
#' @importFrom stats dhyper
ai_fet <- function(NFmin, NPmin, NFmaj, NPmaj) {
  #NFmin <- 10;  NPmin <- 5;  NFmaj <- 30; NPmaj <- 15

  # Extract total statistics
  ts <- ai_tot(NFmin, NPmin, NFmaj, NPmaj)

  # Calculate the Fisher's Exact Test statistic (FEThyp)
  FEThyp <- 0
  for (i in 0:NPmin) {
    FEThyp <- FEThyp + dhyper(NPmaj + i, ts$Nmaj, ts$Nmin, ts$Npas)
  }

  # Calculate p-value (only One-tailed)
  p_1 <- FEThyp
  return(data.frame(FEThyp = FEThyp, p_value = p_1, tails = "One-tailed"))
}
