# private aux function that calculates the mean
aux_mean <- function(n, p) {
  return(n*p)
}

# private aux function that calculates the variance 
aux_variance <- function(n, p) {
  return(n*p*(1-p))
}

# private aux function that calculates the mode
aux_mode <- function(n, p) {
  m <- floor(n*p+p)
  return(m)
}
# private aux function that calculates the skewness value
aux_skewness <- function(n, p) {
  skew <- (1-2*p)/(sqrt(n*p*(1-p)))
  return(skew)
}

# private aux function that calculates the kurtosis of the distribution of a random variable
aux_kurtosis <- function(n, p) {
 kurtos <- (1-6*p*(1-p))/(n*p*(1-p))
 return(kurtos)
}
