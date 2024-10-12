#' Calculate the Shortfall (SF) Value
#'
#' This function calculates the Shortfall (SF) value, which represents the difference between
#' the expected number of selected minority applicants (based on the majority group's selection rate)
#' and the actual number of selected minority applicants.
#'
#' @param NFmin Number of participants failing the selection procedure from the minority group
#' @param NPmin Number of participants passing the selection procedure from the minority group
#' @param NFmaj Number of participants failing the selection procedure from the majority group
#' @param NPmaj Number of participants passing the selection procedure from the majority group
#'
#' @return A dataset representing the Shortfall (SF) value.
#' @export
#'
#' @examples
#' # Example data
#' NFmin <- 10 # Number of participants failing the selection procedure from the minority group
#' NPmin <- 5  # Number of participants passing the selection procedure from the minority group
#' NFmaj <- 30 # Number of participants failing the selection procedure from the majority group
#' NPmaj <- 15 # Number of participants passing the selection procedure from the majority group
#'
#' # Calculate the Shortfall (SF) value
#' result <- ai_sf(NFmin, NPmin, NFmaj, NPmaj)
#' result

ai_sf<- function(NFmin, NPmin, NFmaj, NPmaj) {
  # Compute the marginal sum for the 2x2 contingency table
  Nmin <- NFmin + NPmin    # number of occurrences of the first event in the first group

  # Compute the SF value
  SF <- ceiling(NPmaj / (NFmaj + NPmaj) * Nmin) - NPmin   # SF calculation using the provided formula

  # Return the SF value as output
  return(data.frame(SF = SF))
}
