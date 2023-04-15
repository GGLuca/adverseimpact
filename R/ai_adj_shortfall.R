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
#' result <- ai_shortfall(NFmin, NPmin, NFmaj, NPmaj)
#' result

ai_shortfall <- function(NFmin, NPmin, NFmaj, NPmaj) {
  # Calculate the total number of minority (Nmin) and majority (Nmaj) applicants
  Nmin <- NFmin + NPmin
  Nmaj <- NFmaj + NPmaj

  # Calculate the selection rate for the majority group (SRmaj)
  SRmaj <- NPmaj / Nmaj

  # Calculate the expected number of selected minority applicants based on the majority group's selection rate
  expected_min_selected <- ceiling(SRmaj * Nmin)

  # Calculate the shortfall (SF) by subtracting the actual number of selected minority applicants (NPmin)
  # from the expected number of selected minority applicants (based on the majority group's selection rate)
  SF <- expected_min_selected - NPmin

  # Calculate the adjusted shortfall (SFadj) by dividing the shortfall (SF) by the total number of minority applicants (Nmin)
  SFadj <- SF / (NFmin + NPmin)

  return(SFadj)
}
