#' Calculate the H-Statistic
#'
#' This function calculates the H-Statistic, a measure of the difference between the arcsine-transformed
#' selection rates of minority and majority groups. The H-Statistic is used to assess disparities in
#' selection rates between the two groups.
#'
#' @param NFmin Number of participants failing the selection procedure from the minority group
#' @param NPmin Number of participants passing the selection procedure from the minority group
#' @param NFmaj Number of participants failing the selection procedure from the majority group
#' @param NPmaj Number of participants passing the selection procedure from the majority group
#'
#' @return A numeric value representing the H-Statistic.
#' @export
#'
#' @examples
#' # Example data
#' NFmin <- 10 # Number of participants failing the selection procedure from the minority group
#' NPmin <- 5  # Number of participants passing the selection procedure from the minority group
#' NFmaj <- 30 # Number of participants failing the selection procedure from the majority group
#' NPmaj <- 15 # Number of participants passing the selection procedure from the majority group
#'
#' # Calculate the H-Statistic
#' result <- ai_hstat(NFmin, NPmin, NFmaj, NPmaj)
#' result

ai_hstat <- function(NFmin, NPmin, NFmaj, NPmaj) {

  Nmin   <- NFmin + NPmin
  Nmaj   <- NFmaj + NPmaj
  SRmin  <- NPmin / Nmin
  SRmaj  <- NPmaj / Nmaj

  #calculating the hstat value
  hstat  <- 2*(asin(SRmaj)-asin(SRmin))

  #returning the hstat value
  return(hstat)
}
