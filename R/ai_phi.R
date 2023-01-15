#' Title
#'
#' @param NFmin Number of participants failing the selection procedure from the minority group
#' @param NPmin Number of participants passing the selection procedure from the minority group
#' @param NFmaj number of participants failing the selection procedure from the majority group
#' @param NPmaj Number of participants passing the selection procedure from the majority group
#'
#' @return A vector containing the result
#' @export
#'
#' @examples
ai_phi <- function(NFmin, NPmin, NFmaj, NPmaj) {
  # Compute the marginal sums for the 2x2 contingency table
  Nmin <- NFmin + NPmin    # number of occurrences of the first event in the first group
  Nmaj <- NFmaj + NPmaj    # number of occurrences of the first event in the second group

  # Compute the Phi coefficient
  Phi <- (NFmin*NPmaj - NFmaj*NPmin) / sqrt((NFmin + NFmaj)*(NPmin + NPmaj)*(NFmin + NPmin)*(NFmaj + NPmaj))  # numerator of Phi

  # Return the Phi coefficient as output
  return(Phi)
}
