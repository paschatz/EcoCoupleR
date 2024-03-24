\name{eco_coupling}
\alias{eco_coupling}
\title{Calculate Ecosystem Coupling}
\usage{
eco_coupling(data, data_str)
}
\arguments{
  \item{data}{
    A square, symmetrical matrix, output of \code{Hmisc::rcorr()}. We encourage the usage of \code{Hmisc::rcorr()} of the \code{Hmisc} package to calculate the correlation matrix because it returns a p-value matrix for each correlation.
    }
  \item{data_str}{
    A character string specifying the structure of the input data. Options include "dataframe", "matrix", or "list". If the input is a dataframe, it will be transformed to a matrix before calculating the ecological coupling. This bypasses the condition of the \code{Hmisc::rcorr()} function, which does not accept dataframes as input.
    }
}
\value{
The ecological coupling value is a measure of the strength of ecological interactions.
Returns a dataframe containing coupling values. If input is a list, the dataframe includes coupling values along with the names of the matrices.
If provided with a "matrix" or "dataframe", the dataframe will contain a single row with the coupling value.
}
\description{
This function calculates the ecological coupling for a correlation matrix or a list of correlation matrices.
}
\details{
The ecological coupling value is calculated as the absolute value of the correlation coefficients between all pairs of variables in the correlation matrix,
excluding self-correlations and double counts (matrix is symmetrical).
}
\examples{
# Example 1: Calculate ecological coupling for a single correlation matrix
correlation_matrix <- matrix(c(1, 0.6, 0.4, 0.6, 1, 0.8, 0.4, 0.8, 1), nrow = 3)
eco_coupling(correlation_matrix, data_str = "matrix")

# Example 2: Calculate ecological coupling for a list of correlation matrices
# list_of_matrices <- list(matrix1 = correlation_matrix1, matrix2 = correlation_matrix2)
# eco_coupling(list_of_matrices, data_str = "list")
}
\references{
Ochoa-Hueso, Raúl, Manuel Delgado-Baquerizo, Anita C. Risch, Maarten Schrama, Elly Morriën, S. Henrik Barmentlo, Stefan Geisen, et al. 2021.
“Ecosystem Coupling: A Unifying Framework to Understand the Functioning and Recovery of Ecosystems.” One Earth 4 (7): 951–66, https://doi.org/10.1016/j.oneear.2021.06.011.
}
\keyword{functions}
