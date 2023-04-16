#' Fisher's Exact Test (FET) for Selection Procedure Outcomes
#'
#' This function calculates Fisher's Exact Test (FET) for a 2x2 contingency table representing selection procedure outcomes
#' for minority and majority groups. It helps to assess the statistical significance of the association between group membership
#' and selection outcomes.
#'
#' @param NFmin Number of participants failing the selection procedure from the minority group
#' @param NPmin Number of participants passing the selection procedure from the minority group
#' @param NFmaj Number of participants failing the selection procedure from the majority group
#' @param NPmaj Number of participants passing the selection procedure from the majority group
#'
#' @return A list containing the Fisher's Exact Test results (p-value and odds ratio).
#' @export
#'
#' @examples
#' # Example data
#' NFmin <- 10 # Number of participants failing the selection procedure from the minority group
#' NPmin <- 5  # Number of participants passing the selection procedure from the minority group
#' NFmaj <- 30 # Number of participants failing the selection procedure from the majority group
#' NPmaj <- 15 # Number of participants passing the selection procedure from the majority group
#'
#' # Calculate Fisher's Exact Test results
#' result <- ai_fisher(NFmin, NPmin, NFmaj, NPmaj)
#' result

ai_fisher <- function(NFmin, NPmin, NFmaj, NPmaj) {

  # Calculate the total number of observations in each group
  Nmin   <- NFmin + NPmin
  Nmaj   <- NFmaj + NPmaj

  # Calculate the cumulative probability of getting a certain number of
  # successes in the minor group or more, under the null hypothesis
  FEThyp <- 0;
  for (i in 0:NPmin) {
    FEThyp <- FEThyp + stats::dhyper(NPmaj + i, Nmaj, Nmin, NPmin+NPmaj)
  } ## Computes FET one-tailed

  # Multiply by 2 for the two-tailed case
  FEThyp <- FEThyp*2

  # Calculate the probability of getting the observed number of successes
  # in the minor group under the null hypothesis
  LMPhyp <- stats::dhyper(NPmaj, Nmaj, Nmin, NPmin+NPmaj)

  # Calculate the LMP (logarithm of the odds ratio)
  LMP    <- FEThyp-LMPhyp/2

  # Return the LMP
  return(LMP)
}
