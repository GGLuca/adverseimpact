#' Adverse Impact Disparity Calculation
#'
#' @param NFmin Number of participants failing the selection procedure from the minority group
#' @param NPmin Number of participants passing the selection procedure from the minority group
#' @param NFmaj Number of participants failing the selection procedure from the majority group
#' @param NPmaj Number of participants passing the selection procedure from the majority group
#'
#' @return A dataset containing the absolute disparity (AD) and absolute impact (AI)
#' @export
#'
#' @examples
#' # Test cases
#' NFmin <- 1771
#' NPmin <- 338
#' NFmaj <- 25
#' NPmaj <- 532
#'
#' # Calculate the absolute disparity (AD) and absolute impact (AI)
#' disparity_result <- ai_disp(NFmin, NPmin, NFmaj, NPmaj)
#' print(disparity_result)
#'
ai_disp <- function(NFmin, NPmin, NFmaj, NPmaj) {

  # Calculate the total number of selected applicants (NPt) and total number of applicants (N)
  NPt <- NPmin + NPmaj
  N <- NFmin + NPmin + NFmaj + NPmaj

  # Calculate the proportion of selected minority applicants (p) out of the total selected applicants (NPt)
  p <- NPmin / NPt

  # Calculate the proportion of minority applicants (Nmin) out of the total number of applicants (N)
  pi <- (NFmin + NPmin) / N

  # Calculate the absolute disparity (AD) by subtracting the proportion of minority applicants (pi) from the proportion of selected minority applicants (p)
  AD <- p - pi

  # Calculate the absolute impact (AI) by multiplying the absolute disparity (AD) by the total number of selected applicants (NPt) and rounding up to the nearest whole number
  AI <- ceiling(AD * NPt)

  # Return the absolute disparity (AD) and absolute impact (AI)
  return(data.frame(AD=AD, AI=AI))
}
