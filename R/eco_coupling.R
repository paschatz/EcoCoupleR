# This is the generic function for calculating ecosystem coupling:
# Author/maintener/responsible: Paschalis Chatzopoulos
eco_coupling <- function(data, data_str) {

  ### Conditions:

  # Check if the data_str is valid:
  if (!data_str %in% c("matrix", "list", "dataframe")) {
    stop("Invalid data structure. Please specify 'matrix', 'list', or 'dataframe'.")
  }

  # Convert data to matrix if data_str is 'dataframe'"
  if (data_str == "dataframe") {
    if (!is.data.frame(data)) {
      stop("Input should be a dataframe.")
    }
    data <- as.matrix(data)
  }

  # Validate input data if matrix:
  if (data_str == "matrix") {
    if (!is.matrix(data)) {
      stop("Input should be a matrix.")
    }
    if (!isSymmetric(data)) {
      stop("The correlation matrix is not symmetrical.")
    }

    matrices <- list(data)

  } else {
    if (!is.list(data)) {
      stop("Input should be a list of correlation matrices.")
    }
    if (!all(sapply(data, is.matrix))) {
      stop("All elements in the list should be matrices.")
    }
    if (!all(sapply(data, isSymmetric))) {
      stop("All correlation matrices in the list should be symmetrical.")
    }
    matrices <- data
  }

  # Initialize a list to store coupling values
  coupling_values <- vector("numeric", length(matrices))


  ### Coupling calculations:

  # Iterate over each matrix in the list
  for (i in seq_along(matrices)) {
    # Get the number of rows in the correlation matrix
    n <- nrow(matrices[[i]])

    # Initialize the sum of correlations
    sum_correlation <- 0

    # Iterate over pairs of elements (i, j) to avoid self-correlation and double counting
    for (k in 1:(n - 1)) {
      for (l in (k + 1):n) {
        sum_correlation <- sum_correlation + abs(matrices[[i]][k, l])
      }
    }

    # Number of correlations
    n_correlations <- n * (n - 1) / 2

    # Normalize by the total number of correlations
    ecological_coupling <- sum_correlation / n_correlations

    # Store the coupling value in the list
    coupling_values[i] <- ecological_coupling
  }

  ### Store coupling:

  # Create a dataframe with coupling values
  coupling_df <- data.frame(coupling = coupling_values)

  # Return the dataframe with coupling values along with input names if input is a list
  if (data_str == "list") {
    coupling_df$matrix_Name <- names(data)
  }
  return(coupling_df)
}
