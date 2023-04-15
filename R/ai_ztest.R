#' Z-score and p-value for a two-sample proportion test
#'
#' This function calculates the Z-score and associated p-value for a two-sample proportion test
#' comparing the selection rates between minority and majority groups. The test helps assess
#' if there is a significant difference in the selection rates of the two groups.
#'
#' @param NFmin Number of participants failing the selection procedure from the minority group
#' @param NPmin Number of participants passing the selection procedure from the minority group
#' @param NFmaj Number of participants failing the selection procedure from the majority group
#' @param NPmaj Number of participants passing the selection procedure from the majority group
#'
#' @return A data frame containing the z-score and associated p-value.
#' @export
#'
#' @examples
#' # Example data
#' NFmin <- 10 # Number of participants failing the selection procedure from the minority group
#' NPmin <- 5  # Number of participants passing the selection procedure from the minority group
#' NFmaj <- 30 # Number of participants failing the selection procedure from the majority group
#' NPmaj <- 15 # Number of participants passing the selection procedure from the majority group
#'
#' # Perform the two-sample proportion test
#' result <- ai_ztest(NFmin, NPmin, NFmaj, NPmaj)
#' result

ai_ztest <- function(NFmin, NPmin, NFmaj, NPmaj) {

  # calculate the total sample size of the minority group and majority group
  Nmin <- NFmin + NPmin # number of individuals in the minority group
  Nmaj <- NFmaj + NPmaj # number of individuals in the majority group

  # calculate the proportion of individuals with the feature in the minority and majority groups
  p1 <- NPmin / Nmin # proportion of individuals with feature in minority group
  p2 <- NPmaj / Nmaj # proportion of individuals with feature in majority group

  # calculate overall proportion of individuals with the feature
  p <- (NPmin + NPmaj) / (Nmin + Nmaj)

  # calculate the Z-score using the formula
  z <- (p1 - p2) / sqrt(p * (1 - p) * ((1/Nmin) + (1/Nmaj)))

  # calculate the p-value assuming a two-tailed test
  p_value <- 2 * (1 - pnorm(abs(z)))

  # return the Z-score and p-value as a list
  return(data.frame(z_score = z, p_value = p_value))
}
