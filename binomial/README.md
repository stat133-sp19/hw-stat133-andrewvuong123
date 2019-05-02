
<!-- README.md is generated from README.Rmd. Please edit that file -->
Overview
--------

`"binomial"` is a minimal [R](http://www.r-project.org/) package that provides functions for calculating probabilities of a Binomial random variable as well as relating calculations such as the probability distribution, the expected value, variance and more!

-   `bin_choose()` calculates the combinations for a binomial random variable.
-   `bin_probability()` calculates the probability for a binomial random variable.
-   `bin_distribution()` creates a data.frame for the probability distribution (of class `"bindis and data.frame"`).
-   `plot.bindis()` method for a `"bindis"` object to plot the histogram for a binomial distribution.
-   `bin_cumulative()` creates a data.frame for the probability distribution and cumulative probabilities (of class `"bincum and data.frame"`).
-   `plot.bincum()` method for a `"bincum"` object to graph the cumulative distribution.
-   `bin_variable()` creates a binomial random variable object (of class `"binvar"`).
-   `print.binvar()` method for a `"binvar"` object to print the contents of a binvar object.
-   `summary.binvar()` method for a `"binvar"` object (of class `"summary.binvar"`).
-   `print.summary.binvar()` method for a `"summary.binvar"` object to print the contents of a summary.binvar object.
-   `bin_mean()` calculates the mean for a binvar object.
-   `bin_variance()` calculates the variance for a binvar object.
-   `bin_mode()` calculates the mode for a binvar object.
-   `bin_skewness()` calculates the skewness for a binvar object.
-   `bin_kurtosis()` calculates the kurtosis for a binvar object.

Motivation
----------

This package has been developed to illustrate some of the concepts behind the creation of an R package.

Installation
------------

Install the development version from GitHub via the package `"devtools"`:

``` r
# development version from GitHub:
#install.packages("devtools") 
# install "binomial" (without vignettes)
devtools::install_github("andrewvuong123/cointoss")
# install "cointoss" (with vignettes)
devtools::install_github("andrewvuong123/cointoss", build_vignettes = TRUE)
```

Usage
-----

``` r
library(binomial)

# default binvar
trials <- 5
succeses <- 2
probability <- 0.5
bin_rv <- bin_variable(trials, probability)
bin_rv
#> "Binomial variable" 
#> 
#> Parameters 
#> - number of trials: 5 
#> - prob of success : 0.5

# summary of binvar
bin_rv_sum <- summary(bin_rv)
bin_rv_sum
#> "Summary Binomial" 
#> 
#> Parameters 
#> - number of trials: 5 
#> - prob of success : 0.5 
#> 
#> Measures 
#> - mean    : 2.5 
#> - variance: 1.25 
#> - mode    : 3 
#> - skewness: 0 
#> - kurtosis: -0.4

# Combinations
bin_choose(trials, succeses)
#> [1] 10

# Probability of binvar
bin_probability(succeses, trials, probability)
#> [1] 0.3125

# Binvar Distribution + Plotting
dis1 <- bin_distribution(trials, probability)
# plot by calling plot(dis1)

# Binvar Cumulative + Plotting
dis2 <- bin_cumulative(trials, probability)
#plot by calling plot(dis2)

# Various binvar functions of measures
bin_mean(trials, probability)
#> [1] 2.5
bin_variance(trials, probability)
#> [1] 1.25
bin_mode(trials, probability)
#> [1] 3
bin_skewness(trials, probability)
#> [1] 0
bin_kurtosis(trials, probability)
#> [1] -0.4
```
