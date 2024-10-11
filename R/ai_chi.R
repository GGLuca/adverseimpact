#' Chi-square statistic calculation
#'
#' This function calculates the chi-square statistic based on selected and non-selected individuals in two groups
#' (e.g., minority and majority).
#'
#' @param NFmin Number of non-selected individuals in the minority group
#' @param NPmin Number of selected individuals in the minority group
#' @param NFmaj Number of non-selected individuals in the majority group
#' @param NPmaj Number of selected individuals in the majority group
#'
#' @return The computed Chi-square statistic and associated probability level (Two-tailed and One-tailed).
#' @importFrom stats pchisq
#' @export
#'
#' @examples
#' ai_chi(40, 60, 25, 75)
#' ai_chi(1771, 338, 25, 532)
#'
ai_chi <- function(NFmin, NPmin, NFmaj, NPmaj) {
  Nmin <- NFmin + NPmin
  Nmaj <- NFmaj + NPmaj
  NFt  <- NFmin + NFmaj
  NPt  <- NPmin + NPmaj
  N    <- NFt + NPt

  chi.1 = (N * (NFmin * NPmaj - NFmaj * NPmin) ^ 2)
  chi.2 = Nmin * Nmaj;   chi.3 = NPt * NFt
  ChiSq = chi.1 / chi.2; ChiSq = ChiSq / chi.3

#ChiSq  <- (N * (NFmin * NPmaj - NFmaj * NPmin)^2) / (Nmin * Nmaj * NPt * NFt)

  # Calculate p-value (Two-tailed and One-tailed at 1 df)
  p_value_2 <- 1 - pchisq(ChiSq, 1); p_value_1 <- 1 - pchisq(ChiSq, 1) / 2

  ret.val <- data.frame(ChiSq = ChiSq,
                        p_value = c(p_value_2, p_value_1),
                        tails = c("Two-tailed", "One-tailed"))
  return(ret.val)
}
