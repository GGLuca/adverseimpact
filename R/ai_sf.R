#' Title
#'
#' @param NFmin
#' @param NPmin
#' @param NFmaj
#' @param NPmaj
#'
#' @return
#' @export
#'
#' @examples
ai_sf<- function(NFmin, NPmin, NFmaj, NPmaj) {
  # Compute the marginal sum for the 2x2 contingency table
  Nmin <- NFmin + NPmin    # number of occurrences of the first event in the first group

  # Compute the SF value
  SF <- ceiling(NPmaj / (NFmaj + NPmaj) * Nmin) - NPmin   # SF calculation using the provided formula

  # Return the SF value as output
  return(SF)
}
