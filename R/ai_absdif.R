#' Calculate Absolute Difference in Selection Rates
#'
#' This function calculates the absolute difference in selection rates between two subgroups.
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
#'
#' @return The absolute difference between the selection rates of the two groups
#'
#' @examples
#' # For men with a selection rate of 75% and women with a selection rate of 60%
#' NFmin <- 10 # Number of participants failing the selection procedure from the minority group
#' NPmin <- 5  # Number of participants passing the selection procedure from the minority group
#' NFmaj <- 30 # Number of participants failing the selection procedure from the majority group
#' NPmaj <- 15 # Number of participants passing the selection procedure from the majority group
#' absolute_difference <- ai_absdif(p1, p2)
#' print(absolute_difference)
#'
#' @export
ai_absdif <- function(NFmin, NPmin, NFmaj, NPmaj) {
  Nmin <- NFmin + NPmin ; Nmaj <- NFmaj + NPmaj
  p1 <- NPmin / Nmin ;p2 <- NPmaj / Nmaj
  # Calculate and return the absolute difference in selection rates
  absolute_difference <- abs(p1 - p2)
  return(data.frame(ADIFF = absolute_difference))
}
