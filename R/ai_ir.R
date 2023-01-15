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
ai_ir <- function(NFmin, NPmin, NFmaj, NPmaj){
  Nmin <- NFmin + NPmin
  Nmaj <- NFmaj + NPmaj

  SRmin <- NPmin / Nmin
  SRmaj <- NPmaj / Nmaj
  IR <- SRmin / SRmaj
  return(IR)
}
