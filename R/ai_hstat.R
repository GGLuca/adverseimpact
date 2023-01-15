#' Title
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
