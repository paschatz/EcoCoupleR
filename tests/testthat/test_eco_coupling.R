# Test code:
# Load package:

# Package dependencies:
packages <- c("tidyverse", "Hmisc")

# Load current library
library(EcoCoupleR)

# if not installed, install tidyverse and Hmisc
check_and_install_packages <- function(packages) {
  for (package in packages) {
    if (!require(package, character.only = TRUE)) {
      install.packages(package)
      library(package, character.only = TRUE)
    } else {
      library(package, character.only = TRUE)
    }
  }
}

# Call the function to check and install packages
check_and_install_packages(packages)

#Load data:
test_data <- read_csv("tests/testthat/test_data.csv")

# Manipulate data:
com_table_p4 <- test_data %>%
  select(-plot_year, -gn_code, -plot, -year, -cell, -block, -XX, -YY, -treatment) %>%
  # keep columns with col sum >0
  select_if(function(x) sum(x) > 0) %>%
  # keep rows with row sum >0
  filter(rowSums(.) > 0)

# Calcualte correlation
cor_list_rcorr <- rcorr(as.matrix(com_table_p4)) # of package Hmisc

# Either cor or rcorr works fine!
cor_matrix <- cor_list_rcorr$r # for rcorr function of Hmisc

# Calculate coupling using the eco_coupling function:
coup_new <- eco_coupling(cor_matrix, data_str = "matrix")
coup_new
n <- nrow(cor_matrix)

# Calculate coupling by manipulating the correlation matrix manually:
matrix_test <- cor_matrix

matrix_test[!upper.tri(matrix_test, diag = FALSE)] <- NA

coup_old  <- mean(as.matrix(abs(matrix_test)), na.rm = TRUE)
coup_old
