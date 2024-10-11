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
#' @return A numeric value representing the LMP test statistic (Two-tailed and One-tailed).
#'
#' @examples
#' NFmin <- 25
#' NPmin <- 75
#' NFmaj <- 100
#' NPmaj <- 300
#' ai_lmp(NFmin, NPmin, NFmaj, NPmaj)

ai_lmp <- function(NFmin, NPmin, NFmaj, NPmaj) {
  NFmin = 20
  NPmin = 98
  NFmaj = 34
  NPmaj = 12

  # Calculate the total number of minority and majority group members
  Nmin <- NFmin + NPmin
  Nmaj <- NFmaj + NPmaj
  NPt  <- NPmin + NPmaj

  FET <- ai_fet(NFmin, NPmin, NFmaj, NPmaj)

  # Calculate the LMP test statistic
  LMPhyp <- dhyper(NPmaj, Nmaj, Nmin, NPt)
  LMP.2 <- FET$FEThyp[1] - LMPhyp
  LMP.1 <- FET$FEThyp[2] - LMPhyp / 2

  # Calculate p-value (Two-tailed and One-tailed)
  p_value_2 <- LMPhyp; p_value_1 <- LMPhyp / 2
  ret.val <- data.frame(LMPhyp = LMP.2,
                        p_value = p_value_2,
                        tails = "Two-tailed")
  ret.val <- rbind(ret.val, c(LMP.1, p_value_1, "One-tailed"))

  return(ret.val)
}
