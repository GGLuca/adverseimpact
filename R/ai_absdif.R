#' Calculate Absolute Difference in Selection Rates
#'
#' This function calculates the absolute difference in selection rates between two subgroups.
#'
#' The calculation method was referenced from:
#' Oswald, F.L., Dunleavy, E.M., & Shaw, A. (2017). Measuring practical significance in adverse
#' impact analysis. In S.B. Morris & E.M. Dunleavy (Eds.), Adverse Impact Analysis:
#' Understanding Data, Statistics, and Risk (p. 105). Routledge.
#'
#' @param p1 Selection rate for the first group
#' @param p2 Selection rate for the second group
#'
#' @return The absolute difference between the selection rates of the two groups
#'
#' @examples
#' # For men with a selection rate of 75% and women with a selection rate of 60%
#' p1 <- 0.75
#' p2 <- 0.60
#' absolute_difference <- ai_absdif(p1, p2)
#' print(absolute_difference)
#'
#' @export
ai_absdif <- function(p1, p2) {
  # Calculate and return the absolute difference in selection rates
  absolute_difference <- abs(p1 - p2)
  return(absolute_difference)
}
