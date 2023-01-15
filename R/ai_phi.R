ai_phi <- function(NFmin, NPmin, NFmaj, NPmaj) {
  # Compute the marginal sums for the 2x2 contingency table
  Nmin <- NFmin + NPmin    # number of occurrences of the first event in the first group
  Nmaj <- NFmaj + NPmaj    # number of occurrences of the first event in the second group

  # Compute the Phi coefficient
  Phi <- (NFmin*NPmaj - NFmaj*NPmin) / sqrt((NFmin + NFmaj)*(NPmin + NPmaj)*(NFmin + NPmin)*(NFmaj + NPmaj))  # numerator of Phi

  # Return the Phi coefficient as output
  return(Phi)
}
