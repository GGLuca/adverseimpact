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
#' @return The a dataframe with computed Chi-square statistic and associated probability level (Two-tailed and One-tailed).
#' @importFrom stats pchisq
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
#' result <- ai_chi(NFmin, NPmin, NFmaj, NPmaj)
#' result
#'
ai_chi <- function(NFmin, NPmin, NFmaj, NPmaj) {
  #NFmin <- 10;  NPmin <- 5;  NFmaj <- 30; NPmaj <- 15

  # Extract total statistics
  ts <- ai_tot(NFmin, NPmin, NFmaj, NPmaj)

  chi.1 = ts$Ntot * (NFmin * NPmaj - NFmaj * NPmin) ^ 2
  chi.2 = ts$Nmin * ts$Nmaj;   chi.3 = ts$Npas * ts$Nfai
  ChiSq = chi.1 / chi.2; ChiSq = ChiSq / chi.3

  # Calculate p-value (Two-tailed and One-tailed at 1 df)
  p_2 <- 1 - pchisq(ChiSq, 1); p_1 <- 1 - pchisq(ChiSq, 1) / 2

  return(data.frame(ChiSq = ChiSq,
                    p_value = c(p_2, p_1),
                    tails = c("Two-tailed", "One-tailed")))
}
