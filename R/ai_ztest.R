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
#' @importFrom stats dhyper
#' @return A data frame containing the z-score and associated p-value (Two-tailed and One-tailed).
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
  #NFmin <- 10;  NPmin <- 5;  NFmaj <- 30; NPmaj <- 15

  # Extract total statistics
  ts <- ai_tot(NFmin, NPmin, NFmaj, NPmaj)

  # Calculate the Z-score using the formula
  z <- (ts$Pmin - ts$Pmaj) / sqrt(ts$Ptot * (1 - ts$Ptot) * ((1 / ts$Nmin) + (1 / ts$Nmaj)))

  # Calculate the p-value assuming a two-tailed and one-tailed test
  p_2 <- 2 * (1 - pnorm(abs(z))); p_1 <- 1 * (1 - pnorm(abs(z)))

  # Return the Z-score and p-value as a dataframe
  return(data.frame(z_score = z,
                    p_value = c(p_2, p_1),
                    tails = c("Two-tailed", "One-tailed")))
}


