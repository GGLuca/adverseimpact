#' AI Odds Ratio Calculation
#'
#' This function calculates the odds ratio between two groups (a minority group and a majority group)
#' based on the number of participants passing or failing a selection procedure.
#'
#' @param NFmin Number of participants failing the selection procedure from the minority group
#' @param NPmin Number of participants passing the selection procedure from the minority group
#' @param NFmaj Number of participants failing the selection procedure from the majority group
#' @param NPmaj Number of participants passing the selection procedure from the majority group
#'
#' @return The odds ratio
#' @export
#'
#' @examples
#' ai_odds(30, 70, 40, 60)
ai_odds <- function(NFmin, NPmin, NFmaj, NPmaj) {
  #NFmin <- 10;  NPmin <- 5;  NFmaj <- 30; NPmaj <- 15

  # Extract total statistics
  ts <- ai_tot(NFmin, NPmin, NFmaj, NPmaj)

  # calculating odds for each group
  odds_g1 <- ts$Pmin / (1 - ts$Pmin)
  odds_g2 <- ts$Pmaj / (1 - ts$Pmaj)

  # calculating odds ratio
  odds_ratio <- odds_g1 / odds_g2

  # returning the odds ratio
  return(data.frame(OR = odds_ratio))
}
