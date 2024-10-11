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
#' @return A numeric value representing the FET statistic (Two-tailed and One-tailed).
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
  # Calculate the total number of minority and majority group members
  Nmin <- NFmin + NPmin
  Nmaj <- NFmaj + NPmaj
  NPt <- NPmin + NPmaj

  # Calculate the Fisher's Exact Test statistic (FEThyp)
  FEThyp <- 0
  for (i in 0:NPmin) {
    FEThyp <- FEThyp + dhyper(NPmaj + i, Nmaj, Nmin, NPt)
  }

  # Calculate p-value (Two-tailed and One-tailed)
  p_value_2 <- FEThyp * 2; p_value_1 <- FEThyp

  ret.val <- data.frame(FEThyp = FEThyp,
                        p_value = c(p_value_2, p_value_1),
                        tails = c("Two-tailed", "One-tailed"))
  return(ret.val)
}
