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
  # calculating probabilities of passing for each group
  # for minority group
  p1 <- NPmin / (NFmin + NPmin)
  # for majority group
  p2 <- NPmaj / (NFmaj + NPmaj)

  # calculating odds for each group
  # for minority group
  odds_g1 <- p1 / (1 - p1)
  # for majority group
  odds_g2 <- p2 / (1 - p2)

  # calculating odds ratio
  odds_ratio <- odds_g1 / odds_g2

  # returning the odds ratio
  return(data.frame(OR = odds_ratio))
}
