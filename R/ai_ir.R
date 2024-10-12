#' Computes the Impact Ratio (IR) between minority and majority groups
#'
#' This function calculates the Impact Ratio (IR) by dividing the selection rate of the minority group (SRmin)
#' by the selection rate of the majority group (SRmaj). The IR helps assess the relative difference in selection
#' rates between the two groups.
#'
#' @param NFmin Number of participants failing the selection procedure from the minority group
#' @param NPmin Number of participants passing the selection procedure from the minority group
#' @param NFmaj Number of participants failing the selection procedure from the majority group
#' @param NPmaj Number of participants passing the selection procedure from the majority group
#'
#' @return A dataset representing the Impact Ratio (IR) between the minority and majority groups.
#' @export
#'
#' @examples
#' # Example data
#' NFmin <- 10 # Number of participants failing the selection procedure from the minority group
#' NPmin <- 5  # Number of participants passing the selection procedure from the minority group
#' NFmaj <- 30 # Number of participants failing the selection procedure from the majority group
#' NPmaj <- 15 # Number of participants passing the selection procedure from the majority group
#'
#' # Calculate the Impact Ratio
#' result <- ai_ir(NFmin, NPmin, NFmaj, NPmaj)
#' result

ai_ir <- function(NFmin, NPmin, NFmaj, NPmaj){
  #NFmin <- 10;  NPmin <- 5;  NFmaj <- 30; NPmaj <- 15

  # Extract total statistics
  ts <- ai_tot(NFmin, NPmin, NFmaj, NPmaj)

  IR <- ts$SRmin / ts$SRmaj
  return(data.frame(IR = IR))
}
