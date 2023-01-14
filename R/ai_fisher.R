#' Fisher's Exact Test (FET)
#'
#' @param NFmin Number of participants failing the selection procedure from the minority group
#' @param NPmin Number of participants passing the selection procedure from the minority group
#' @param NFmaj number of participants failing the selection procedure from the majority group
#' @param NPmaj Number of participants passing the selection procedure from the majority group
#'
#' @return
#' @export
#'
#' @examples
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
