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
