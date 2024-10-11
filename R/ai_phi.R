#' Calculate the Phi Coefficient
#'
#' This function calculates the Phi coefficient, a measure of association between two binary variables.
#' In this context, the Phi coefficient represents the association between group membership (minority or majority)
#' and selection outcome (pass or fail).
#'
#' @param NFmin Number of participants failing the selection procedure from the minority group
#' @param NPmin Number of participants passing the selection procedure from the minority group
#' @param NFmaj Number of participants failing the selection procedure from the majority group
#' @param NPmaj Number of participants passing the selection procedure from the majority group
#'
#' @return A numeric value representing the Phi coefficient.
#' @export
#'
#' @examples
#' # Example data
#' NFmin <- 10 # Number of participants failing the selection procedure from the minority group
#' NPmin <- 5  # Number of participants passing the selection procedure from the minority group
#' NFmaj <- 30 # Number of participants failing the selection procedure from the majority group
#' NPmaj <- 15 # Number of participants passing the selection procedure from the majority group
#'
#' # Calculate the Phi coefficient
#' result <- ai_phi(NFmin, NPmin, NFmaj, NPmaj)
#' result

ai_phi <- function(NFmin, NPmin, NFmaj, NPmaj) {
  # Compute the marginal sums for the 2x2 contingency table
  #Nmin <- NFmin + NPmin    # number of occurrences of the first event in the first group
  #Nmaj <- NFmaj + NPmaj    # number of occurrences of the first event in the second group

  phi.1 = (NFmin * NPmaj - NFmaj*NPmin)
  phi.2 = sqrt(NFmin + NFmaj)
  phi.3 = sqrt(NPmin + NPmaj)
  phi.4 = sqrt(NFmin + NPmin)
  phi.5 = sqrt(NFmaj + NPmaj)
  Phi = phi.1 / phi.2
  Phi = Phi / phi.3;  Phi = Phi / phi.4; Phi = Phi / phi.5
  # Compute the Phi coefficient
  #Phi <- (NFmin*NPmaj - NFmaj*NPmin) / sqrt((NFmin + NFmaj)*(NPmin + NPmaj)*(NFmin + NPmin)*(NFmaj + NPmaj))  # numerator of Phi

  # Return the Phi coefficient as output
  return(data.frame(Phi = Phi))
}
