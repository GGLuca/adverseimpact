
#' Compute the marginal totals and all proportions
#'
#' This function calculates the the total sample size of the minority group and majority group,
#' the proportion of individuals with the feature in the minority and majority groups
#'
#' @param NFmin Number of non-selected individuals in the minority group
#' @param NPmin Number of selected individuals in the minority group
#' @param NFmaj Number of non-selected individuals in the majority group
#' @param NPmaj Number of selected individuals in the majority group
#'
#' @return
#' A dataframe with Number of individuals in the minority group (Nmin),
#' Number of individuals in the majority group (Nmaj)
#' Number of individuals in the failed group (Nfai)
#' Number of individuals in the passed group (Npas)
#' Total number of individuals (Ntot)
#' Success ratio in minority group (SRmin)
#' Success ratio in majority group (SRmaj)
#' Total success ratio (SRtot)
#' Proportion of individuals with feature in minority group (Pmin),
#' Proportion of individuals with feature in minority group (Pmaj),
#' Overall proportion of individuals with the feature (Ptot)
#'
#' @export
#'
#' @examples
#' NFmin <- 25
#' NPmin <- 75
#' NFmaj <- 100
#' NPmaj <- 300
#' ai_tot(NFmin, NPmin, NFmaj, NPmaj)
#'
ai_tot <- function(NFmin, NPmin, NFmaj, NPmaj) {
  # Calculate the total sample size of the minority group and majority group
  Nmin <- NFmin + NPmin # Number of individuals in the minority group
  Nmaj <- NFmaj + NPmaj # Number of individuals in the majority group

  # Calculate the total sample size of the failed group and passed group
  NFt <- NFmin + NFmaj  # Number of individuals in the failed group
  NPt <- NPmin + NPmaj  # Number of individuals in the passed group
  N <- NFt + NPt        # Total number of individuals

  # Calculate the success ration in minority and majority groups
  SRmin <- NPmin/Nmin   # Success ratio in minority group
  SRmaj <- NPmaj/Nmaj   # Success ratio in majority group
  SRt <- NPt/N          # Total success ratio

  # Calculate the proportion of individuals with the feature in the minority and majority groups
  Pmin <- NPmin / Nmin # Proportion of individuals with feature in minority group
  Pmaj <- NPmaj / Nmaj # Proportion of individuals with feature in majority group
  P <- (NPmin + NPmaj) / (Nmin + Nmaj) # Overall proportion of individuals with the feature

  return(data.frame(Nmin = Nmin, Nmaj = Nmaj,
                    Nfai = NFt, Npas = NPt, Ntot = N,
                    SRmin = SRmin, SRmaj = SRmaj, SRot = SRt,
                    Pmin = Pmin, Pmaj = Pmaj, Ptot = P))
}
