#' Calculate Odds Ratio
#'
#' This function takes the selection rates of two groups (e.g., men and women)
#' and calculates the odds ratio.
#'
#' The algorithm used in this function is based on the method described in:
#' Oswald, F.L., Dunleavy, E.M., & Shaw, A. (2017). Measuring practical significance in adverse
#' impact analysis. In S.B. Morris & E.M. Dunleavy (Eds.), Adverse Impact Analysis:
#' Understanding Data, Statistics, and Risk (p. 105). Routledge.
#'
#' @param p1 Selection rate for the first group (e.g., men)
#' @param p2 Selection rate for the second group (e.g., women)
#'
#' @return The odds ratio, a measure of association between the selection rates of two groups.
#'
#' @examples
#' # For men with a selection rate of 75% and women with a selection rate of 60%
#' p1 <- 0.75
#' p2 <- 0.60
#' odds_ratio <- ai_or(p1, p2)
#' print(odds_ratio)
#'
#' @export
ai_or <- function(p1, p2) {
  # Calculate odds for each group
  odds_g1 <- p1 / (1 - p1)
  odds_g2 <- p2 / (1 - p2)

  # Calculate and return the odds ratio
  odds_ratio <- odds_g1 / odds_g2
  return(odds_ratio)
}
