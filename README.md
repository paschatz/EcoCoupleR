
<!-- README.md is generated from README.Rmd. Please edit that file -->

# EcoCoupleR \<a <img src="sticker/ecocoupler_logo.png" align="right" height="138" /></a>

<!-- badges: start -->
<!-- badges: end -->

The goal of EcoCoupleR is to provide researchers with an intuitive tool
that will allow them to explore the potentialities of ecological
coupling theory.

## Installation

You can install the development version of EcoCoupleR from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("paschatz/EcoCoupleR")
```

## Short note:

This is an R package for calculating ecosystem coupling as has been
described by [Ochoa-Hueso et
al. (2021)](https://www.sciencedirect.com/science/article/pii/S2590332221003535?via%3Dihub).
This is an ongoing and under construction project. For the time being,
the package consists only of one function; `eco_coupling()`. In a
nutshell, `eco_coupling()` takes as an input a correlation matrix (or a
list of many matrices), trims the lower-diagonal, to avoid double
counting, removes self-correlations (the diagonal) and calculates a
sinlge ecosystem coupling value.

Please provide feedback and suggestions for future improvements.
