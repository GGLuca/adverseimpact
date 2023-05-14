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
#' @return The computed Chi-square statistic and associated probability level
#' @export
#'
#' @examples
#' ai_chi(40, 60, 25, 75)
#' ai_chi(1771, 338, 25, 532)
#'
ai_chi    <- function(NFmin, NPmin, NFmaj, NPmaj) {
  Nmin    <- NFmin + NPmin
  Nmaj    <- NFmaj + NPmaj
  NFt     <- NFmin + NFmaj
  NPt     <- NPmin + NPmaj
  N       <- NFt + NPt

  ChiSq   <- (N * (NFmin * NPmaj - NFmaj * NPmin)^2) / (Nmin * Nmaj * NPt * NFt)
  return(ChiSq)
}
