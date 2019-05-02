
#' @title Bin Mean
#' @description Calculates the mean of the binomial distribution
#' @param n number of trials
#' @param p probability value
#' @return the mean value of np
#' @export
#' @examples
#' # mean of n=10, p=0.3
#' mean <- bin_mean(10, 0.3)
bin_mean <- function(n, p) {
  aux_mean(n, p)
}

#' @title Bin Variance
#' @description Calculates the variance of the binomial distribution
#' @param n number of trials
#' @param p probability value
#' @return the variance value of np(1-p)
#' @export
#' @examples
#' # variance of n=10, p=0.3
#' var <- bin_variance(10, 0.3)
bin_variance <- function(n, p) {
  aux_variance(n, p)
}

#' @title Bin Mode
#' @description Calculates the most likely number of successes in n independent trials with prob p
#' @param n number of trials
#' @param p probability value
#' @return the mode integer value
#' @export
#' @examples
#' # mode of n=10, p=0.3
#' mode <- bin_mode(10, 0.3)
bin_mode <- function(n, p) {
  aux_mode(n, p)
}

#' @title Bin Skewness
#' @description Calculates the asymmetry of the prob distribution of a random var about its mean
#' @param n number of trials
#' @param p probability value
#' @return the skewness value that is postive, negative or undefined
#' @export
#' @examples
#' # skewness of n=10, p=0.3
#' skew <- bin_skewness(10, 0.3)
bin_skewness <- function(n, p) {
  aux_skewness(n, p)
}

#' @title Bin Kurtosis
#' @description Calculates the measure of tailedness of the prob distribution of a random var
#' @param n number of trials
#' @param p probability value
#' @return the kurtosis value
#' @export
#' @examples
#' # kurtosis of n=10, p=0.3
#' kurt <- bin_kurtosis(10, 0.3)
bin_kurtosis <- function(n, p) {
  aux_kurtosis(n, p)
}
