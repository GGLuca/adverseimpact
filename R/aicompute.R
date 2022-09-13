#' Calculate Statistical and Practical Significance for AI Values
#'
#' @param NFmin Value2
#' @param NPmin Value5
#' @param NFmaj Value3
#' @param NPmaj Value2
#'
#' @return A vector containing parameter estimates
#' @export
#'
#' @examples pff <- aomg(dfadsfa)

ai.compute <- function(NFmin, NPmin, NFmaj, NPmaj)

{

  res    <- NFmin + NPmin + NFmaj + NPmaj
  Nmin   <- NFmin + NPmin
  Nmaj   <- NFmaj + NPmaj
  NFt    <- NFmin + NFmaj
  NPt    <- NPmin + NPmaj
  N      <- NFt   + NPt
  SRmin  <- NPmin / Nmin
  SRmaj  <- NPmaj / Nmaj
  SRt    <- NPt   / N

  #1. Z-test

  Zt     <- ((NPmin/Nmin)-(NPmaj/Nmaj)) / sqrt(SRt*(1-SRt)*(1/Nmin+1/Nmaj)) # (4.2)
  Zt_p   <- (1-pnorm(abs(Zt)))*2 # 2-tailed !

  #dhyper(NPmaj,Nmaj,Nmin,NPt)

  #2. LMP test

  FEThyp <- 0;

  for (i in 0:NPmin)
  {
    FEThyp<- FEThyp + dhyper(NPmaj + i, Nmaj, Nmin, NPt)
  } ## Computes FET one-tailed

  FEThyp <- FEThyp*2 # Multiplies *2 for FET two-tailed

  LMPhyp <- dhyper(NPmaj, Nmaj, Nmin, NPt)
  LMP    <- FEThyp-LMPhyp/2

  LMP

  #3 hstat

  hstat  <- 2*(asin(SRmaj)-asin(SRmin)) ## (osw. p. 107) - will be positive for significance; when negative no problem

  #ChiSq <- (N*(NFmin*NPmaj-NFmaj*NPmin)*(NFmin*NPmaj-NFmaj*NPmin))/(Nmin*Nmaj*NPt*NFt)
  #Phi <- sqrt(ChiSq/N)

  Phi1   <- (NFmin*NPmaj - NFmaj*NPmin)  ;
  Phi2   <- (NFmin*NPmaj - NFmaj*NPmin)  ;
  Phi1   <- Phi1/Nmin; Phi1 <- Phi1/Nmaj;
  Phi2   <- Phi2/NPt;  Phi2 <- Phi2/NFt ;
  Phi    <- Phi1*Phi2;
  Phi    <- sqrt(Phi)

  ##FFRule <- SRmin/SRmaj

  #SF <- (0.80*NPmaj*Nmin-NPmin*Nmaj)/(Nmaj+0.80*Nmin)

  SF     <- ceiling(SRmaj*Nmin) - NPmin

  #if (SF<0){SF <- 0}

  IR     <- SRmin / SRmaj # (4.7)

  res    <- cbind(Zt, Zt_p, LMP, hstat, Phi, SF, IR)

  return(res)
}
