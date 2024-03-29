% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ai_ztest.R
\name{ai_ztest}
\alias{ai_ztest}
\title{Z-score and p-value for a two-sample proportion test}
\usage{
ai_ztest(NFmin, NPmin, NFmaj, NPmaj)
}
\arguments{
\item{NFmin}{Number of participants failing the selection procedure from the minority group}

\item{NPmin}{Number of participants passing the selection procedure from the minority group}

\item{NFmaj}{Number of participants failing the selection procedure from the majority group}

\item{NPmaj}{Number of participants passing the selection procedure from the majority group}
}
\value{
A data frame containing the z-score and associated p-value.
}
\description{
This function calculates the Z-score and associated p-value for a two-sample proportion test
comparing the selection rates between minority and majority groups. The test helps assess
if there is a significant difference in the selection rates of the two groups.
}
\examples{
# Example data
NFmin <- 10 # Number of participants failing the selection procedure from the minority group
NPmin <- 5  # Number of participants passing the selection procedure from the minority group
NFmaj <- 30 # Number of participants failing the selection procedure from the majority group
NPmaj <- 15 # Number of participants passing the selection procedure from the majority group

# Perform the two-sample proportion test
result <- ai_ztest(NFmin, NPmin, NFmaj, NPmaj)
result
}
