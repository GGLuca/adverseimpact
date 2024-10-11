#' Adjusted Shortfall
#'
#' @param NFmin Number of participants failing the selection procedure from the minority group
#' @param NPmin Number of participants passing the selection procedure from the minority group
#' @param NFmaj number of participants failing the selection procedure from the majority group
#' @param NPmaj Number of participants passing the selection procedure from the majority group
#'
#' @return A numeric value representing the adjusted shortfall (SFadj) calculated as the
#'   shortfall (SF) divided by the total number of minority applicants (Nmin).
#'
#' @export
#'
#' @examples
#' # Example data
#' NFmin <- 10 # Number of participants failing the selection procedure from the minority group
#' NPmin <- 5  # Number of participants passing the selection procedure from the minority group
#' NFmaj <- 30 # Number of participants failing the selection procedure from the majority group
#' NPmaj <- 15 # Number of participants passing the selection procedure from the majority group
#'
#' # Calculate the adjusted shortfall
#' result <- ai_sfadj(NFmin, NPmin, NFmaj, NPmaj)
#' result

ai_sfadj <- function(NFmin, NPmin, NFmaj, NPmaj) {
  # Computing shortfall
  SF <- as.numeric(ai_sf(NFmin, NPmin, NFmaj, NPmaj))

  # Calculate the adjusted shortfall (SFadj) by dividing the shortfall (SF) by the total number of minority applicants (Nmin)
  SFadj <- SF / (NPmaj + NPmin)

  return(data.frame(ASF = SFadj))
}
