#' Computes the
#'
#' @param NFmin Number of participants failing the selection procedure from the minority group
#' @param NPmin Number of participants passing the selection procedure from the minority group
#' @param NFmaj number of participants failing the selection procedure from the majority group
#' @param NPmaj Number of participants passing the selection procedure from the majority group
#'
#' @return A vector containing the result
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
